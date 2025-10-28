#Requires -Version 5.1
$ErrorActionPreference = 'Stop'
if (-not $env:RAW_BASE) { $env:RAW_BASE = 'https://RAW_BASE' }

$aliasesDir = Join-Path $HOME ".config\aliases"
New-Item -ItemType Directory -Force -Path $aliasesDir | Out-Null

function Invoke-Download($url, $dest) {
  try { Invoke-RestMethod -Uri $url -OutFile $dest -UseBasicParsing }
  catch { throw "Failed to download $url. $_" }
}

Write-Host "[*] Installing PowerShell aliases…"
$psFile = Join-Path $aliasesDir "powershell_aliases.ps1"
Invoke-Download "$($env:RAW_BASE)/aliases/powershell_aliases.ps1" $psFile

if (-not (Test-Path $PROFILE)) { New-Item -ItemType File -Force -Path $PROFILE | Out-Null }
$content = Get-Content $PROFILE -Raw
$begin = "# >>> ALIASES:BEGIN >>>"
$end   = "# <<< ALIASES:END <<<"
if ($content -notmatch [regex]::Escape($begin)) {
  Add-Content $PROFILE "`n$begin"
  Add-Content $PROFILE "if (Test-Path '$psFile') { . '$psFile' }"
  Add-Content $PROFILE "$end`n"
  Write-Host "    Appended source block to `$PROFILE"
} else {
  Write-Host "    Source block already present in `$PROFILE"
}

Write-Host "[*] Installing CMD (doskey) aliases…"
$cmdFile = Join-Path $aliasesDir "cmd_aliases.cmd"
Invoke-Download "$($env:RAW_BASE)/aliases/cmd_aliases.cmd" $cmdFile

$regPath = "HKCU:\Software\Microsoft\Command Processor"
if (-not (Test-Path $regPath)) { New-Item -Path $regPath | Out-Null }
Set-ItemProperty -Path $regPath -Name AutoRun -Value "`"$cmdFile`""

Write-Host ""
Write-Host "✅ Done. Restart PowerShell (or run: . `"$PROFILE`") and open a new CMD window."
