if status is-interactive
    # Commands to run in interactive sessions can go here
end

export EDITOR='nvim'

# user configs
source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/git_prompt.fish"

set PATH $PATH ~/.cargo/env;
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
