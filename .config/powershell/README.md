# Step by step of installing terminal config

### NOTE: clone the project, copy all the folders (include .git) and paste it directly in the "C:\\Users\\:name"

#

### 1. Download and install Hack font from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

### 2. Config terminal settings

- Install **Powershell** (or you can **Powershell Preview (msix)**), both can be found on Microsoft Store
- Switch Terminnal default profile to **Powershell** (or **Powershell Preview**)
- Go **Settings/Apperance**, check Use acrylic material in the tab row
- Open Settings Json file (in the left corner)
- Copy the content in the powershell.settings.json in the repository, paste it to the settings.json file (or just copy the color schemes)
- If you paste entire powershell.settings.json, you don't need to do below steps of this section, it automatically configure for you.
- Go the **Settings/Defaults/Appearance**, in color scheme choose the **"One Half Dark (modded)"**
- Font face choose **Hack Nerd Font** (Hack NF) (You can choose **Bold** or Regular)
- Scroll down, there is a Tranparency section. Set **Background opacity** = 100%, check **Enable acrylic material**

- Sometime, when installing the Hack Nerd Font, the font can be error sometime. [Here is the solution](https://stackoverflow.com/a/77596968/30030901)

### 3. Config terminal

- Type in the powershell: **"text $PROFILE.CurrentUserCurrentHost"**
- Type: **". $env:USERPROFILE\.config\powershell\user_profile.ps1"** (this and above step is for setting up powershell script)
- Back to powershell and type: **"Install-Module [posh-git](https://github.com/dahlbyk/posh-git) -Scope CurrentUser -Force"**
- After finished installing posh-git type: **"winget install [JanDeDobbeleer.OhMyPosh](https://github.com/JanDeDobbeleer/oh-my-posh) -s winget" ([new method](https://ohmyposh.dev/docs/installation/windows))** - *"Install-Module oh-my-posh -Scope CurrentUser -Force ([old method](https://github.com/JanDeDobbeleer/oh-my-posh/issues/558#issuecomment-1117304416))"*
- This step is configuring how the ui of oh-my-posh you want to render which is in the phat.omp.json (read [this](https://ohmyposh.dev/docs/configuration/general) for more information)
- Back to Powershell type: **"Install-Module -Name [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) -Repository PSGallery -Force"**
- Back to Powershell type: **"Install-Module -Name [z](https://github.com/rupa/z) -Force"**
- Back to Powershell type: **"Install-Module -Name [PSReadLine](https://github.com/PowerShell/PSReadLine) -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck"**
- Back to Powershell type: **"winget install [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#windows-packages)"**
- Back to Powershell type: **"Install-Module -Name PSFzf -Scope CurrentUser -Force"**

---

### Some interesting things can explore:

- Terminal can add short-cut
- Can add custom short-cut in Powershell via script (user_profile.ps1)

#

# Reference:

- [How to set up PowerShell prompt with Oh My Posh on Windows 11](https://www.youtube.com/watch?v=5-aK2_WwrmM)
- [Make Windows Terminal Look Better | Oh My Posh Guide](https://www.youtube.com/watch?v=-G6GbXGo4wo)