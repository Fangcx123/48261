"""Build sparse sector fixtures with real FAT32 geometry, never physical disks."""
from pathlib import Path
import struct

OUT = Path(__file__).parent / 'fat32_fixtures'
OUT.mkdir(exist_ok=True)
CASES = ['mbr_fragmented', 'superfloppy', 'spc8_root_sector2', 'root_cluster2',
         'partition2_activefat1', 'high_lba', 'missing_pic1', 'bad_bpb',
         'bad_signature', 'no_files', 'early_eof', 'range', 'loop', 'bad_bmp',
         'short_sector', 'timeout', 'fat_last_error', 'root_loop', 'extended_header',
         'ordinary_header', 'full_640x480', 'overrun']

def build(name):
    p = 0 if name == 'superfloppy' else (200000 if name == 'high_lba' else 2048)
    spc = 8 if name in ('spc8_root_sector2','full_640x480') else 1
    active = int(name == 'partition2_activefat1')
    reserved, fatsz, nfats, nclusters = 32, 600, 2, 70000
    fat = p + reserved + active*fatsz
    data = p + reserved + nfats*fatsz
    total = reserved + nfats*fatsz + nclusters*spc
    sectors = {}
    def sector(lba):
        return sectors.setdefault(lba, bytearray(512))
    def word(b, o, v): struct.pack_into('<H', b, o, v)
    def dword(b, o, v): struct.pack_into('<I', b, o, v)
    def entry(c, v): dword(sector(fat+c//128), (c%128)*4, v)
    def clba(c): return data+(c-2)*spc
    if p:
        m = sector(0);m[0:3] = b'\xeb\x58\x90'  # MBR jump is not a BPB!
        o = 446 + (16 if active else 0)
        m[o+4] = 0x0c;dword(m,o+8,p);dword(m,o+12,total)
        m[510:512] = b'\x55\xaa'
    b = sector(p);b[:3] = b'\xeb\x58\x90';b[3:11]=b'FATTEST '
    word(b,11,512);b[13]=spc;word(b,14,reserved);b[16]=nfats
    dword(b,32,total);dword(b,36,fatsz);word(b,40,0x81 if active else 0)
    dword(b,44,2);b[510:512]=b'\x55\xaa'
    if name == 'bad_bpb': word(b,11,1024)
    if name == 'bad_signature': b[510]=0
    entry(0,0x0ffffff8);entry(1,0x0fffffff);entry(2,0x0fffffff)
    root_lbas = [clba(2)]
    if name == 'spc8_root_sector2': root_lbas += [clba(2)+1]
    if name in ('root_cluster2','root_loop'):
        entry(2,400);entry(400,2 if name == 'root_loop' else 0x0fffffff)
        root_lbas += [clba(400)]
    for lba in root_lbas:
        r=sector(lba)
        for k in range(16): r[k*32]=0xe5
    r = sector(root_lbas[-1])
    # Full 11-byte matching, directory/volume/deleted/LFN filtering.
    for k,(fn,attr) in enumerate([(b'PIC1X   BMP',0x20),(b'PIC2    BMP',0x10),
                                 (b'PIC4    BMP',0x08),(b'PIC2    BMP',0x0f)]):
        r[k*32:k*32+11]=fn;r[k*32+11]=attr
    offset=4096 if name=='extended_header' else (54 if name in ('ordinary_header','full_640x480') else 1024)
    width,height=(640,480) if name=='full_640x480' else (4,400)
    pixels=width*height
    raw=bytearray(offset+pixels*3+17)
    raw[:2]=b'BM';dword(raw,2,offset+pixels*3);dword(raw,10,offset)
    dword(raw,14,108 if name=='extended_header' else 40)
    dword(raw,18,width);dword(raw,22,height);word(raw,26,1);word(raw,28,24)
    if name=='bad_bmp': word(raw,28,32)
    for j in range(pixels*3):raw[offset+j]=(j*13+7)&255
    n=(len(raw)+512*spc-1)//(512*spc)
    chain=[5,137,9,258,12,410,15,511,18,650,21,780,24,900,27,1000,30,1100][:n]
    if name=='full_640x480':chain=[1000+2*j for j in range(n)]
    for j,c in enumerate(chain):
        entry(c,chain[j+1] if j+1<len(chain) else 0x0fffffff)
        for s in range(spc):
            chunk=raw[(j*spc+s)*512:(j*spc+s+1)*512]
            if chunk: sector(clba(c)+s)[:len(chunk)]=chunk
    if name=='early_eof':entry(chain[0],0x0fffffff)
    if name=='range':entry(chain[0],nclusters+4)
    if name=='loop':entry(chain[1],chain[0])
    if name=='fat_last_error':entry(chain[-1],0x0ffffff7)
    if name not in ('no_files','root_loop'):
        for k,num in enumerate(([3] if name=='missing_pic1' else [1,3]),4):
            o=k*32;r[o:o+11]=f'PIC{num}    BMP'.encode();r[o+11]=0x21
            word(r,o+20,chain[0]>>16);word(r,o+26,chain[0]&65535);dword(r,o+28,len(raw))
    if name!='root_loop':r[6*32]=0
    lbas=sorted(sectors)
    (OUT/f'{name}_count.hex').write_text(f'{len(lbas):08x}\n')
    (OUT/f'{name}_lba.hex').write_text('\n'.join(f'{v:08x}' for v in lbas)+'\n')
    (OUT/f'{name}_data.hex').write_text('\n'.join(f'{v:02x}' for a in lbas for v in sectors[a])+'\n')
    return len(lbas)

if __name__=='__main__':
    for case in CASES:print(case,build(case))
