# Microsoft.PowerShel profile of Sebastián Lévano #
# Modules:
# Z
# PSReadLine
# Terminal-Icons
# Z
# Scripts:
# Winfetch
 
# Oh my posh
oh-my-posh init pwsh | Invoke-Expression
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bubblesextra.omp.json" --print) -join "`n"))

# PSReadLine
# https://github.com/MicrosoftDocs/PowerShell-Docs/blob/main/reference/5.1/PSReadLine/Get-PSReadLineOption.md
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None

# Terminal-Icons
Import-Module -Name Terminal-Icons

# Z

# Winfetch
Set-Alias winfetch pwshfetch-test-1 

# Alias
# Set-Alias -Name v -Value nvim
# Set-Alias -Name vi -Value nvim
Set-Alias -Name ll -Value ls
Set-Alias -Name touch -Value New-Item
Set-Alias -Name pdw -Value pwd
Set-Alias -Name g -Value git
Set-Alias -Name cls -Value clear

# Start
# winfetch

# Utilities
function which ($command) {
        Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
    }

function gvim ($command) {
	  start "C:\Program Files\Vim\vim90\gvim.exe"
    }
