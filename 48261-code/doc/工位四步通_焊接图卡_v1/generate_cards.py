from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
import struct, json, hashlib, zipfile

ROOT = Path(__file__).resolve().parent
OUT = ROOT / 'TF卡文件'
OUT.mkdir(exist_ok=True)
S = 3
NAVY = '#102536'
INK = '#163344'
TEAL = '#087F83'
PAPER = '#F3F6F4'
GRAY = '#526973'
ORANGE = '#C96A18'
RED = '#BB4741'
FONT = 'C:/Windows/Fonts/msyh.ttc'
BOLD = 'C:/Windows/Fonts/msyhbd.ttc'

def font(size, bold=False):
    return ImageFont.truetype(BOLD if bold else FONT, round(size*S))

def rect(box, fill, outline=None, width=1, radius=0):
    box = tuple(round(v*S) for v in box)
    if radius:
        d.rounded_rectangle(box, radius=radius*S, fill=fill, outline=outline, width=width*S)
    else:
        d.rectangle(box, fill=fill, outline=outline, width=width*S)

def line(points, fill, width=2):
    d.line([(round(x*S), round(y*S)) for x,y in points], fill=fill, width=width*S, joint='curve')

def poly(points, fill):
    d.polygon([(round(x*S), round(y*S)) for x,y in points], fill=fill)

def ellipse(box, fill, outline=None, width=2):
    d.ellipse(tuple(round(v*S) for v in box), fill=fill, outline=outline, width=width*S)

def text(x,y,s,size=20,fill=INK,bold=False,center=False):
    f=font(size,bold)
    if center: x-=d.textlength(s,font=f)/S/2
    box=d.textbbox((x*S,y*S),s,font=f,anchor='lt')
    assert box[0]>=0 and box[2]<=640*S, (s,box)
    assert box[1]>=64*S and box[3]<360*S, (s,box)
    d.text((x*S,y*S),s,font=f,fill=fill,anchor='lt')

def arrow(x1,y1,x2,y2,color=TEAL):
    import math
    line([(x1,y1),(x2,y2)],color,3)
    a=math.atan2(y2-y1,x2-x1)
    poly([(x2,y2),(x2-9*math.cos(a-.5),y2-9*math.sin(a-.5)),(x2-9*math.cos(a+.5),y2-9*math.sin(a+.5))],color)

def base(n,title,sub,tip):
    global im,d
    im=Image.new('RGB',(640*S,480*S),NAVY);d=ImageDraw.Draw(im)
    rect((0,64,639,359),PAPER)
    rect((24,76,70,122),TEAL,radius=10)
    text(47,84,f'{n:02}',27,'white',True,True)
    text(85,76,title,31,bold=True)
    text(87,113,sub,17,GRAY)
    rect((24,312,616,350),'#E1ECE8',radius=7)
    text(38,321,tip,18,TEAL,bold=True)

def panel(x,w=184):
    rect((x,146,x+w,298),'white',outline='#DCE5E2',radius=9)

def board(cx,cy,w=90):
    rect((cx-w/2,cy,cx+w/2,cy+12),'#2B8B78',radius=2)
    rect((cx-16,cy-5,cx+16,cy),'#D5AA5B')
    line([(cx,cy-40),(cx,cy+18)],'#8B9BA5',6)

def iron(x,y,scale=1):
    # Tip at (x,y); shaft and insulated handle extend upward/right.
    poly([(x,y),(x+24*scale,y-15*scale),(x+19*scale,y-21*scale)],'#9EAAB0')
    line([(x+21*scale,y-18*scale),(x+48*scale,y-45*scale)],INK,11)
    line([(x+48*scale,y-45*scale),(x+57*scale,y-54*scale)],ORANGE,12)

def joint(cx,cy,kind='good'):
    board(cx,cy,110)
    if kind=='good':
        poly([(cx-22,cy-5),(cx-10,cy-12),(cx-5,cy-30),(cx+5,cy-30),(cx+10,cy-12),(cx+22,cy-5)],'#A1B4BF')
        line([(cx-20,cy-6),(cx-10,cy-14),(cx-6,cy-27)],'white',2)
    elif kind=='little':
        ellipse((cx-11,cy-13,cx+8,cy-3),'#A1B4BF')
        arrow(cx+43,cy-34,cx+11,cy-12,RED)

images=[]
base(1,'准备｜先把工位备好','工位四步通 · 焊接入门 · V1.0','先确认：工件断电，烙铁放在专用支架上。')
for x in (24,228,432):panel(x)
# A clamped circuit board.
rect((56,183,177,225),'#2B8B78',radius=5)
for x in (72,93,114,135,156):
    ellipse((x,192,x+5,197),'#D5AA5B');ellipse((x,209,x+5,214),'#D5AA5B')
for x in (48,170):rect((x,174,x+14,235),GRAY,radius=3)
line([(117,225),(117,241)],GRAY,5)
text(116,252,'断电并固定',22,bold=True,center=True)
# Iron stand.
rect((260,229,380,241),INK,radius=5)
line([(277,229),(296,205),(328,205),(346,229)],GRAY,5)
iron(287,220,1.15)
text(320,252,'备齐工具',22,bold=True,center=True)
# Fume extractor icon and airflow, no unsafe human gesture.
rect((475,174,556,234),INK,radius=8)
ellipse((492,181,540,229),'#D6E9E3')
for points in [[(516,185),(516,222)],[(498,204),(535,204)],[(502,190),(530,218)],[(530,190),(502,218)]]:line(points,TEAL,5)
arrow(449,203,469,203);arrow(562,203,590,203)
text(524,252,'开启排烟',22,bold=True,center=True)
images.append(im.resize((640,480),Image.Resampling.LANCZOS))

base(2,'操作｜看清先后顺序','通孔焊接示意 · 温度与时间按教师规程','移开后保持不动，让焊点自然冷却。')
for j in range(4):
    x=24+j*150;panel(x,142);cx=x+71
    text(x+12,155,str(j+1),19,TEAL,True)
    if j==0:board(cx,230,90)
    else:joint(cx,230)
    if j<3:iron(cx+6,222,.72)
    if j in (1,2):
        line([(cx-48,189),(cx-29,193),(cx-8,220)],ORANGE,3)
    if j==0:arrow(cx-38,186,cx-9,220)
    if j==1:arrow(cx-53,210,cx-20,221)
    if j==2:arrow(cx-20,187,cx-48,174)
    if j==3:arrow(cx+18,207,cx+46,178)
    a,b=[('同时加热','焊盘与引脚'),('送入焊锡','送到焊接处'),('先撤焊锡','保持工件稳'),('再移烙铁','等待冷却')][j]
    text(cx,253,a,21,bold=True,center=True);text(cx,279,b,17,GRAY,center=True)
images.append(im.resize((640,480),Image.Resampling.LANCZOS))

base(3,'对照｜发现问题先复核','外观示意 · 实际验收按教师标准','不只看亮不亮：检查润湿、连锡和漏焊。')
for x in (24,228,432):panel(x)
joint(116,229)
text(116,156,'参考形态',20,TEAL,True,True)
text(116,255,'焊料铺展',22,bold=True,center=True)
text(116,281,'引脚与焊盘连接',16,GRAY,center=True)
# Two adjacent pads bridged by solder.
rect((264,230,376,242),'#2B8B78',radius=2)
for cx in (297,343):
    rect((cx-16,225,cx+16,230),'#D5AA5B')
    line([(cx,195),(cx,247)],'#8B9BA5',6)
    poly([(cx-15,225),(cx-5,211),(cx+5,211),(cx+15,225)],'#A1B4BF')
line([(297,222),(343,222)],'#A1B4BF',9)
arrow(320,191,320,218,RED)
text(320,156,'连锡风险',20,RED,True,True)
text(320,255,'相邻焊点桥连',20,bold=True,center=True)
text(320,281,'确认是否非预期连接',16,GRAY,center=True)
joint(524,229,'little')
text(524,156,'焊料不足',20,ORANGE,True,True)
text(524,255,'连接不完整',22,bold=True,center=True)
text(524,281,'停下并请教师复核',16,GRAY,center=True)
images.append(im.resize((640,480),Image.Resampling.LANCZOS))

base(4,'收尾｜检查后再离开','完成焊接 ≠ 完成实训','复核通过再按规程测试；清点工具，清洁工位。')
for j,(title,sub) in enumerate([('检查焊点','查连锡、漏焊与连接'),('核对装配','核对位置、方向与极性'),('烙铁归架','关闭电源，待其冷却'),('整理工位','收集废料，工具归位')]):
    x=24+(j%2)*304;y=146+(j//2)*79
    rect((x,y,x+288,y+72),'white',outline='#DCE5E2',radius=8)
    ellipse((x+14,y+19,x+48,y+53),'#DDEFE8')
    line([(x+23,y+35),(x+30,y+42),(x+41,y+28)],TEAL,3)
    text(x+61,y+10,title,22,bold=True)
    text(x+61,y+42,sub,17,GRAY)
images.append(im.resize((640,480),Image.Resampling.LANCZOS))

reports=[]
for i,img in enumerate(images,1):
    path=OUT/f'PIC{i}.BMP'
    img.convert('RGB').save(path,'BMP')
    data=path.read_bytes()
    signature=data[:2];size,offset=struct.unpack_from('<I',data,2)[0],struct.unpack_from('<I',data,10)[0]
    dib,w,h,planes,bpp,compression=struct.unpack_from('<IiiHHI',data,14)
    assert (signature,w,h,planes,bpp,compression,offset,dib)==(b'BM',640,480,1,24,0,54,40)
    assert len(data)==size==921654
    with Image.open(path) as decoded:
        assert decoded.mode=='RGB' and decoded.tobytes()==img.tobytes()
    # Check positive-height bottom-up storage and BGR order against rendered pixels.
    for x,y in [(0,0),(30,80),(116,230),(639,479)]:
        pos=offset+(479-y)*1920+x*3
        assert data[pos:pos+3]==bytes(reversed(img.getpixel((x,y))))
    reports.append(dict(file=path.name,width=w,height=h,bits=bpp,compression=compression,pixel_offset=offset,bytes=size,orientation='bottom-up',sha256=hashlib.sha256(data).hexdigest()))
    img.save(ROOT/f'PIC{i}_预览.png')

sheet=Image.new('RGB',(1300,980),'#DAE3E0')
for j,img in enumerate(images):sheet.paste(img,(j%2*660,j//2*500))
sheet.save(ROOT/'四图总览.png')
# Hardware-shaped preview: geometry follows the existing 80x40 -> 160x120 pipeline.
thumb=Image.new('RGB',(320,240),NAVY)
for j,img in enumerate(images):
    small=img.resize((80,40),Image.Resampling.NEAREST)
    small.putdata([((r>>5)*255//7,(g>>5)*255//7,(b>>6)*255//3) for r,g,b in small.getdata()])
    thumb.paste(small.resize((160,120),Image.Resampling.NEAREST),(j%2*160,j//2*120))
thumb.save(ROOT/'缩略效果参考.png')
(ROOT/'格式检查.json').write_text(json.dumps(reports,ensure_ascii=False,indent=2),encoding='utf-8')
with zipfile.ZipFile(ROOT/'工位四步通_TF四图.zip','w',zipfile.ZIP_DEFLATED) as z:
    for p in sorted(OUT.glob('PIC*.BMP')):z.write(p,p.name)
print(json.dumps(reports,ensure_ascii=False,indent=2))
