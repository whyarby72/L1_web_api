param(
  [string]$BaseDir = (Get-Location).Path,
  [string]$PortfolioFolder = 'portofolio2025',
  [string]$RepoName = 'L1_web_api',
  [int[]]$Week = @(1), # contoh: -Week 1,2,6
  [switch]$All,        # generate week1..week12
  [switch]$Here        # gunakan folder kerja saat ini sebagai root repo
)

function Write-Info($msg){ Write-Host "[+] $msg" }
function Write-Warn($msg){ Write-Host "[!] $msg" -ForegroundColor Yellow }
function Write-Err($msg){ Write-Host "[x] $msg" -ForegroundColor Red }

# Jika -All digunakan, override Week menjadi 1..12
if($All){ $Week = 1..12 }

# Validasi minggu (1..12)
$Invalid = $Week | Where-Object { $_ -lt 1 -or $_ -gt 12 }
if($Invalid){ Write-Err "Parameter -Week hanya 1..12. Nilai tidak valid: $($Invalid -join ', ')"; exit 1 }

# Tentukan path repo
if($Here){
  $Repo = (Get-Location).Path
  Write-Info "Mode -Here aktif → repo: $Repo"
} else {
  $Root = Join-Path -Path $BaseDir -ChildPath $PortfolioFolder
  $Repo  = Join-Path -Path $Root -ChildPath $RepoName
  if(!(Test-Path $Repo)){ New-Item -ItemType Directory -Path $Repo | Out-Null; Write-Info "Created: $Repo" }
}

# Struktur base (dibuat sekali saja)
$BaseFolders = @(
  "$Repo/documentation",
  "$Repo/templates",
  "$Repo/postman_collections",
  "$Repo/burp_projects",
  "$Repo/reports/weekly",
  "$Repo/reports/final",
  "$Repo/.github"
)
foreach($bf in $BaseFolders){
  if(!(Test-Path $bf)){
    New-Item -ItemType Directory -Path $bf | Out-Null
    Write-Info "Created: $bf"
  } else {
    Write-Info "Exists: $bf"
  }
}

# Struktur per-minggu
foreach($w in $Week){
  $WeekFolders = @(
    "$Repo/findings/week$w/code",
    "$Repo/findings/week$w/notes",
    "$Repo/findings/week$w/screenshots",
    "$Repo/findings/week$w/pcap"
  )
  foreach($wf in $WeekFolders){
    if(!(Test-Path $wf)){
      New-Item -ItemType Directory -Path $wf | Out-Null
      Write-Info "Created: $wf"
    } else {
      Write-Info "Exists: $wf"
    }
  }
}

Write-Host ""  
Write-Host "Struktur folder selesai dibuat di: $Repo" -ForegroundColor Green
Write-Host ("Minggu yang digenerate: {0}" -f ($Week -join ', '))