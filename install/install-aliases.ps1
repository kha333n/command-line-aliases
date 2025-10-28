#Requires -Version 5.1
$ErrorActionPreference = 'Stop'

# Prefer explicit RAW_BASE if provided; otherwise try master then main
$Bases = @(
  'https://raw.githubusercontent.com/kha333n/command-line-aliases/master'
)

$aliasesDir = Join-Path $HOME ".config\aliases"
New-Item -ItemType Directory -Force -Path $aliasesDir | Out-Null

function Try-Download($url, $dest) {
  try {
    Invoke-RestMethod -Uri $url -OutFile $dest -UseBasicParsing -ErrorAction Stop
    return $true
  } catch {
    return $false
  }
}

function Download-FromBases($relPath, $dest) {
  foreach ($b in $Bases) {
    $url = "$b/$relPath"
    if (Try-Download -url $url -dest $dest) { return $true }
  }
  throw "Failed to download $relPath from any base: $($Bases -join ', ')"
}

Write-Host "[*] Installing PowerShell aliases…"
$psFile = Join-Path $aliasesDir "powershell_aliases.ps1"
Download-FromBases -relPath "aliases/powershell_aliases.ps1" -dest $psFile

if (-not (Test-Path $PROFILE)) { New-Item -ItemType File -Force -Path $PROFILE | Out-Null }
$content = if (Test-Path $PROFILE) { Get-Content $PROFILE -Raw } else { "" }
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
Download-FromBases -relPath "aliases/cmd_aliases.cmd" -dest $cmdFile

$regPath = "HKCU:\Software\Microsoft\Command Processor"
if (-not (Test-Path $regPath)) { New-Item -Path $regPath | Out-Null }
Set-ItemProperty -Path $regPath -Name AutoRun -Value "`"$cmdFile`""

Write-Host ""
Write-Host "✅ Done. Restart PowerShell (or run: . `"$PROFILE`") and open a new CMD window."
