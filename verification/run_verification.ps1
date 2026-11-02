$ErrorActionPreference = 'Stop'
# Run the full WSL regression from PowerShell and preserve its UTF-8 log.
# Preserve the simulator exit code and use UTF-8 for package_release.py.
$verificationDir = $PSScriptRoot
$wslProject = '/mnt/d/FPGA/lab_ex5_i2s'
$logPath = Join-Path $verificationDir 'test_results.log'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$writer = New-Object System.IO.StreamWriter($logPath, $false, $utf8)
try {
    # Windows PowerShell treats native stderr as ErrorRecord; keep simulator
    # warnings in the log and decide success from the process exit code.
    $ErrorActionPreference = 'Continue'
    & wsl.exe -e sh "$wslProject/verification/run_tests.sh" 2>&1 | ForEach-Object {
        $line = $_.ToString()
        $writer.WriteLine($line)
        $writer.Flush()
        Write-Host $line
    }
    $simulationExitCode = $LASTEXITCODE
} finally {
    $ErrorActionPreference = 'Stop'
    $writer.Dispose()
}
if ($simulationExitCode -ne 0) {
    throw "RTL simulation failed (exit $simulationExitCode). Log: $logPath"
}
Write-Host "RTL simulation completed. Log: $logPath"
Write-Host 'Review the log and build/source consistency before running package_release.py.'
