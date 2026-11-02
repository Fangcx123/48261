"""Package the checked TD result; run after build_lessons456.tcl and tests."""
from pathlib import Path
from datetime import datetime
import hashlib
import json
import re
import shutil

root = Path(__file__).resolve().parent.parent
project_name = "HDMI1.4b_Transmitter_v1.0"
runs = root / "src/td_project" / (project_name + "_Runs")
phy = runs / "phy_1"
release = root / "release"
timing = (phy / (project_name + "_pr.timing")).read_text(errors="replace")
build_log = (root / "verification/td_build.log").read_text(errors="replace")
test_log = (root / "verification/test_results.log").read_text(encoding="utf-8-sig")
reset_audit = (root / "verification/reset_constraints_check.log").read_text(encoding="utf-8")
values = {}
for key in ("SWNS", "STNS", "HWNS", "HTNS"):
    match = re.search(r"\b" + key + r":\s*([-\d.]+)ns", timing)
    if not match:
        raise SystemExit("Missing timing field: " + key)
    values[key] = float(match.group(1))
if values["SWNS"] < 0 or values["HWNS"] < 0 or values["STNS"] or values["HTNS"]:
    raise SystemExit("Timing violations remain; refusing release")
if "Run phy_1 success." not in build_log:
    raise SystemExit("TD build success not recorded")
implementation_log = (phy / "run.log").read_text(errors="replace")
syn_log = (runs / "syn_1/run.log").read_text(errors="replace")
if re.search(r"Command .* in .*timing\.sdc\(\d+\) fails", implementation_log + syn_log):
    raise SystemExit("Timing constraint failed to apply; refusing release")
if not all(x in test_log for x in (
    "PASS transition fade:", "PASS transition wipe:", "PASS OSD pixels:",
    "PASS OSD timer:", "PASS HDMI AXIS:", "PASS effects video:",
    "PASS effects scheduler:", "ALL OSD TRANSITION TESTS PASSED",
    "PASS fourbank video:", "PASS fourbank scheduler:", "PASS fourbank faults:", "PASS fourbank recovery:",
    "PASS fourbank datapath: 640x480 four banks, real asynchronous FIFOs, RGB/vertical flip, 128-word bursts, video alignment, gapped returns",
    "PASS fourbank read timeout:", "PASS fourbank underflow:", "PASS fourbank write overflow:",
    "ALL LESSONS456 UNIT TESTS PASSED", "PASS scheduler:",
    "PASS scan watchdog:", "PASS initialization watchdog:", "PASS frame FIFO:",
    "PASS SD startup:",
    "PASS board startup:",
    "PASS key mapping: KEY1 short next, long previous once, release suppression, KEY2 autoplay, readiness gate",
    "PASS SD R1 recovery: corrupt=1 drop=0 CMD55_error=0 late=0 ready_CMD55=1",
    "PASS SD R1 recovery: corrupt=0 drop=1 CMD55_error=0 late=0 ready_CMD55=1",
    "PASS SD R1 recovery: corrupt=0 drop=0 CMD55_error=1 late=0 ready_CMD55=0",
    "PASS SD R1 recovery: corrupt=0 drop=1 CMD55_error=1 late=1 ready_CMD55=1",
    "PASS FAT32 scheduler: missing-slot IDs, first available, next/previous skip, late FAT error preserves frame",
    "PASS FAT32 mount failure: error 9, no load",
    "PASS read-only FAT32 inspector: fragmented RGB24 image, missing files, unchanged image, invalid BPB/root loop/final FAT",
)):
    raise SystemExit("Required simulations not recorded")
fat32_cases = (
    "mbr_fragmented superfloppy spc8_root_sector2 root_cluster2 partition2_activefat1 "
    "high_lba missing_pic1 bad_bpb bad_signature no_files early_eof range loop bad_bmp "
    "short_sector timeout fat_last_error root_loop extended_header ordinary_header full_640x480 overrun"
).split()
for case in fat32_cases:
    if "PASS FAT32 " + case + ":" not in test_log:
        raise SystemExit("Missing FAT32 simulation: " + case)
if "PASS reset constraints: raw reset drives only 8 synchronizer SR inputs" not in reset_audit:
    raise SystemExit("Routed reset connectivity audit missing")
for fifo_clear in ("u_frame_loader/fifo_rst", "u_frame_reader/clear_fifo"):
    if "PASS FIFO reset constraints: " + fifo_clear + " drives only four reset synchronizer SR inputs" not in reset_audit:
        raise SystemExit("FIFO reset consumers not audited: " + fifo_clear)
if "FATAL:" in test_log:
    raise SystemExit("Simulation failure recorded; refusing release")

release.mkdir(exist_ok=True)
artifacts = {
    phy / (project_name + ".bit"): "lessons4to10_osd_transition_v7.bit",
    phy / (project_name + "_pr.timing"): "routed.timing",
    phy / (project_name + "_phy.area"): "resources.area",
    phy / "run.log": "implementation.log",
    runs / "syn_1/run.log": "synthesis.log",
    root / "verification/td_build.log": "td_build.log",
    root / "verification/test_results.log": "test_results.log",
    root / "verification/cmd55_before_fix.log": "cmd55_before_fix.log",
    root / "verification/reset_constraints_check.log": "reset_constraints_check.log",
    root / "doc/convert/fat32_card_files.json": "fat32_card_files.json",
}
for source, name in artifacts.items():
    shutil.copy2(source, release / name)

area = (release / "resources.area").read_text(errors="replace")
resources = {}
for key in ("lut", "reg", "bram", "dsp", "pll"):
    match = re.search(r"^#" + key + r"\s+(\d+)\s+out of\s+(\d+)\s+([\d.]+)%", area, re.M)
    if not match:
        raise SystemExit("Missing resource field: " + key)
    resources[key] = f"{match[1]} / {match[2]} ({match[3]}%)"
coverage = re.search(r"STA coverage\s*:\s*([\d.]+%)", timing)[1]

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

source_files = [root / "src/td_project" / (project_name + ".al")]
source_files += sorted(p for p in (root / "src/user_source").rglob("*")
                       if p.is_file() and p.suffix.lower() in (".v", ".vh", ".sdc", ".adc", ".ipc"))
bit = release / "lessons4to10_osd_transition_v7.bit"
# Preserve the user's working previous release and its historical alias.
v4_sha = "f9465248a7e6b53b9f4097bce4933a883700fa5f2bcb051338806bdf789fbd79"
for name in ("lessons456_keys_v4.bit", "lessons456_final.bit"):
    if digest(release / name) != v4_sha:
        raise SystemExit("Historical v4 bit unexpectedly changed: " + name)
v5_bit = release / "lessons4567_fat32_v5.bit"
if digest(v5_bit) != "23bd7f09cb6868c8ba5893d12263a2dc89e827b61a943b04688179d2d4d13b4f":
    raise SystemExit("Historical v5 bit unexpectedly changed")
v6_bit = release / "lessons45678_fourbank_v6.bit"
if digest(v6_bit) != "542104e77b7e75519ee71cf4e04f0e0ee55bf2ce90e9b3558090d99d604cd239":
    raise SystemExit("Hardware-verified v6 fallback unexpectedly changed")
manifest = {
    "device": "EG4S20BG256",
    "tool": "Tang Dynasty v6.2.168116",
    "packaged_at": datetime.now().astimezone().isoformat(timespec="seconds"),
    "bit_built_at": datetime.fromtimestamp(bit.stat().st_mtime).astimezone().isoformat(timespec="seconds"),
    "timing_ns": values,
    "hardware_verified": False,
    "revision": "osd-transition-v7-lessons4to10",
    "card_layout": "FAT32, root PIC1.BMP through PIC4.BMP (not the legacy raw TF image)",
    "fat32_simulation_cases": fat32_cases,
    "historical_bits": {p.name: {"sha256": digest(p), "use": "user-verified FAT32 four-bank v6" if p == v6_bit else "FAT32 dual buffer v5" if p == v5_bit else "legacy card layout; not v7"}
                        for p in sorted(release.glob('*.bit')) if p != bit},
    "artifacts": {name: {"bytes": (release/name).stat().st_size, "sha256": digest(release/name)}
                  for name in artifacts.values()},
    "source_snapshot_sha256": {str(p.relative_to(root)).replace("\\", "/"): digest(p)
                               for p in source_files},
    "verification_source_sha256": {str(p.relative_to(root)).replace("\\", "/"): digest(p)
                                   for p in sorted((root / "verification").iterdir())
                                   if p.is_file() and (p.name.startswith("tb_") or
                                   p.suffix in (".py", ".sh", ".tcl"))},
}
(release / "manifest.json").write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
(release / "BUILD_INFO.md").write_text(f"""# 第四至十讲融合构建结果（OSD / 转场 v7）

- 最新下载文件：`lessons4to10_osd_transition_v7.bit`，{bit.stat().st_size} 字节。
- SHA256：`{digest(bit)}`。
- bit 生成时间：{manifest['bit_built_at']}。
- 器件 EG4S20BG256，顶层 top；TD 6.2.1 Engineer / v6.2.168116。
- 四个固定逻辑帧区，每区 307200 个 32 位字。开机预加载所有可用图片，再在帧边界提交；之后 KEY1 和轮播只切 SDRAM bank，不再加载 TF。
- 独立 loader/reader，原厂异步 FIFO，128 字批次，按真实读返回计数等待，错误 C/D/E/F 诊断。RGB 在 [31:8]；沿用既有 video_delay 对齐及 BMP 行翻转。
- 保留 FAT32、KEY1 短按松开下一张/长按一次上一张、KEY2 松开开关轮播、HDMI 音视频联动及既有冷启动修复。
- 新增：状态 OSD、参数文字、半透明底带滚动字幕 FPGA PLAYER、MM:SS 时钟计时。手动 16 帧淡出、黑屏换 bank、16 帧淡入；自动 16 帧从黑底左向右擦除；转场完成才返回源域 ACK。
- 修正 RGB 转 AXIS 的 EOL 偏一像素；补齐 B/C/D 字模，运行计时按 25 MHz 计秒。仅一个成功 bank 时不接受换图请求。
- 新增仿真：逐像素检查五个 640×480 帧、RGB/VS/DE 对齐及保真、状态帧锁存/跨域、滚动、时间进位、HDMI 行末与帧首；真实视频时序/FIFO/读返回模型下验证手动/自动转场及无撕裂、无下溢。
- 仿真：原有回归和 {len(fat32_cases)} 个 FAT32 场景通过；四 bank 调度、缺图/坏图/末尾 FAT、缓存按键和轮播通过；真实 FIFO RTL 下四张 640×480 共 1228800 像素全部写入和读出逐像素核对，128 字批次、视频延迟链、间歇返回、丢返回超时、下溢及写溢出检测通过；真实视频时序的黑屏握手、首次显示与帧边界换 bank 集成仿真通过。
- 复位约束：专用系统 reset_source_n 仅驱动八个复位同步器 SR；两个 FIFO 原始清零网络各仅驱动四个内部复位同步器 SR。路由后已核对，无全局跨时钟例外，级间和后级路径仍检查。
- TF：FAT32 根目录 PIC1.BMP～PIC4.BMP；不要写旧 lessons456_tf.img。
- 用户已验证的 v6 bit 保持原 SHA256，可配同一张 FAT32 卡回退；lessons456_final.bit 仍为旧 v4，不能当新版。
- 完整修改、SRAM/Flash 下载和实板验收见 [第九十讲OSD转场融合与测试步骤](../doc/第九十讲OSD转场融合与测试步骤.md)。
- **未进行真实板卡验收**：仿真使用 SDRAM 边界模型，不包括加密 SDRAM/HDMI IP 全电气链路；仍需验证卡兼容性、画面、听音、30～60 分钟轮播和 10 次 Flash 冷启动。VERIFY_FLASH 可跳过。

| 路由后检查 | 结果 |
| --- | --- |
| 建立时间 SWNS / STNS | {values['SWNS']:.3f} ns / {values['STNS']:.3f} ns |
| 保持时间 HWNS / HTNS | {values['HWNS']:.3f} ns / {values['HTNS']:.3f} ns |
| 检查角 | Slow + Fast |
| STA coverage | {coverage} |
| LUT | {resources['lut']} |
| 寄存器 | {resources['reg']} |
| BRAM | {resources['bram']} |
| DSP / PLL | {resources['dsp']}；{resources['pll']} |

当前约束下无建立/保持违例；板级 IO 时序未完整约束，软件通过不代替实板测试。
保留厂商 IP 的位置调整、局部时钟和部分位宽/未驱动告警，详见综合和实现日志。
时钟：输入 50 MHz；控制 100 MHz；SDRAM 41.666667 MHz（24 ns，0/180°）；像素 25 MHz；串行 125 MHz。
`manifest.json` 记录发布文件、历史 bit、工程和测试源码哈希；源码修改后应重新测试、编译和打包。
修改前已验证 v6 备份：`D:/FPGA/backup_working_v6_before_osd_transition_20261022`。
""", encoding="utf-8")
print(json.dumps({"bit": str(bit), "sha256": digest(bit), "timing_ns": values}, ensure_ascii=False))
