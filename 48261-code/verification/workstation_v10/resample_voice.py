from pathlib import Path
import sys
import wave
import numpy as np
from scipy.signal import resample_poly

src, dst = map(Path, sys.argv[1:3])
with wave.open(str(src), "rb") as w:
    if (w.getnchannels(), w.getsampwidth(), w.getframerate()) != (1, 2, 48000):
        raise SystemExit("expected the Huihui 48 kHz-header mono PCM input")
    samples = np.frombuffer(w.readframes(w.getnframes()), dtype="<i2").astype(np.float64)

out = resample_poly(samples, 3, 1)
peak = float(np.max(np.abs(out))) if len(out) else 0.0
if peak:
    out *= (32767.0 * 10 ** (-3.0 / 20.0)) / peak
out = np.clip(np.rint(out), -32768, 32767).astype("<i2")

with wave.open(str(dst), "wb") as w:
    w.setnchannels(1)
    w.setsampwidth(2)
    w.setframerate(48000)
    w.writeframes(out.tobytes())
