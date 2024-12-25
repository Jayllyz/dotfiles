export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="" # use starship theme

zstyle ':omz:update' mode auto # update automatically without asking

plugins=(git vscode zsh-autosuggestions zsh-syntax-highlighting)

source "${ZSH}/oh-my-zsh.sh"

export BUNDLER_EDITOR=code
export EDITOR=code
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

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
alias ls='eza -a --icons --git'      # ls
alias l='eza -lbF --git'             # list, size, type, git
alias ll="eza -1a --icons"           # list, 1 per line
alias lat="eza -lagh --tree --icons" # list with info and tree

# duf
alias df='duf'             # df
alias duf='duf -h -a --si' # duf

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias y='yazi'

# update
alias update='brew update && brew upgrade && brew cleanup && brew doctor && omz update'

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

# yazi
alias y='yazi'

if [[ -f $(brew --prefix || true)/etc/brew-wrap ]]; then
  source "$(brew --prefix || true)/etc/brew-wrap"
fi

if ! grep -q "pam_tid.so" /etc/pam.d/sudo; then
  echo "Updating /etc/pam.d/sudo to activate Touch ID authentication permissions from Terminal:"
  echo 'auth       sufficient     pam_tid.so' | sudo tee -a /etc/pam.d/sudo
  echo "pam_tid.so permissions updated:\n\n$(cat /etc/pam.d/sudo)"
fi

# bun completions
[ -s "/Users/jayllyz/.bun/_bun" ] && source "/Users/jayllyz/.bun/_bun"

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/jayllyz/completions:"* ]]; then export FPATH="/Users/jayllyz/completions:$FPATH"; fi
. "/Users/jayllyz/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools

# pnpm
export PNPM_HOME="/Users/jayllyz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
eval "$(fnm env --use-on-cd)"

# starship
eval "$(starship init zsh)"
