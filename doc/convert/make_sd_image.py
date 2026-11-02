"""Build a sector-aligned raw TF image as an ordinary local file.

Never opens or writes a physical drive. The FPGA scans raw sectors, not FAT.
Usage: python make_sd_image.py --output lessons456_tf.img output_bmp/0.bmp ...
"""
import argparse
import hashlib
import json
import struct
from pathlib import Path


def validate(path):
    data = path.read_bytes()
    if len(data) < 54 or data[:2] != b"BM":
        raise ValueError(f"Not a BMP: {path}")
    size, offset = struct.unpack_from("<I", data, 2)[0], struct.unpack_from("<I", data, 10)[0]
    dib, width, height, planes, bits, compression = struct.unpack_from("<IiiHHI", data, 14)
    if (width, height, planes, bits, compression) != (640, 480, 1, 24, 0):
        raise ValueError(f"Need 640x480 bottom-up RGB24 BI_RGB: {path}")
    if not (40 <= dib <= offset - 14 and 54 <= offset <= 4096 and
            offset + width * height * 3 <= size <= min(len(data), 16777216)):
        raise ValueError(f"Invalid header/file bounds: {path}")
    # Use bfSize to match the hardware scanner's next-file sector calculation.
    return data[:size]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("bmp", type=Path, nargs="+")
    args = ap.parse_args()
    if not 1 <= len(args.bmp) <= 4:
        ap.error("Supply 1 to 4 BMP files, in display order")
    out = args.output.resolve()
    # Reject device paths and require a new ordinary .img file in a directory.
    if out.suffix.lower() != ".img" or not out.parent.is_dir() or str(out).startswith("\\\\"):
        ap.error("Output must be a new local .img file in an existing directory")
    blocks = [validate(p) for p in args.bmp]
    image = bytearray(8 * 1024 * 1024)
    sector, entries = 0, []
    for i, (path, data) in enumerate(zip(args.bmp, blocks), 1):
        start = sector * 512
        image[start:start + len(data)] = data
        entries.append(dict(display_number=i, source=str(path.resolve()),
                            start_sector=sector, bytes=len(data)))
        sector += (len(data) + 511) // 512
    with out.open("xb") as f:
        f.write(image)
    report = dict(format="raw sectors; NO filesystem", image=str(out),
                  bytes=len(image), sha256=hashlib.sha256(image).hexdigest(), images=entries)
    manifest = out.with_suffix(".json")
    manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
