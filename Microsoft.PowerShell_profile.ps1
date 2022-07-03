oh-my-posh --init --shell pwsh --config C:/Users/lecav/AppData/Local/Programs/oh-my-posh/themes/craver.omp.json | Invoke-Expression
# oh-my-posh --init --shell pwsh --config C:/Users/lecav/OneDrive/blue-owl.omp.json | Invoke-Expression

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module terminal-icons

# PSReadLine
# Para ver las keybinds disponibles:
# Get-PSReadlineKeyHandler
Set-PSReadLineOption -PredictionSource History
# Para ver las sugerencias en una lista:
# Set-PSReadLineOption -PredictionViewStyle ListView

# Alias
Set-Alias -Name vi -Value nvim
Set-Alias -Name touch -Value New-Item
