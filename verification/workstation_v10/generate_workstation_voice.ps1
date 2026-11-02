$ErrorActionPreference = 'Stop'

# Use the already validated v1 PCM as the source. The local SAPI voice emits
# a malformed sample-rate stream on this machine, so re-synthesizing it here
# would make the board playback unclear.
python (Join-Path $PSScriptRoot 'build_verified_voice.py')
Write-Output 'Generated v2 AUDIO.WAV from verified v1 PCM segments.'
