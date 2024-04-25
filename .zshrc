export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="" # use starship theme

zstyle ':omz:update' mode auto # update automatically without asking

plugins=(git sudo docker npm vscode zsh-autosuggestions zsh-syntax-highlighting)

source "${ZSH}/oh-my-zsh.sh"

export BUNDLER_EDITOR=code
export EDITOR=code

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# bat
# use batcat if bat not found
alias cat='bat --style="header" --paging=never'
alias catn='bat --pager "less -RF"'
alias batn='bat --pager "less -RF"'

# fzf
alias f='fzf'
alias ff='fzf -m'
alias fff='fzf -m --preview "bat --style=header --color=always --line-range :500 {}"'

#btop
alias top='btop --utf-force'
alias btop='btop --utf-force'
alias htop='btop --utf-force'

# exa
alias ls='eza -a --icons'            # ls
alias l='eza -lbF --git'             # list, size, type, git
alias ll="eza -1a --icons"           # list, 1 per line
alias lat="eza -lagh --tree --icons" # list with info and tree

# duf
alias df='duf'             # df
alias duf='duf -h -a --si' # duf

# cd
alias ..='cd ..'
alias ...='cd ../..'

# update
alias update='brew update && brew upgrade && brew cleanup && brew doctor && proto upgrade'

# network
alias ip='curl -s https://ipinfo.io/ip'
alias localip='ipconfig getifaddr en0'

# zsh
alias zshrc='nano ~/.zshrc'

# git
alias gs='git status'
alias ga='git add .'
alias bc='better-commits'
alias bb='better-branch'

# wheater
alias wheater='curl wttr.in'

alias p='pnpm'
alias n='npm'

if [[ -f $(brew --prefix || true)/etc/brew-wrap ]]; then
  source "$(brew --prefix || true)/etc/brew-wrap"
fi

# proto
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

# starship
eval "$(starship init zsh)"
