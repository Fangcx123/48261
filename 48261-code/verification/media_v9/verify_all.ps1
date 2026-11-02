$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
Set-Location -LiteralPath $root
$wslProject = (& wsl.exe -- wslpath -a -u $root).Trim()
if ($LASTEXITCODE -ne 0 -or -not $wslProject) { throw 'Cannot resolve project path in WSL.' }
$tests = @(
    @('verification/run_tests.sh', 'legacy_regression', 'legacy'),
    @('verification/wav_v8/run_audio_tests.sh', 'audio_tests', 'audio'),
    @('verification/wav_v8/run_output_tests.sh', 'output_tests', 'output'),
    @('verification/media_v9/run_new_tests.sh', 'new_tests', 'new'),
    @('verification/media_v9/run_scaled_fat.sh', 'scaled_fat', 'scaled_fat'),
    @('verification/media_v9/run_control_tests.sh', 'control_tests', 'control'),
    @('verification/media_v9/run_video_tests.sh', 'video_tests', 'video')
)
foreach ($test in $tests) {
    Write-Host ('RUN ' + $test[0])
    $log = Join-Path $PSScriptRoot ($test[1] + '.log')
    & wsl.exe --cd $wslProject -- sh $test[0] *> $log
    $result = $LASTEXITCODE
    $result | Set-Content -LiteralPath (Join-Path $PSScriptRoot ($test[2] + '_exit.txt'))
    if ($result -ne 0) { throw "测试失败，查看 $log" }
    Write-Host ('PASS ' + $test[0])
}
Write-Host '全部软件仿真通过；这不代表TD时序或实板验收通过。'
