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
Set-Alias edit code # > edit
Set-Alias text notepad # > notepad
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

# View git commit in details > git log --pretty=fuller
function glp {
    & git log --pretty=fuller
}

# Search
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}