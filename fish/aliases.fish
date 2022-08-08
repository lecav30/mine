# Basic
alias .. "cd .."

# Editor
alias vi='nvim'
alias v='nvim'
alias vim='nvim'

# List
alias ll='exa --long --header --git'
alias lla='exa --long --header --git -a'
alias la='ls -a'
alias lt='exa --long --all --group --header --tree --level'

# Dir
alias cd..='cd ..'
alias pdw='pwd'

# Pacman
alias update='sudo pacman -Syyu'
# Errors update
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'

# Config files
alias vneofetch='$EDITOR ~/.config/neofetch/config.conf'
alias vf='$EDITOR ~/.config/fish/config.fish'

# Move to Dirs
alias home='cd $home'
alias vimfiles='cd ~/.config/nvim'

# Git
alias g git
alias ga "git add"
alias gb "git branch"
alias gba "git branch -a"
alias gbd "git branch -D"
alias gcm "git commit -m"
alias gco "git checkout"
alias gcob "git checkout -b"
alias gd "git diff"
alias gp "git push"
alias gpom "git pull origin main"
