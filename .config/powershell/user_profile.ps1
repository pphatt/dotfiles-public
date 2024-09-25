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
