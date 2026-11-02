"""Sparse FAT32 sectors; operates on local test files only."""
from pathlib import Path
import struct
OUT=Path(__file__).with_name('scaled_fixtures');OUT.mkdir(exist_ok=True)
def build(name,w,h,offset=54):
    sectors={};p=2048;fat=p+32;data=fat+1200;spc=8
    def sec(a):return sectors.setdefault(a,bytearray(512))
    def u16(b,o,v):struct.pack_into('<H',b,o,v)
    def u32(b,o,v):struct.pack_into('<I',b,o,v)
    def ent(c,v):u32(sec(fat+c//128),(c%128)*4,v)
    def lba(c):return data+(c-2)*spc
    b=sec(0);b[450]=12;u32(b,454,p);u32(b,458,561232);b[510:512]=b'\x55\xaa'
    b=sec(p);b[:3]=b'\xeb\x58\x90';u16(b,11,512);b[13]=spc;u16(b,14,32);b[16]=2
    u32(b,32,561232);u32(b,36,600);u32(b,44,2);b[510:512]=b'\x55\xaa'
    ent(0,0xffffff8);ent(1,0xfffffff);ent(2,0xfffffff)
    row=(w*3+3)&~3;raw=bytearray(offset+row*h+17)
    raw[:2]=b'BM';u32(raw,2,len(raw)-17);u32(raw,10,offset);u32(raw,14,40)
    u32(raw,18,w);u32(raw,22,0xffffffff if name=='negative' else h);u16(raw,26,1);u16(raw,28,24)
    if name=='compressed':u32(raw,30,1)
    for y in range(h):
        for x in range(w):
            # Independent channel patterns in bottom-up file order.
            pos=offset+y*row+x*3
            raw[pos:pos+3]=bytes(((x+3*y)&255,(x*5+y)&255,(x*7+y*11)&255))
        raw[offset+y*row+w*3:offset+(y+1)*row]=b'\xa5'*(row-w*3)
    chain=[1000+2*j for j in range((len(raw)+4095)//4096)]
    for j,c in enumerate(chain):
        ent(c,chain[j+1] if j+1<len(chain) else (0xffffff7 if name=='latefat' else 0xfffffff))
        for s in range(spc):
            chunk=raw[(j*spc+s)*512:(j*spc+s+1)*512]
            if chunk:sec(lba(c)+s)[:len(chunk)]=chunk
    b=sec(lba(2))
    for j,num in enumerate((1,3)):
        off=j*32;b[off:off+11]=f'PIC{num}    BMP'.encode();b[off+11]=32
        u16(b,off+20,chain[0]>>16);u16(b,off+26,chain[0]&65535);u32(b,off+28,len(raw))
    keys=sorted(sectors)
    (OUT/f'{name}_count.hex').write_text(f'{len(keys):08x}\n')
    (OUT/f'{name}_lba.hex').write_text(''.join(f'{k:08x}\n' for k in keys))
    (OUT/f'{name}_data.hex').write_text(''.join(f'{v:02x}\n' for k in keys for v in sectors[k]))
    print(name,w,h,len(keys))
if __name__=='__main__':
    for name,w,h,offset in [('tiny',3,5,4096),('odd',641,481,54),('latefat',640,480,54),('negative',3,5,54),('compressed',3,5,54)]:build(name,w,h,offset)
