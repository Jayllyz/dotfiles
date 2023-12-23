export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="refined"

zstyle ':omz:update' mode auto      # update automatically without asking

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
alias top="btop --utf-force"
alias btop="btop --utf-force"
alias htop="btop --utf-force"
# exa
alias ls='eza -a --icons'                                               # ls
alias l='eza -lbF --git'                                                # list, size, type, git
alias ll="eza -1a --icons"                                              # list, 1 per line
alias lat="eza -lagh --tree --icons"                                    # list with info and tree
# duf
alias df='duf'                                                          # df
alias duf='duf -h -a --si'                                              # duf
# cd
alias ..='cd ..'
alias ...='cd ../..'
# update
alias update='brew update && brew upgrade && brew cleanup && brew doctor'
# network
alias ip='curl -s https://ipinfo.io/ip'
alias localip='ipconfig getifaddr en0'
# zsh
alias zshrc='nano ~/.zshrc'
# git
alias gs='git status'
alias ga='git add .'

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
