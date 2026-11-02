"""Sparse FAT32 images for RTL tests; never opens a physical drive."""
from pathlib import Path
import struct
OUT=Path(__file__).parent/'fixtures'
OUT.mkdir(exist_ok=True)
CASES=['mono','stereo','short','chunks','missing','bad_rate','bad_bits','bad_magic',
       'bad_align','bad_riff','no_data','odd_data','truncated','bad_fat','loop_fat',
       'short_sector','timeout','underflow','superfloppy','activefat','spc8']
def build(name):
    stereo=name in ('stereo','chunks','activefat','spc8')
    n=37 if name=='short' else 10000
    ch=2 if stereo else 1
    pcm=bytearray()
    for j in range(n):
        l=((j*173+1234)&65535)-32768
        r=((j*197+3456)&65535)-32768
        pcm+=struct.pack('<h',l)
        if stereo:pcm+=struct.pack('<h',r)
    fmt=struct.pack('<HHIIHH',1,ch,44100 if name=='bad_rate' else 48000,
                    96000*ch,7 if name=='bad_align' else 2*ch,24 if name=='bad_bits' else 16)
    def chunk(tag,data):return tag+struct.pack('<I',len(data))+data+(b'\0' if len(data)%2 else b'')
    chunks=chunk(b'fmt ',fmt+(b'\0\0' if name=='chunks' else b''))
    if name=='no_data':chunks+=chunk(b'JUNK',b'abcd')
    if name=='chunks':chunks=chunk(b'JUNK',b'x'*481)+chunks+chunk(b'LIST',b'odd')
    if name!='no_data': chunks+=chunk(b'data',pcm[:-1] if name=='odd_data' else pcm)
    raw=b'RIFF'+struct.pack('<I',len(chunks)+4)+b'WAVE'+chunks
    if name=='bad_magic':raw=b'RIFX'+raw[4:]
    if name=='bad_riff':raw=raw[:4]+struct.pack('<I',0xffffffff)+raw[8:]
    if name=='truncated':raw=raw[:-15]
    p=0 if name=='superfloppy' else 2048
    spc=8 if name=='spc8' else 1
    active=int(name=='activefat')
    fat=p+32+600*active;data=p+1232;total=1232+70000*spc
    sectors={}
    def sec(lba):return sectors.setdefault(lba,bytearray(512))
    def u16(b,o,v):struct.pack_into('<H',b,o,v)
    def u32(b,o,v):struct.pack_into('<I',b,o,v)
    def ent(c,v):u32(sec(fat+c//128),(c%128)*4,v)
    if p:
        m=sec(0);o=446+(16 if active else 0);m[o+4]=0x0c
        u32(m,o+8,p);u32(m,o+12,total);m[510:]=b'\x55\xaa'
    b=sec(p);b[:3]=b'\xeb\x58\x90';u16(b,11,512);b[13]=spc;u16(b,14,32);b[16]=2
    u32(b,32,total);u32(b,36,600);u16(b,40,0x81 if active else 0);u32(b,44,2);b[510:]=b'\x55\xaa'
    ent(0,0xffffff8);ent(1,0xfffffff);ent(2,0xfffffff)
    chain=[5+137*j for j in range((len(raw)+512*spc-1)//(512*spc))]
    for j,c in enumerate(chain):
        ent(c,chain[j+1] if j+1<len(chain) else 0xfffffff)
        for s in range(spc):
            piece=raw[(j*spc+s)*512:(j*spc+s+1)*512]
            if piece:sec(data+(c-2)*spc+s)[:len(piece)]=piece
    if name=='bad_fat':ent(chain[2],0xffffff7)
    if name=='loop_fat':ent(chain[2],chain[0])
    root=sec(data)
    # Reject look-alike names, directory, deleted and long-name entries.
    for i,(fn,attr) in enumerate([(b'AUDIOX  WAV',0x20),(b'AUDIO   WAV',0x10),(b'AUDIO   WAV',0x0f)]):
        root[i*32:i*32+11]=fn;root[i*32+11]=attr
    if name!='missing':
        o=96;root[o:o+11]=b'AUDIO   WAV';root[o+11]=0x20
        u16(root,o+26,chain[0]);u32(root,o+28,len(raw))
    lbas=sorted(sectors)
    (OUT/f'{name}_count.hex').write_text(f'{len(lbas):08x}\n')
    (OUT/f'{name}_lba.hex').write_text(''.join(f'{x:08x}\n' for x in lbas))
    (OUT/f'{name}_data.hex').write_text(''.join(f'{x:02x}\n' for l in lbas for x in sectors[l]))
    (OUT/f'{name}_meta.hex').write_text(f'{n:08x}\n{ch:08x}\n')
    return len(lbas)
if __name__=='__main__':
    for name in CASES:print(name,build(name))
