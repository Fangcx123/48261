"""Read-only FAT32 image/Windows volume inspector; never formats or writes a card.

Usage: python inspect_fat32.py E:   OR   python inspect_fat32.py card.img
Windows raw-volume reads may require an administrator terminal.
"""
import argparse
import hashlib
import json
import re
import struct


def u16(b, o): return struct.unpack_from('<H', b, o)[0]
def u32(b, o): return struct.unpack_from('<I', b, o)[0]


class FAT32:
    def __init__(self, path):
        if re.fullmatch(r'[A-Za-z]:[\\/]?', path):
            path = '\\\\.\\' + path[:2]
        self.file = open(path, 'rb', buffering=0)
        self.partition = 0
        b = self.read(0)
        if b[510:] != b'\x55\xaa': raise ValueError('LBA0 signature is not 55AA')
        if not (u16(b, 11) == 512 and u16(b, 14) and u32(b, 36) and not u16(b, 17) and not u16(b, 22)):
            entries = [446+16*i for i in range(4)]
            entry = next((o for o in entries if b[o+4] in (0x0b, 0x0c) and u32(b, o+8) and u32(b,o+12)), None)
            if entry is None: raise ValueError('No primary FAT32 partition (0B/0C)')
            self.partition = u32(b, entry+8)
            partition_size = u32(b, entry+12)
            b = self.read(self.partition)
            if u32(b, 32) > partition_size: raise ValueError('BPB exceeds partition')
        if b[510:] != b'\x55\xaa': raise ValueError('BPB signature is not 55AA')
        self.spc, reserved, fats = b[13], u16(b, 14), b[16]
        fat_size, total, flags = u32(b, 36), u32(b, 32), u16(b, 40)
        if (u16(b, 11) != 512 or self.spc not in (1,2,4,8,16,32,64,128) or
            not reserved or fats not in (1,2) or u16(b,17) or u16(b,19) or u16(b,22) or u16(b,42) or
            not fat_size or fat_size > 0x1ffffff):
            raise ValueError('Unsupported/invalid FAT32 BPB')
        active = (flags & 15) if flags & 128 else 0
        if active >= fats: raise ValueError('Invalid active FAT')
        self.fat = self.partition + reserved + active*fat_size
        self.data = self.partition + reserved + fats*fat_size
        count = (self.partition+total-self.data)//self.spc
        self.maximum = count+1
        if (count < 65525 or self.maximum >= 0xffffff0 or fat_size*128 <= self.maximum or
            self.partition+total > 2**32):
            raise ValueError('Invalid FAT32 data/FAT capacity')
        self.root = u32(b,44)
        self.cache = {}

    def read(self, lba):
        self.file.seek(lba*512)
        b = self.file.read(512)
        if len(b) != 512: raise ValueError(f'Short sector at LBA {lba}')
        return b

    def check_cluster(self, cluster):
        if not 2 <= cluster <= self.maximum: raise ValueError(f'Invalid cluster {cluster:#x}')

    def next_cluster(self, cluster):
        address = self.fat + cluster//128
        if address not in self.cache: self.cache[address] = self.read(address)
        return u32(self.cache[address], (cluster % 128)*4) & 0x0fffffff

    def cluster_lba(self, cluster):
        self.check_cluster(cluster)
        return self.data + (cluster-2)*self.spc

    def directory(self):
        files, seen, current = {}, set(), self.root
        while True:
            self.check_cluster(current)
            if current in seen: raise ValueError('Root directory FAT loop')
            seen.add(current)
            if len(seen) > 1024: raise ValueError('Root exceeds FPGA 1024-cluster limit')
            for sector in range(self.spc):
                b = self.read(self.cluster_lba(current)+sector)
                for offset in range(0,512,32):
                    e=b[offset:offset+32]
                    if not e[0]: return files
                    if e[0]==0xe5 or e[11]&0xd8: continue
                    for number in range(1,5):
                        if e[:11]==f'PIC{number}    BMP'.encode() and number not in files:
                            files[number]=(u16(e,20)<<16 | u16(e,26),u32(e,28))
                if len(files)==4:return files
            current=self.next_cluster(current)
            if current>=0xffffff8:return files

    def inspect_file(self, cluster, size):
        if not 54<=size<=16*1024*1024:raise ValueError('File size outside FPGA limits')
        remaining, seen, chain, contents=size,set(),[],bytearray()
        while remaining:
            self.check_cluster(cluster)
            if cluster in seen:raise ValueError('File FAT loop')
            seen.add(cluster);chain.append(cluster)
            if len(chain)>32768:raise ValueError('File chain exceeds FPGA limit')
            for sector in range(self.spc):
                b=self.read(self.cluster_lba(cluster)+sector)
                contents.extend(b[:min(512,remaining)]);remaining=max(0,remaining-512)
                if not remaining:break
            cluster=self.next_cluster(cluster)
            if remaining and cluster>=0xffffff8:raise ValueError('Early FAT EOF')
        if cluster<0xffffff8:raise ValueError('Final cluster must have EOC (no extra preallocated chain)')
        b=contents
        offset,bf_size,dib=u32(b,10),u32(b,2),u32(b,14)
        width,height=struct.unpack_from('<ii',b,18)
        if (b[:2]!=b'BM' or (width,height)!=(640,480) or u16(b,26)!=1 or u16(b,28)!=24 or
            u32(b,30)!=0 or dib<40 or not max(54,14+dib)<=offset<=4096 or
            not offset+640*480*3<=bf_size<=size):
            raise ValueError('BMP must be 640x480 positive-height, planes=1, RGB24, uncompressed')
        fragments=1+sum(b!=a+1 for a,b in zip(chain,chain[1:]))
        return dict(bytes=size,clusters=len(chain),fragments=fragments,first_lba=self.cluster_lba(chain[0]),
                    pixel_offset=offset,sha256=hashlib.sha256(contents).hexdigest(),chain_preview=chain[:16])


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('image_or_volume')
    args=parser.parse_args()
    fs=FAT32(args.image_or_volume)
    try:
        entries=fs.directory()
        result=dict(partition_lba=fs.partition,sectors_per_cluster=fs.spc,fat_lba=fs.fat,
                    data_lba=fs.data,max_cluster=fs.maximum,files={})
        errors=[]
        for n in range(1,5):
            if n not in entries:result['files'][f'PIC{n}.BMP']='missing (skipped)';continue
            try:result['files'][f'PIC{n}.BMP']=fs.inspect_file(*entries[n])
            except ValueError as e:result['files'][f'PIC{n}.BMP']={'error':str(e)};errors.append(str(e))
        print(json.dumps(result,ensure_ascii=False,indent=2))
        if errors or not entries:raise SystemExit(1)
    finally:fs.file.close()


if __name__=='__main__':main()
