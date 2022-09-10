alias ..="cd .."

alias la="ls -a"
alias ll="ls -l --color=auto"

alias cd..="cd .."
alias pdw="pwd"
alias tree="tree.com"

alias tcpp="./a.exe < in.txt > out.txt"

alias vi="nvim"

alias g="git"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gp="git push"
alias gpom="git pull origin main"


# Load Angular CLI autocompletion.
source <(ng completion script)

# C:\Users\lecav\AppData\Local\Programs\oh-my-posh\themes
eval "$(oh-my-posh init bash --config ~/AppData/Local/Programs/oh-my-posh/themes/di4am0nd.omp.json)"
