# Frog Bot installer for Windows (if you prefer a command to the download button).
#   irm https://sayeemkabir.github.io/frogbot/install-windows.ps1 | iex
$ErrorActionPreference = 'Stop'
$url = 'https://github.com/sayeemkabir/frogbot/releases/latest/download/FrogBot-Setup-Windows.exe'
$setup = Join-Path $env:TEMP 'FrogBot-Setup-Windows.exe'
Write-Host ''
Write-Host '  🐸  Downloading Frog Bot for Windows…'
Invoke-WebRequest -Uri $url -OutFile $setup -UseBasicParsing
Write-Host '  Installing…'
Start-Process -FilePath $setup -ArgumentList '/S' -Wait
Remove-Item $setup -Force
$exe = Join-Path $env:LOCALAPPDATA 'Programs\Frog Bot\Frog Bot.exe'
Write-Host '  ✅ Done! Opening Frog Bot…'
Write-Host '  Create your account, then paste your Claude or OpenAI API key.'
Start-Process $exe
