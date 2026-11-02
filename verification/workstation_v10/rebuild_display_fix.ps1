# Run after RTL changes have been tested and display_fix_source_hashes.json refreshed.
$ErrorActionPreference = 'Stop'
$v10Tool = 'D:\FPGA\TD\Anlogic\TD_6.2.1_Engineer_6.2.168.116\bin\td_commands_prompt.exe'
foreach ($v10Step in @('build_display_fix', 'fix_hold_display_fix', 'bitgen_display_fix')) {
    $v10Script = (Join-Path $PSScriptRoot "$v10Step.tcl").Replace('\', '/')
    $v10Log = Join-Path $PSScriptRoot "$v10Step.log"
    & $v10Tool $v10Script *> $v10Log
    if ($LASTEXITCODE -ne 0 -or (Select-String -LiteralPath $v10Log -Pattern '\bERROR\b|\bFATAL\b' -Quiet)) {
        throw "TD failed: $v10Log"
    }
    if ($v10Step -eq 'build_display_fix') {
        $v10Runs = Join-Path $PSScriptRoot '../../src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs'
        foreach ($v10Run in @('syn_1', 'phy_1')) {
            $v10RunLog = Join-Path $v10Runs "$v10Run/run.log"
            if (!(Test-Path -LiteralPath $v10RunLog) -or (Select-String -LiteralPath $v10RunLog -Pattern '\bERROR\b|\bFATAL\b' -Quiet)) {
                throw "TD implementation failed: $v10RunLog"
            }
        }
        if (!(Select-String -LiteralPath (Join-Path $v10Runs 'phy_1/run.log') -Pattern 'Generate bits file' -Quiet)) {
            throw 'Physical implementation did not finish bit generation'
        }
    }
}
python -X utf8 (Join-Path $PSScriptRoot 'package_display_fix.py')
if ($LASTEXITCODE -ne 0) { throw 'Release verification failed' }
