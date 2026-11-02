# 七项修改验证索引

- `control_final.log`：按键消抖、SW3、UI、首图提前显示、语音事件及尺寸提交。
- `dimensions_final.log`：四种实际尺寸、固定输出分辨率、帧内稳定。
- `video_final.log`：最终菜单、字幕、缩略图显示链。
- `seven_final.log`：4×波形、语音切页、背压下 320×240/1920×1080 逐像素结果。
- `audio_final.log`：最终文件读取路径下 22 个 WAV 测试场景。
- `fat_final.log`：最终 FAT/BMP 路径的 22 个正常/异常场景。
- `scaled_final.log`：最终 FAT+缩放链的 5 个正常/异常场景。
- `regression_final.log`：基础复位/SD/四银行数据通路和连续视频；其末尾 OSD 的旧范围断言失败已修订为新增文字的宽度，独立重跑结果见下一项。
- `osd_final.log`：修订后完整 OSD/转场套件通过，含逐像素 HDMI AXIS 与真实视频时序。
- `tb_background_display.v` / `run_background_test.sh`：后台完整图像写入和全屏预览构建，同时连续四帧显示的测试。运行返回：`PASS background loader + full preview + continuous 640x480 display: 4 frames, no collisions, overflow or underflow`；仿真结束时间 112870280000 ps。该结果保存在任务工具输出中。
- `seven_source_hashes.json`：最终待编译 HDL/约束快照摘要，用于确认构建期间源文件未变。
- `seven_changed_files.json`：相对于修改前 ZIP 的共享源码改动列表。

- `seven_changes_build_pipeline.log`：最终 RTL 的厂商综合/布局布线/初次 bitgen。
- `hold_eco.log` / `hold_eco.db`：修复两处短路径保持时间违例后的路由数据库。
- `bitgen_hold_eco.log` / `final_delivery_timing.rpt`：从修复后数据库生成最终 bit；SWNS +0.100 ns、HWNS +0.027 ns，STNS/HTNS 均为零。
- `rebuild_release.ps1`：完整构建、ECO、bitgen、校验与发布入口。
- `package_release.py`：核对 80 个源码/约束摘要和正时序裕量，将同一最终 bit 同步到工程及 release，并生成校验清单。

所有列出的最终回归日志均无 FAIL/FATAL；本次未上板烧录或验证实际显示器音频锁定时间。

## 菜单与白线修复补充（2026-10-28）

本节对应后续显示修复构建，前文七项修改的时序数值和摘要仅适用于原发布。

- `menu_after_compare.log`：修正后的厂商 RTL 优化网表与 RTL 四帧逐像素一致。
- `menu_decoder_equivalence.log`、`menu_digits_fix.log`：最终菜单与优化前 RTL 的四帧像素一致，数字译码覆盖全部 256 个百分比输入及 64 个秒数值。字形 ROM 已映射到 BRAM，菜单单独综合为 647 LUT 等效、3 BRAM。
- `write_handoff_fix.log`：忙/刷新启动门控及突发尾部占用测试。
- `background_integrity_fix.log`：完整后台写像素、预览构建和连续显示。
- `fourbank_fix.log`：四银行数据通路与真实视频时序。
- `video_fix.log`、`control_fix.log`、`scaler_fix.log`、`syntax_fix.log`：本次修改后的相关回归。
- `write_handoff_before.log`、`write_drain_before.log` 为旧代码预期失败；控制器不完整导出网表探索不纳入验证。
- `display_fix_source_hashes.json`：本次 80 个 HDL/约束摘要。
- `build_display_fix.log`、`fix_hold_display_fix.log`、`bitgen_display_fix.log`、`display_fix_timing.rpt`：本次构建、ECO 与交付时序。
- `rebuild_display_fix.ps1` / `package_display_fix.py`：本次独立构建及发布入口。

菜单错误已在综合流程的 RTL 优化网表中复现并修正；白线对应的读写交接风险已修正，实际消除效果仍需上板确认。

最终采用布局种子 1，`retry_display_route.log` 为成功的布局布线与初次 bitgen 记录。默认种子冲突见 `display_fix_route_fail_phy.log`，不作为通过记录。保持修正后交付时序 SWNS +0.110 ns、HWNS +0.024 ns，STNS/HTNS 均为 0。最终文件为 `release/workstation_v10_display_fix_20261028/workstation_v10_display_fix_20261028.bit`。
