# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# posh-git
Import-Module posh-git

# Terminal-Icons
Import-Module -Name Terminal-Icons

# oh-my-posh theme
$omp_config = Join-Path $PSScriptRoot ".\phat.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs # optional
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias ll ls # > ll
Set-Alias g git # > g
Set-Alias edit code # > edit (open and edit single file in vscode)
Set-Alias text notepad # > notepad (edit single file in notepad)
Set-Alias grep findstr # > grep
Set-Alias touch New-Item # > touch
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe' # > tig
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe' # > ll | less

# Utilities
# Go to dev folder
function dev {
    Set-Location "C:\dev"
}

# Go to home folder
function home {
    Set-Location "$env:USERPROFILE"
}

# Go to config file
function config {
    Set-Location "$env:USERPROFILE\.config\powershell"
}

# Go to PS History file
function psh {
    Set-Location "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine"
}

# Open path in window explorer
function open {
    ii .
}

# View git commit in details > git log --pretty=fuller
function glp {
    & git log --pretty=fuller
}

# Search
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# ── System Power ──────────────────────────────────────────────────────────────
function bye {
    Write-Host "Closing all applications..." -ForegroundColor Cyan

    # Apps to leave alone (system/background processes — closing these can break your session)
    $excludeList = @(
        'explorer', 'powershell', 'pwsh', 'WindowsTerminal',
        'csrss', 'wininit', 'winlogon', 'services', 'lsass',
        'svchost', 'dwm', 'fontdrvhost', 'conhost', 'SearchHost',
        'ShellExperienceHost', 'RuntimeBroker', 'ApplicationFrameHost'
    )

    # Grab all processes that have a visible main window (i.e. actual user apps)
    $apps = Get-Process | Where-Object {
        $_.MainWindowHandle -ne 0 -and
        $excludeList -notcontains $_.ProcessName
    }

    if (-not $apps) {
        Write-Host "No open applications found." -ForegroundColor Green
        return
    }

    foreach ($app in $apps) {
        Write-Host "  Closing $($app.ProcessName)..." -ForegroundColor DarkGray
        # CloseMainWindow() = graceful close (lets app prompt to save, run cleanup, etc.)
        $app.CloseMainWindow() | Out-Null
    }

    Write-Host "Close signal sent to all applications." -ForegroundColor Green
}

function shutdown { Stop-Computer }
function reboot { Restart-Computer }                # restart

# ── Network ───────────────────────────────────────────────────────────────────
function myip  { (Invoke-RestMethod ifconfig.me/ip).Trim() }   # public IP
function localip {                                             # local IPs
    Get-NetIPAddress -AddressFamily IPv4 |
        Where-Object { $_.InterfaceAlias -notlike '*Loopback*' } |
        Select-Object InterfaceAlias, IPAddress |
        Format-Table -AutoSize
}
function flushdns { ipconfig /flushdns }                   # flush DNS cache

# ── Process ───────────────────────────────────────────────────────────────────
function pkill ($name) { Get-Process $name -ErrorAction SilentlyContinue | Stop-Process -Force }
function pgrep ($name) { Get-Process $name -ErrorAction SilentlyContinue }

# ── Filesystem ────────────────────────────────────────────────────────────────
function mkcd ($path) { New-Item -ItemType Directory -Path $path -Force | Set-Location }
function size  { Get-ChildItem -Recurse | Measure-Object -Property Length -Sum | ForEach-Object { "{0:N2} MB" -f ($_.Sum / 1MB) } }
function top5  { Get-ChildItem | Sort-Object Length -Descending | Select-Object -First 5 Name, @{N='Size';E={"{0:N2} MB" -f ($_.Length/1MB)}} }

# ── Git Shortcuts ─────────────────────────────────────────────────────────────
function gst   { git status }
function gco   { git checkout $args }
function gcb   { git checkout -b $args }                   # create & switch branch
function gpl   { git pull }
function gps   { git push }
function gadd  { git add $args }
function gcm   { git commit -m $args }

# ── Environment ───────────────────────────────────────────────────────────────
function envs  { Get-ChildItem Env: | Sort-Object Name }   # list all env vars
function path  { $env:PATH -split ';' }                    # list PATH entries, one per line
function reload { . $PROFILE }                             # reload profile without restarting
