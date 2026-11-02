$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Speech
$text='欢迎使用工位四步通。四张图卡分别介绍准备、操作、对照和收尾。开始操作前，请确认安全事项，并遵循教师指导。'
$out=Join-Path $PSScriptRoot 'voice_probe'
New-Item -ItemType Directory -Force $out | Out-Null
foreach($name in @('Microsoft Huihui Desktop','Microsoft Huihui','Microsoft Kangkang','Microsoft Yaoyao')) {
 $safe=$name.Replace(' ','_');$p=Join-Path $out ($safe+'.wav')
 $s=New-Object System.Speech.Synthesis.SpeechSynthesizer;$s.SelectVoice($name)
 $f=[System.Speech.AudioFormat.SpeechAudioFormatInfo]::new(48000,[System.Speech.AudioFormat.AudioBitsPerSample]::Sixteen,[System.Speech.AudioFormat.AudioChannel]::Mono)
 $s.SetOutputToWaveFile($p,$f);$s.Speak($text);$s.Dispose()
 Write-Output "$name $p $((Get-Item $p).Length)"
}
