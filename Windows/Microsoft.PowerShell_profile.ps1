# Oh my posh
oh-my-posh init pwsh | Invoke-Expression
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\di4am0nd.omp.json" --print) -join "`n"))

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Terminal-Icons
Import-Module -Name Terminal-Icons

# Z

# Alias
Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name ll -Value ls
Set-Alias -Name touch -Value New-Item
Set-Alias -Name pdw -Value pwd
Set-Alias -Name g -Value git

