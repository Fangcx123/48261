# Run after RTL changes have been tested and seven_source_hashes.json refreshed.
$ErrorActionPreference = 'Stop'
$tdCommand = Get-Command td_commands_prompt.exe -ErrorAction SilentlyContinue
if ($tdCommand) { $v10Tool = $tdCommand.Source }
else {
    $tdGui = Get-Command td.exe -ErrorAction Stop
    $v10Tool = Join-Path (Split-Path $tdGui.Source) 'td_commands_prompt.exe'
}
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
