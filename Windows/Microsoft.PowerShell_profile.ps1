# Microsoft.PowerShel profile of Sebastián Lévano #
# Modules:
# Z
# PSReadLine
# Terminal-Icons

# Scripts:
# Winfetch
 
# Oh my posh
oh-my-posh init pwsh | Invoke-Expression
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:OneDrive\catppuccin_mocha_lecav.omp.json" --print) -join "`n"))

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None

# Terminal-Icons
Import-Module -Name Terminal-Icons

# Winfetch
Set-Alias winfetch pwshfetch-test-1 

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name lg -Value lazygit

Set-Alias -Name ll -Value ls
Set-Alias -Name touch -Value New-Item
Set-Alias -Name pdw -Value pwd
Set-Alias -Name cls -Value clear

Set-Alias -Name whr -Value where.exe

# Utilities
function vimfiles ($command) {
        Set-Location "C:\Users\lecav\AppData\Local\nvim"
    }

function home ($command) {
        Set-Location "$env"
    }

function programs ($command) {
        Set-Location "E:\Programs"
    }

function jsonsvr ($command) {
        json-server --watch server/db.json --routes server/routes.json
    }

function mysql-c ($command) {
        mysql -u root -pdatabase2002
    }

function parrot ($command) {
        curl parrot.live
    }

