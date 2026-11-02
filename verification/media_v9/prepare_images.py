"""Validate/convert ordinary BMP files and create local demo media. No disk imaging."""
import argparse,struct
from pathlib import Path
def check(path):
    p=Path(path);b=p.read_bytes()
    assert 54<=len(b)<=16*1024*1024,'文件大小须54字节至16 MiB'
    assert b[:2]==b'BM','不是BMP文件'
    size,off=struct.unpack_from('<I',b,2)[0],struct.unpack_from('<I',b,10)[0]
    dib,w,h,planes,bpp,compression=struct.unpack_from('<IiiHHI',b,14)
    assert 1<=w<=2048 and 1<=h<=2048,'仅支持1..2048宽高、正高度bottom-up BMP'
    assert planes==1 and bpp==24 and compression==0,'需要24位无压缩RGB BMP'
    assert dib>=40 and 14+dib<=off and 54<=off<=4096,'不支持的BMP头/像素偏移'
    row=(w*3+3)&~3
    assert off+row*h<=size<=len(b),'像素区不完整或文件大小字段错误'
    print(f'PASS {p}: {w}x{h}, RGB24, padding={row-w*3}, bytes={len(b)}')
def save(image,path):
    p=Path(path)
    if p.exists():raise FileExistsError(f'拒绝覆盖已有文件：{p}')
    p.parent.mkdir(parents=True,exist_ok=True);image.convert('RGB').save(p,format='BMP');check(p)
def demo(folder):
    from PIL import Image,ImageDraw
    out=Path(folder)
    paths=[out/f'PIC{i}.BMP' for i in range(1,5)]
    if any(p.exists() for p in paths):raise FileExistsError('示例目标已存在，请选择新目录')
    for i,(w,h) in enumerate([(320,240),(641,481),(1280,720),(640,480)],1):
        im=Image.new('RGB',(w,h));d=ImageDraw.Draw(im)
        for y in range(h):d.line((0,y,w-1,y),fill=((i*50)%256,y*255//h,255-y*255//h))
        for x in range(0,w,max(1,w//16)):d.line((x,0,x,h-1),fill='white',width=max(1,w//640))
        d.rectangle((0,0,w-1,h-1),outline='yellow',width=max(2,w//160))
        d.rectangle((w//20,h//20,w//3,h//4),fill='red')
        d.rectangle((w*2//3,h*3//4,w*19//20,h*19//20),fill='blue')
        d.text((w//20,h//3),f'PIC{i}  {w} x {h}  TOP',fill='white',font_size=max(16,w//24))
        save(im,paths[i-1])
if __name__=='__main__':
    a=argparse.ArgumentParser(description=__doc__)
    g=a.add_mutually_exclusive_group(required=True)
    g.add_argument('--check',nargs='+');g.add_argument('--demo');g.add_argument('--convert')
    a.add_argument('--output');v=a.parse_args()
    if v.check:
        for p in v.check:check(p)
    elif v.demo:demo(v.demo)
    else:
        if not v.output:a.error('--convert需要--output')
        from PIL import Image,ImageOps
        with Image.open(v.convert) as im:
            im=ImageOps.exif_transpose(im).convert('RGB')
            if max(im.size)>2048:im.thumbnail((2048,2048))
            save(im,v.output)
