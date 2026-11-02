"""Generate/check a local WAV for v8. Never mounts or writes a TF device.

python prepare_audio.py --demo <local-output.wav>
python prepare_audio.py --check <existing.wav>
python prepare_audio.py --convert <input.wav> --output <local-output.wav>
Conversion accepts integer PCM WAV (8/16/24/32-bit, mono/stereo), resamples
linearly to 48 kHz, and preserves channel count. Use a proper audio editor
for high-fidelity sample-rate conversion; this tool is for board test media.
"""
from pathlib import Path
import argparse, math, struct, wave, hashlib

def check(path):
    path=Path(path)
    with wave.open(str(path),'rb') as f:
        info={'channels':f.getnchannels(),'rate':f.getframerate(),'bits':8*f.getsampwidth(),
              'frames':f.getnframes(),'compression':f.getcomptype()}
    assert info['channels'] in (1,2) and info['rate']==48000 and info['bits']==16 and info['compression']=='NONE',info
    assert 44<path.stat().st_size<=16777216,'WAV must be nonempty and at most 16 MiB'
    print(path.resolve(),info,'SHA256='+hashlib.sha256(path.read_bytes()).hexdigest())
    return info

def save(path,ch,frames):
    path=Path(path)
    if path.exists():raise FileExistsError(f'Refuse overwrite: {path}')
    path.parent.mkdir(parents=True,exist_ok=True)
    with wave.open(str(path),'wb') as f:
        f.setnchannels(ch);f.setsampwidth(2);f.setframerate(48000);f.writeframes(frames)
    check(path)

def demo(path):
    pcm=bytearray()
    for i in range(480000):
        t=i/48000
        # Left 440 Hz / right 660 Hz, slow envelope + 20 ms loop fade.
        gain=(0.55+0.4*math.sin(2*math.pi*t/5))*min(1,i/960,(479999-i)/960)
        pcm+=struct.pack('<hh',int(22000*gain*math.sin(2*math.pi*440*t)),int(22000*gain*math.sin(2*math.pi*660*t)))
    save(path,2,pcm)

def convert(src,dst):
    with wave.open(str(src),'rb') as f:
        ch,sw,rate,n=f.getnchannels(),f.getsampwidth(),f.getframerate(),f.getnframes()
        assert ch in (1,2) and sw in (1,2,3,4) and f.getcomptype()=='NONE','Integer PCM mono/stereo WAV required'
        raw=f.readframes(n)
    assert n>0 and rate>0
    count=n*48000//rate
    assert count*ch*2+44<=16777216,'Converted WAV exceeds 16 MiB'
    def sample(frame,c):
        offset=(frame*ch+c)*sw;b=raw[offset:offset+sw]
        return (b[0]-128)*256 if sw==1 else int.from_bytes(b,'little',signed=True)/(1<<(8*sw-16)) if sw>=2 else 0
    pcm=bytearray()
    for i in range(count):
        pos=i*rate/48000;a=min(int(pos),n-1);b=min(a+1,n-1);frac=pos-a
        for c in range(ch):
            value=round(sample(a,c)*(1-frac)+sample(b,c)*frac)
            pcm+=struct.pack('<h',max(-32768,min(32767,value)))
    save(dst,ch,pcm)

if __name__=='__main__':
    p=argparse.ArgumentParser();g=p.add_mutually_exclusive_group(required=True)
    g.add_argument('--demo',type=Path);g.add_argument('--check',type=Path);g.add_argument('--convert',type=Path)
    p.add_argument('--output',type=Path);a=p.parse_args()
    if a.demo:demo(a.demo)
    elif a.check:check(a.check)
    elif not a.output:p.error('--convert requires --output')
    else:convert(a.convert,a.output)
