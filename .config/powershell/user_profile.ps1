# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\phat.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Alias
Set-Alias ll ls # > ll
Set-Alias g git # > g
Set-Alias edit code # > edit
Set-Alias grep findstr # > grep
Set-Alias touch New-Item # > touch
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe' # > tig
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe' # > ll | less

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
