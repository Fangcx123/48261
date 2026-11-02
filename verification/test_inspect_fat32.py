"""Exercise the read-only card checker with temporary ordinary image files."""
from pathlib import Path
import hashlib
import json
import struct
import subprocess
import sys
import tempfile

from inspect_fat32 import FAT32

ROOT = Path(__file__).resolve().parent


def image_from_fixture(case):
    prefix = ROOT / 'fat32_fixtures' / case
    lbas = [int(v, 16) for v in prefix.with_name(case + '_lba.hex').read_text().split()]
    data = bytes.fromhex(prefix.with_name(case + '_data.hex').read_text())
    assert len(data) == 512 * len(lbas)
    temporary = tempfile.NamedTemporaryFile(prefix='checker_test_', suffix='.img', dir=ROOT, delete=False)
    try:
        for i, lba in enumerate(lbas):
            temporary.seek(lba * 512)
            temporary.write(data[i*512:(i+1)*512])
    finally:
        temporary.close()
    return Path(temporary.name)


path = image_from_fixture('full_640x480')
try:
    before = hashlib.sha256(path.read_bytes()).hexdigest()
    checked = subprocess.run([sys.executable, str(ROOT / 'inspect_fat32.py'), str(path)],
                             capture_output=True, text=True, check=True)
    result = json.loads(checked.stdout)
    assert result['sectors_per_cluster'] == 8
    files = result['files']
    assert files['PIC2.BMP'] == files['PIC4.BMP'] == 'missing (skipped)'
    for name in ('PIC1.BMP', 'PIC3.BMP'):
        assert files[name]['bytes'] == 54 + 640*480*3 + 17
        assert files[name]['pixel_offset'] == 54
        assert files[name]['clusters'] == files[name]['fragments'] > 1
    assert files['PIC1.BMP']['sha256'] == files['PIC3.BMP']['sha256']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == before
    # Change only this temporary image: reject an invalid final FAT entry.
    fs = FAT32(str(path))
    entries = fs.directory()
    cluster, size = entries[1]
    for _ in range((size + 4095)//4096 - 1):
        cluster = fs.next_cluster(cluster)
    fat_lba = fs.fat + cluster//128
    fs.file.close()
    with path.open('r+b') as image:
        image.seek(fat_lba*512 + (cluster % 128)*4)
        image.write(struct.pack('<I', 0x0ffffff7))
    rejected = subprocess.run([sys.executable, str(ROOT / 'inspect_fat32.py'), str(path)],
                              capture_output=True, text=True)
    assert rejected.returncode == 1 and 'Final cluster must have EOC' in rejected.stdout
finally:
    path.unlink()

for case, expected in (('bad_bpb', 'BPB'), ('root_loop', 'loop')):
    path = image_from_fixture(case)
    fs = None
    try:
        try:
            fs = FAT32(str(path))
            fs.directory()
        except ValueError as error:
            assert expected in str(error)
        else:
            raise AssertionError('Invalid image accepted: ' + case)
    finally:
        if fs is not None:
            fs.file.close()
        path.unlink()

print('PASS read-only FAT32 inspector: fragmented RGB24 image, missing files, unchanged image, invalid BPB/root loop/final FAT')
