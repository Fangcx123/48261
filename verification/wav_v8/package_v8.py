"""Publish only after software gates pass; never overwrite previous release."""
from pathlib import Path
import json,shutil,hashlib
from datetime import datetime
from zoneinfo import ZoneInfo
from check_build import audit,ROOT,V,P,RUN,digest

def package(attempt):
    a=audit(attempt)
    release=ROOT/'release/wav_waveform_v8_candidate_20261023'
    release.mkdir(exist_ok=False)
    bitname='lessons4to12_fat32_wav_waveform_v8_candidate.bit'
    shutil.copy2(a['bit'],release/bitname)
    copies={
      V/f'td_build_attempt{attempt}.log':'td_build.log',
      RUN/'syn_1/run.log':'synthesis.log',RUN/'phy_1/run.log':'implementation.log',
      RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_pr.timing':'routed_timing.txt',
      RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_phy.area':'utilization.txt',
      V/'audio_tests.log':'audio_tests.log',V/'output_tests.log':'output_tests.log',
      V/'legacy_regression.log':'legacy_regression.log',V/'fat_final.log':'fat_final.log',
      V/'reset_constraints_check.log':'reset_constraints_check.log',V/'cdc_audit.log':'cdc_audit.log',
      V/'compile_list_audit.log':'compile_list_audit.log',
      V/'build_audit.json':'build_audit.json',V/'source_changes.json':'source_changes.json',
      ROOT/'doc/第十一十二讲WAV波形融合与测试步骤.md':'验收与回退说明.md',
      ROOT/'doc/wav_waveform_v8_preview.png':'wav_waveform_v8_preview.png',
      V/'media/AUDIO.WAV':'AUDIO.WAV',P/'HDMI1.4b_Transmitter_v1.0.al':'project_snapshot.al.txt'}
    for src,dst in copies.items():shutil.copy2(src,release/dst)
    m=a['metrics_ns']
    bit_time=datetime.fromtimestamp(Path(a['bit']).stat().st_mtime,ZoneInfo('Asia/Shanghai')).isoformat()
    text=f'''# 第四至十二讲融合 v8 候选：FAT32 WAV / 波形

- 状态：**软件验证通过，等待实板验收**。未下载SRAM、未烧录Flash、未写TF卡。
- bit完整路径：`{release/bitname}`
- SHA256：`{a['bit_sha256']}`
- 文件大小：{a['bit_bytes']}字节；生成时间（Asia/Shanghai）：{bit_time}。
- 器件EG4S20BG256，顶层top；TD 6.2.168116。构建尝试{attempt}；综合/布局布线/bitgen完整日志均成功，进程退出0，无unknown module/black box。
- 新工程：`{P/'HDMI1.4b_Transmitter_v1.0.al'}`。旧GUI原工程及其Runs保持原值；请关闭旧窗口后打开此新.al。全部6个新增RTL在.al及实际syn/phy编译.prj中登记且路径可解析。
- 原按键、TF/FAT32四图片预加载、四bank缓存、HDMI、OSD、字幕、时间戳、手动淡入淡出/自动擦除保留。
- 新增根目录AUDIO.WAV（48kHz/16位PCM/mono或stereo/≤16MiB）循环背景播放，碎片簇链、chunk解析、独立4096×32异步缓存、下溢静音与错误回退音调；新增最终PCM波形/峰值/音源色块，手动转场音量跟随alpha。
- 原卡无WAV时仍使用已验收图片及音调，不需要格式化或写裸盘镜像。示例AUDIO.WAV仅作为本地交付文件，需要验收音乐时再普通复制到卡根目录；不要覆盖已有文件。

| 最终路由后检查 | 结果 |
|---|---|
| 建立 SWNS / STNS | {m['SWNS']:.3f} / {m['STNS']:.3f} ns |
| 保持 HWNS / HTNS | {m['HWNS']:.3f} / {m['HTNS']:.3f} ns |
| 检查角 / STA覆盖率 | Slow + Fast / 99.99% |
| LUT / REG | 13771 / 19600；8722 / 19600 |
| BRAM9K / DSP / PLL | 35 / 64；9 / 29；2 / 4 |
| 引脚与时钟约束 | 与操作前相同；无新全局false path |
| 路由后复位 / FIFO Gray同步级结构 | PASS / PASS |

验证：原完整run_tests.sh回归通过；最终文件系统地址分级后22个FAT32/BMP场景补充回归通过；21个WAV场景与播放中复位通过，逐样本检查两个循环、双声道、大小端、回卷/流控/故障/恢复；3,584组PCM增益边界通过；三幅完整640×480波形逐像素及原OSD转场集成测试通过；SPI所有权与持续音频读请求下原按键/四bank回归通过。各入口退出码0，完整日志已复制到此目录。`build_audit.json`记录对应编译源码哈希。

限制：仿真使用SD扇区/SDRAM边界模型，加密HDMI/SDRAM IP未做完整电气链仿真；外部IO延迟缺实测完整约束；原SPI未新增CRC16验证。仍需真卡/HDMI听音、SRAM、Flash固化、10次冷启动及30～60分钟稳定性验收。时序正余量较小，修改源码/约束后需重新检查。

完整文件清单、课程差异、PROGRAM_SRAM逐步预期、PROGRAM_FLASH地址0/U39/VERIFY_FLASH可跳过、冷启动、异常排查与回退见 `验收与回退说明.md`，原件在工程doc目录。

完整备份：`D:\\FPGA\\backup_working_v7_before_wav_waveform_20261023`；备份内实际Runs bit SHA256：`f85f1fca548cbedfcced4a11e246e9448b632961de03849ec205aaa57e46275f`。历史release/v7 SHA256：`73ab095d59d39e6dd3f6214b0c41cccaef11c094da686018f0c1e456a0e7a224`。两者不同，均已保留；所有原release文件经逐文件SHA256比对未改变。
'''
    (release/'BUILD_INFO.md').write_text(text,encoding='utf-8')
    files={str(p.relative_to(release)):{'bytes':p.stat().st_size,'sha256':digest(p)} for p in release.rglob('*') if p.is_file()}
    tests={str(p.relative_to(ROOT)):digest(p) for p in V.glob('*') if p.is_file() and p.suffix in ['.py','.v','.sh','.tcl']}
    manifest={'version':'v8_candidate_20261023','software_verified':True,'board_verified':False,
              'files':files,'compile_sources':a['sources'],'verification_sources':tests}
    (release/'manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2),encoding='utf-8')
    print('PACKAGED',release,'SHA256',digest(release/bitname))
if __name__=='__main__':
    import sys
    package(int(sys.argv[1]))
