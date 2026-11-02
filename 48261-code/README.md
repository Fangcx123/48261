# 多媒体系统比赛工程代码

本文件夹包含比赛工程的完整源码、IP、约束、工程配置、构建脚本、验证源码和运行资源。原始工程文件保持不变；本提交目录中的工程及部分辅助脚本已调整路径。文件夹可整体移动，内部目录结构需保留。

## 一、原工程提取范围

所有原始路径均相对于原工程根目录 `D:\FPGA\lab_ex5_i2s`。

| 原工程路径 | 提取内容 | 文件数 |
| --- | --- | ---: |
| `src/user_source/` | 保留 RTL、头文件、IP 配置、约束、在用初始化数据与 Python 脚本；移除 3 个未引用的历史音频文件 | 106 |
| `src/td_project_workstation_v10/al_ip/` | 完整复制：工程引用的 PLL、ROM 等 IP 文件 | 9 |
| `src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al` | TD 工程文件，将根路径改为相对路径 `.` | 1 |
| `verification/` | 所有原有 HDL、Python、Tcl、Shell、PowerShell 源码，以及配套模型、网表、测试数据和配置；排除可重新生成的运行产物及 4 份系统试音结果 | 407 |
| `doc/` | 精简保留：4 个 Python 工具脚本、4 张多分辨率图卡及配套 AUDIO.WAV | 9 |
| `release/workstation_v11_read_fix_20261029/` | 完整复制：现有发布 bit、最终时序报告、源文件哈希及原有验证记录 | 22 |
| 合计 | 从原工程提取的文件 | 554 |

`build.ps1` 和 `scripts/` 提供比赛工程的构建与检查入口。本说明列出源码范围、开发环境、构建步骤及演示资源位置。

提交目录未纳入的内容主要为 TD `_Runs/` 与运行日志、验证产生的 `.db`、`.vvp`、`.ppm`、`.bit`、`.bid`、`.area`、`.timing`、缓存及历史运行报告。现有发布目录中的最终 bit 与时序报告已保留。未删除任何 HDL、Python、Tcl、Shell 或 PowerShell 验证源文件。技术报告和授权书按比赛相应入口另行提交。`doc/` 已按要求移除历史说明、截图、旧音频、重复图集、压缩包、镜像及生成的元数据，仅保留工具脚本和一组演示资源。

## 二、工程入口与环境

- 工具：Anlogic Tang Dynasty 6.2.168116。
- 器件：EG4S20BG256。
- 顶层模块：`top`。
- 顶层文件：`src/user_source/hdl_source/top_tf_hdmi_audio.v`。
- 工程文件：`src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al`。
- 主时钟：50 MHz；引脚与时序约束位于 `src/user_source/constraints_source/`。
- 布局种子：5。

```text
48261-code/
├─ README.md
├─ build.ps1                       当前比赛工程的统一构建入口
├─ scripts/                        相对路径构建及检查脚本
├─ src/
│  ├─ user_source/                 全部源码、约束及初始化数据
│  └─ td_project_workstation_v10/
│     ├─ HDMI1.4b_Transmitter_v1.0.al
│     └─ al_ip/
├─ verification/                   验证代码、模型、测试数据及历史开发工具
├─ doc/                            4 个工具脚本、4 张图卡及配套语音
└─ release/                        原有最终发布结果
```

## 三、路径关系与完整构建

工程的 `../user_source/` 指向同级源码目录，`al_ip/` 指向工程自己的 IP 目录。保留的 115 个源码配套文件和 IP 文件逐字节一致，HDL 的 `include` 与 IP 初始化文件依赖已检查。厂商生成文件注释中的历史路径属于记录信息，不参与文件查找。

当前比赛工程使用根目录 `build.ps1`。脚本按自身位置解析工程与输出目录，自动查找 PATH 中的 TD；同时建立并在结束时释放临时盘符，以兼容 TD 对中文或含空格工作路径的处理。TD 关闭工程时会改写根路径，脚本在退出时恢复可移动的工程配置。

在 Windows PowerShell 中进入本文件夹后执行：

```powershell
# 仅检查引用及工程打开
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1 -Mode Check

# 仅执行综合
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1 -Mode Synthesis

# 完整构建：综合、布局布线、保持时间修复、最终配置生成
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1
```

如 TD 未加入 PATH，使用 `-TdExecutable` 指定本机安装目录中的 `bin/td_commands_prompt.exe`。例如：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1 -TdExecutable 'C:\Anlogic\TD\bin\td_commands_prompt.exe'
```

上例安装路径需替换为本机实际路径。

完整构建按 `scripts/build_v11.tcl` → `scripts/fix_hold_v11.tcl` → `scripts/bitgen_v11.tcl` 执行。最终下载文件为 `output/multimedia_system.bit`，最终时序报告为 `output/final_timing.rpt`，使用前应检查建立与保持时间结果。图形界面打开工程可查看源码与约束；一般的图形界面编译不会自动执行上述保持时间 ECO 步骤。

`verification/` 中各阶段的诊断、修改和发布工具一并保留，以提供全部代码。目录中的历史编号及设计名称保留原有含义；部分脚本需要当时的备份工程或重新生成的数据库，不能作为当前工程的统一构建入口。原有发布记录中的路径和哈希保留原始证据。

## 四、验证代码与资源工具

仿真依赖 Icarus Verilog 的 `iverilog`、`vvp`，部分数据生成/检查脚本需要 Python 3；Shell 入口可在 WSL 或 Linux 环境运行。主要验证入口包括：

```sh
sh verification/workstation_v10/run_seven_fast.sh
sh verification/workstation_v10/run_control_tests.sh
sh verification/workstation_v10/run_video_tests.sh
sh verification/workstation_v11/run_system_ctrl.sh
```

验证入口已经保留配套模型和测试数据。`verification/run_tests.sh` 为原有回归入口，覆盖范围与当前系统专项测试不同。`verification/run_verification.ps1` 可从 PowerShell 调用 WSL，已改为动态解析当前目录。

图片及语音工具主要位于：

- `doc/convert/`：保留 `convert_images_to_bmp.py`、`sync_to_sd.py` 和 `make_sd_image.py`。后两个是早期物理扇区方案的同步和无文件系统镜像工具，保留用于提供完整工具代码。当前 FAT32 方案直接按规定文件名复制图卡和语音；无需使用这两个历史工具。
- `doc/工位四步通_焊接图卡_v1/generate_cards.py`：图卡生成。
- `verification/workstation_v10/`：菜单/字幕字模生成、语音生成与重采样等工具。

图像生成脚本需要 Pillow；部分中文字模和语音工具使用 Windows 字体或系统语音组件。向 TF 卡写入前，应核对脚本参数与目标盘符。

## 五、实板演示资源

将以下目录中的 `PIC1.BMP` 至 `PIC4.BMP` 与 `AUDIO.WAV` 放到 FAT32 TF 卡根目录，保持文件名不变。精简后保留的演示资源为：

- `doc/工位四步通_焊接图卡_v1/工位四步通_TF四图_多分辨率/`：四张不同分辨率图卡。
- `doc/工位四步通_指导语音_v2/AUDIO.WAV`：与当前字幕和换页样本点配套的语音。

四张图卡依次为 320×240、640×480、1024×768 和 1920×1080，均为 24 位无压缩 BMP。语音文件为 48 kHz、16 位 PCM WAV。源码目录中的 ROM 音频数据不替代 TF 卡指导语音。`doc/` 仅保留这五个演示资源文件和四个 Python 工具脚本。旧语音重采样及历史发布脚本仍保留在 `verification/`，其中引用的旧 doc 输入数据已从本提交目录移除，需使用原工程资料才能复现这些历史操作。

现有发布文件位于 `release/workstation_v11_read_fix_20261029/`。其中 `manifest.json` 的 `hardware_tested: false` 是生成该发布记录时的历史状态；后续用户已确认功能全部正确。本次整理未重新进行实板测试，也未修改历史发布记录。

## 六、本次检查与大小限制

- 77 项工程文件引用存在；HDL 头文件及 IP 初始化数据路径检查通过。
- 保留的 115 个原有源码配套文件/IP 文件逐字节一致。
- 原有发布记录的 80 项源码哈希与当前提交源码全部一致。
- 在提交目录运行 TD 工程打开检查及门级综合，均通过。
- 波形增益/限幅/峰值保持、语音换页事件，以及 320×240 和 1920×1080 缩放逐像素比对通过。
- 本次未重新完成全流程布局布线、保持时间 ECO 与完整系统联合仿真；已有发布结果及其报告按原样提供。

上述检查在提交目录整理期间完成。整理过程的检查日志和辅助记录已移除；现有发布目录中的原始验证记录继续保留。后续运行 `build.ps1` 会自动创建 `output/` 存放日志和构建结果，并在工程目录生成 `_Runs/`。

提交文件夹须保持在 **200,000,000 字节以下**。在本文件夹打开 PowerShell，可使用以下命令统计实际大小：

```powershell
$packageBytes = (Get-ChildItem -LiteralPath . -Recurse -File -Force | Measure-Object -Property Length -Sum).Sum
'{0:N0} bytes ({1:N2} MB)' -f $packageBytes, ($packageBytes / 1000000)
$packageBytes -lt 200000000
```

最后一行返回 `True` 表示低于限制。后续编译和仿真会生成额外文件，上传前应重新统计大小。整体压缩本文件夹即可保留源码与依赖的目录关系。

## 七、历史音频精简记录

已移除 `src/user_source/hdl_source/python/` 中当前工程未引用的 `song_48k.mif`、`song_48k.mif.dath`、`1.wav`，以及 `verification/workstation_v10/voice_probe/` 中的 4 份系统试音 WAV，合计 28,074,768 字节。保留转换与试音脚本、在用 ROM 初始化数据及演示语音。历史网表、测试数据和发布结果继续保留。原工程对应文件未修改。

精简后再次检查 77 项工程引用并执行 TD 工程打开与综合，均通过。保留文件的哈希检查通过，原发布记录的 80 项源码哈希仍全部匹配；本轮未重新执行布局布线或实板测试。
