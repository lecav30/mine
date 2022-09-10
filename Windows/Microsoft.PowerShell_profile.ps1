Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name touch -Value New-Item

Set-Alias -Name pdw -Value pwd

Set-Alias -Name g -Value git

oh-my-posh init pwsh | Invoke-Expression

& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\di4am0nd.omp.json" --print) -join "`n"))
