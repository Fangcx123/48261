"""Build the short voice from the already-verified clear v1 recording.

The v1 recording contains the exact opening and closing sentences needed by
the short script. Keeping those PCM frames avoids the malformed SAPI rate
conversion produced by the local speech synthesizer.
"""
from pathlib import Path
import wave

root = Path(__file__).resolve().parents[2]
src = root / "doc/工位四步通_指导语音_v1/AUDIO.WAV"
dst = root / "doc/工位四步通_指导语音_v2/AUDIO.WAV"

with wave.open(str(src), "rb") as w:
    params = w.getparams()
    if (params.nchannels, params.sampwidth, params.framerate) != (1, 2, 48000):
        raise SystemExit(f"unexpected v1 format: {params}")
    pcm = w.readframes(w.getnframes())

frame = params.sampwidth * params.nchannels
def cut(start_s, end_s):
    a = round(start_s * params.framerate) * frame
    b = round(end_s * params.framerate) * frame
    return pcm[a:b]

# v1 timing table: opening sentence, then the final safety sentence.
out = cut(0.0, 8.20) + cut(42.29, 48.5945)
dst.parent.mkdir(parents=True, exist_ok=True)
with wave.open(str(dst), "wb") as w:
    w.setparams(params)
    w.writeframes(out)
print(f"wrote {dst} ({len(out)//frame} frames, {len(out)/(frame*48000):.3f} s)")
