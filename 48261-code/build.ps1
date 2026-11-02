[CmdletBinding()]
param(
    [string]$TdExecutable,
    [ValidateSet('Build','Check','Synthesis')]
    [string]$Mode = 'Build'
)
$ErrorActionPreference = 'Stop'
$packageRoot = $PSScriptRoot
$outputDir = Join-Path $packageRoot 'output'
$projectFile = Join-Path $packageRoot 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al'
New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
if (-not $TdExecutable) {
    $tdCommand = Get-Command td_commands_prompt.exe -ErrorAction SilentlyContinue
    if ($tdCommand) { $TdExecutable = $tdCommand.Source }
    else {
        $tdGui = Get-Command td.exe -ErrorAction SilentlyContinue
        if ($tdGui) { $TdExecutable = Join-Path (Split-Path $tdGui.Source) 'td_commands_prompt.exe' }
    }
}
if (-not $TdExecutable -or -not (Test-Path -LiteralPath $TdExecutable -PathType Leaf)) {
    throw 'Specify the installed TD bin/td_commands_prompt.exe with -TdExecutable.'
}
$TdExecutable = (Resolve-Path -LiteralPath $TdExecutable).Path
$steps = switch ($Mode) {
    'Check' { @(@{ Name='check_project'; Marker='PACKAGE_PROJECT_OK' }) }
    'Synthesis' { @(@{ Name='check_synthesis'; Marker='PACKAGE_SYNTHESIS_OK' }) }
    'Build' { @(
        @{ Name='build_v11'; Marker='PACKAGE_BUILD_OK' },
        @{ Name='fix_hold_v11'; Marker='PACKAGE_HOLD_OK' },
        @{ Name='bitgen_v11'; Marker='PACKAGE_BITGEN_OK' }
    ) }
}
# TD's native project loader requires an ASCII-only workspace path.
# A temporary drive also avoids installation-dependent Chinese-path encoding.
$substExe = Join-Path $env:SystemRoot 'System32/subst.exe'
$usedDrives = @([IO.Directory]::GetLogicalDrives() | ForEach-Object { $_.Substring(0,1).ToUpperInvariant() })
$usedDrives += @(Get-PSDrive -PSProvider FileSystem | ForEach-Object { $_.Name.ToUpperInvariant() })
$driveLetter = 90..68 | ForEach-Object { [string][char]$_ } | Where-Object { $_ -notin $usedDrives } | Select-Object -First 1
if (-not $driveLetter) { throw 'No unused drive letter is available for TD.' }
$mappedDrive = $driveLetter + ':'
$projectBytes = [IO.File]::ReadAllBytes($projectFile)
& $substExe $mappedDrive $packageRoot
if ($LASTEXITCODE -ne 0) { throw 'Cannot create the temporary TD workspace drive.' }
try {
    Push-Location -LiteralPath ($mappedDrive + '/')
    try {
        foreach ($step in $steps) {
            $logPath = Join-Path $outputDir ($step.Name + '.log')
            Write-Host ('Running ' + $step.Name + ' ...')
            & $TdExecutable ('scripts/' + $step.Name + '.tcl') *> $logPath
            $tdExitCode = $LASTEXITCODE
            $logText = Get-Content -LiteralPath $logPath -Raw
            if ($tdExitCode -ne 0 -or $logText -notmatch [regex]::Escape($step.Marker) -or $logText -match '(?im)^\s*(?:ERROR|FATAL)\b') {
                throw "TD step failed; see $logPath"
            }
        }
    } finally { Pop-Location }
} finally {
    # TD rewrites the project path on close; restore the portable project file.
    try { [IO.File]::WriteAllBytes($projectFile, $projectBytes) }
    finally { & $substExe $mappedDrive /D }
}
if ($Mode -eq 'Build') {
    Write-Host ('Bitstream: ' + (Join-Path $outputDir 'multimedia_system.bit'))
    Write-Host ('Review final timing: ' + (Join-Path $outputDir 'final_timing.rpt'))
} else { Write-Host ('Completed ' + $Mode + ' check.') }
