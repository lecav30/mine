# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Terminal Utilities
Set-Alias -Name vi -Value nvim.exe
Set-Alias -Name vim -Value nvim.exe
Set-Alias -Name neovim -Value nvim-qt.exe
Set-Alias -Name lg -Value lazygit

# Common
# Set-Alias -Name ll -Value ls
Set-Alias -Name touch -Value New-Item
Set-Alias -Name cls -Value Clear-Host
Set-Alias -Name g -Value git

# Subir directorios
Function .. { Set-Location .. }
Function ... { Set-Location ../.. }
Function .... { Set-Location ../../.. }
Function ..... { Set-Location ../../../.. }

# Eza (ls alternativa)
Function ld { eza -lD }
Function lf { eza -lF --color=always | Where-Object { $_ -notmatch '/$' } }
Function lh { eza -dl .* --group-directories-first }
Function ll { eza -al --group-directories-first }
Function ls { eza -alF --color=always --sort=size | Where-Object { $_ -notmatch '/$' } }
Function lt { eza -al --sort=modified }

Set-Alias -Name whr -Value where.exe

# Utilities
function vimfiles ($command) {
        Set-Location "C:\Users\lecav\AppData\Local\nvim"
    }

function home ($command) {
        Set-Location "$env"
    }

function Remove-StaleGitBranches {
    param (
        [string]$RepoPath = "."
    )

    Set-Location $RepoPath

    # Get remote branches
    git fetch --prune

    # Get local branches that don't have a remote version
    $localBranches = git branch | ForEach-Object { $_.Trim() -replace '^\* ' }
    $remoteBranches = git branch -r | ForEach-Object { $_.Trim() -replace '^origin/' }

    $staleBranches = $localBranches | Where-Object { $_ -ne "main" -and $_ -ne "master" -and ($remoteBranches -notcontains $_) }

    if ($staleBranches.Count -eq 0) {
        Write-Host "✅ There is no stale branches."
    } else {
        Write-Host "🗑️  Removing stale branches:"
        foreach ($branch in $staleBranches) {
            Write-Host " - $branch"
            git branch -d $branch
        }
    }
}

# Starship
Invoke-Expression (&starship init powershell)
