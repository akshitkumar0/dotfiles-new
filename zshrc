# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# vim
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# better completion
autoload -Uz compinit
compinit

# nicer navigation
setopt autocd

# prompt
PROMPT='%F{green}%n@%m %F{blue}%~ %f$ '

# plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=(~/.zsh/plugins/zsh-completions/src)
zstyle ':completion:*' menu select

eval "$(zoxide init zsh)"

# aliases
alias cls="clear"
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias tree="eza --tree"

# custom commands
run() {
  g++ "$1" -o "${1%.cpp}" && "./${1%.cpp}"
}

# start ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi

export PATH=$HOME/.local/bin:$PATH
