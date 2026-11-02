"""Package verified files without overwriting any previous candidate."""
from pathlib import Path
import json,shutil,re
from check_build import audit,ROOT,V,P,RUN,digest
def package(attempt):
    a=audit(attempt)
    release=ROOT/'release/media_v9_candidate_20261023'
    release.mkdir(exist_ok=False)
    bitname='lessons4to15_media_v9_candidate.bit'
    shutil.copy2(a['bit'],release/bitname)
    copies={V/f'td_build_attempt{attempt}.log':'td_build.log',RUN/'syn_1/run.log':'synthesis.log',RUN/'phy_1/run.log':'implementation.log',
      RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_pr.timing':'routed_timing.txt',
      RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_phy.area':'utilization.txt',
      ROOT/'doc/第十三至十五讲融合与全功能使用测试.md':'全功能使用与测试.md',ROOT/'doc/media_v9_menu_rtl.png':'media_v9_menu_rtl.png',
      P/'HDMI1.4b_Transmitter_v1.0.al':'project_snapshot.al.txt'}
    for name in ['audio_tests.log','output_tests.log','legacy_regression.log','new_tests.log','scaled_fat.log','control_tests.log','video_tests.log',
                 'reset_constraints_check.log','cdc_audit.log','compile_list_audit.log','build_audit.json','source_changes.json']:
        copies[V/name]=name
    for src,name in copies.items():shutil.copy2(src,release/name)
    for p in V.glob('*_exit.txt'):shutil.copy2(p,release/p.name)
    shutil.copytree(V/'media',release/'TF测试文件')
    shutil.copy2(ROOT/'verification/wav_v8/media/AUDIO.WAV',release/'TF测试文件/AUDIO.WAV')
    m=a['metrics_ns'];area=(RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_phy.area').read_text()
    resources={name:int(re.search(r'^#'+name+r'\s+(\d+)',area,re.M)[1]) for name in ['lut','reg','bram','dsp','pll']}
    text=f'''# 第四至十五讲 v9 候选构建记录

状态：**软件验证通过，等待实板验收**。本次未下载SRAM、烧Flash或写TF卡。

- 工程入口：`{P/'HDMI1.4b_Transmitter_v1.0.al'}`。
- bit：`{release/bitname}`。
- SHA256：`{a['bit_sha256']}`。
- 大小：{a['bit_bytes']}字节；生成时间（本机Asia/Shanghai）：{a['bit_time_local']}。
- TD6.2.168116，EG4S20BG256，top；最终第{attempt}次综合、布局布线及bitgen通过。
- 时序：Slow/Fast两角，路由SWNS={m['SWNS']:+.3f}ns、HWNS={m['HWNS']:+.3f}ns，STNS/HTNS均0；STA覆盖率99.99%。
- 资源：LUT {resources['lut']}/19600、REG {resources['reg']}/19600、BRAM9K {resources['bram']}/64、DSP {resources['dsp']}/29、PLL {resources['pll']}/4。
- 新旧共12个第十一至十五讲模块在.al和实际syn/phy .prj中各登记一次；路径均存在。
- 引脚与时序约束、历史release逐文件SHA256与本轮备份一致；最终路由复位及FIFO/参数同步级结构审计通过。未增加全局false path。

功能：1..2048宽高的正高度RGB24 BMP最近邻归一到640×480；四永久RGB888 SDRAM bank；四图80×40 RGB332内部预览缓存，显示成160×120四格；两键焦点选择、帧边界视图提交；B/C/V/P参数菜单；原FAT32、图片按键、自动轮播、OSD、计时、滚动字幕、手动淡入淡出、自动擦除、WAV循环和音频波形保留。

测试证据：旧完整回归（22个FAT32场景、启动/SD异常/四bank/完整视频/OSD/转场）；21类WAV场景加复位（日志22项PASS WAV）；七种尺寸缩放全帧golden；新FAT32缩放链路、padding/扩展头/IO恢复/末尾FAT错误/非法格式；UI真实消抖及长松开、缺图/单图、周期暂停恢复；稳定参数CDC及视图ACK；917,504组动态PCM增益；三整帧预览像素链、两整帧菜单/旁路。最终调度和输出回归已补跑，日志均无FATAL且退出0。

过程记录：attempt1资源超限；attempt2轮播周期实时乘法导致时序违例；attempt3时序通过后集成测试发现UI生成块前信号声明顺序问题，已修；attempt4为本包最终源码。前三次均未发布为候选。

限制：最近邻拉伸、不保持宽高比；预览降低颜色/细节，全屏RGB888；只有PIC1..PIC4；双线性/FFT/更多图片分页/参数Flash保存未实现。菜单参数复位恢复默认。WAV限48kHz/16位PCM单或双声道≤16MiB。仿真为扇区/SDRAM边界模型，加密IP电气、真卡/电源/HDMI听音仍须实板。原厂SDRAM位置调整、单条SDRAM时钟局部走线及加密IP告警保留，完整日志可查；外部IO延迟缺完整实测约束，不宣称零告警或硬件签核完成。

先按《全功能使用与测试.md》PROGRAM_SRAM验证，随后相同bit PROGRAM_FLASH，U39地址0；VERIFY_FLASH可省略。必须10次断电冷启动无需RST、30～60分钟稳定性通过后再标记实板验收。`TF测试文件`内文件是普通根目录文件，备份同名原文件后复制，不写裸盘镜像。

修改前完整备份：`D:\\FPGA\\backup_working_v8_before_lessons13to15_20261023`。全部旧备份和release仍保留。
'''
    (release/'BUILD_INFO.md').write_text(text,encoding='utf-8')
    files={str(p.relative_to(release)):{'bytes':p.stat().st_size,'sha256':digest(p)} for p in release.rglob('*') if p.is_file()}
    tests={str(p.relative_to(ROOT)):digest(p) for p in V.glob('*') if p.is_file() and p.suffix in ['.py','.v','.sh','.tcl','.ps1']}
    (release/'manifest.json').write_text(json.dumps({'version':'media_v9_candidate_20261023','software_verified':True,'board_verified':False,
        'files':files,'compile_sources':a['sources'],'verification_sources':tests},ensure_ascii=False,indent=2),encoding='utf-8')
    for rel,item in files.items():assert digest(release/rel)==item['sha256']
    print('PACKAGED',release,'SHA256',digest(release/bitname))
if __name__=='__main__':
    import sys
    package(int(sys.argv[1]))
