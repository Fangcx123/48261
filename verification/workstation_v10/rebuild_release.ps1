# Run after RTL changes have been tested and seven_source_hashes.json refreshed.
$ErrorActionPreference = 'Stop'
$v10Tool = 'D:\FPGA\TD\Anlogic\TD_6.2.1_Engineer_6.2.168.116\bin\td_commands_prompt.exe'
foreach ($v10Step in @('build_v10', 'fix_hold_v10', 'bitgen_hold_eco')) {
    $v10Script = (Join-Path $PSScriptRoot "$v10Step.tcl").Replace('\', '/')
    $v10Log = Join-Path $PSScriptRoot "$v10Step.log"
    & $v10Tool $v10Script *> $v10Log
    if ($LASTEXITCODE -ne 0 -or (Select-String -LiteralPath $v10Log -Pattern '\bERROR\b|\bFATAL\b' -Quiet)) {
        throw "TD failed: $v10Log"
    }
}
python -X utf8 (Join-Path $PSScriptRoot 'package_release.py')
if ($LASTEXITCODE -ne 0) { throw 'Release verification failed' }
