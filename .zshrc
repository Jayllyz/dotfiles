# =============================================================================
# Oh My Zsh
# =============================================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
zstyle ':omz:update' mode auto
plugins=(git vscode zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# =============================================================================
# Environment Variables
# =============================================================================

export EDITOR=code
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

# Xcode CLI tools
export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"

# Android
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

# Package managers
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"

# =============================================================================
# Aliases
# =============================================================================

# File viewing
alias cat='bat --style="header" --paging=never'
alias catn='bat --pager "less -RF"'

# Directory listing
alias ls='eza -a --icons --git'
alias l='eza -lbF --git'
alias ll='eza -1a --icons'
alias lat='eza -lagh --tree --icons'

alias y='yazi'

# Search
alias f='fzf'
alias ff='fzf -m'
alias fff='fzf -m --preview "bat --style=header --color=always --line-range :500 {}"'

# System
alias update='brew update && brew upgrade && brew cleanup && brew doctor'
alias zshrc='$EDITOR ~/.zshrc'

# Network
alias ip='curl -s https://ipinfo.io/ip'
alias localip='ipconfig getifaddr en0'
alias weather='curl wttr.in'

# Git
alias gs='git status'
alias ga='git add .'

# Package managers
alias p='pnpm'

# Claude
alias cc='claude --continue'

# SSH
alias s='ssh-list'

# =============================================================================
# Tool Initializations
# =============================================================================

# Homebrew wrap
if [[ -f "/opt/homebrew/etc/brew-wrap" ]]; then
  source "/opt/homebrew/etc/brew-wrap"
fi

# fnm (Node version manager)
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# SDKMAN
export SDKMAN_DIR="/opt/homebrew/opt/sdkman-cli/libexec"
if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# iTerm2 shell integration
if [[ -e "$HOME/.iterm2_shell_integration.zsh" ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

# =============================================================================
# Completions
# =============================================================================

# Bun
if [[ -s "$HOME/.bun/_bun" ]]; then
  source "$HOME/.bun/_bun"
fi

# Docker CLI
fpath=("$HOME/.docker/completions" $fpath)

autoload -Uz compinit
# Only regenerate completion cache once per day
if [[ -n "$HOME/.zcompdump"(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
