# ============================================
# DÉTECTION OS
# ============================================
IS_MAC=false
IS_LINUX=false

if [[ "$OSTYPE" == "darwin"* ]]; then
  IS_MAC=true
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  IS_LINUX=true
fi

# ============================================
# SHELL & PATH
# ============================================
export SHELL="/bin/zsh"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# ============================================
# OH MY ZSH
# ============================================
if [ -d "$HOME/.oh-my-zsh" ]; then
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="agnoster"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh
fi

# ============================================
# EDITOR
# ============================================
export EDITOR='nvim'

# ============================================
# ALIASES COMMUNS
# ============================================
alias ll='ls -la'
alias c='clear'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='git push'
alias ..='cd ..'
alias ...='cd ../..'

# ============================================
# NVM (Node Version Manager)
# ============================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ============================================
# CONFIGURATION MACOS
# ============================================
if $IS_MAC; then
  # Docker Desktop
  if [ -d "/Applications/Docker.app" ]; then
    export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
  fi

  # Angular CLI autocompletion
  if command -v ng &> /dev/null; then
    source <(ng completion script)
  fi

  # Android Studio (React Native)
  if [ -d "$HOME/Library/Android/sdk" ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
  fi

  # JDK
  if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 21 2>/dev/null || /usr/libexec/java_home 2>/dev/null)
    export PATH=$JAVA_HOME/bin:$PATH
  fi
fi

# ============================================
# CONFIGURATION LINUX
# ============================================
if $IS_LINUX; then
  # Fix terminal SSH
  export TERM=xterm-256color
  
  # Alias update système
  alias update='sudo apt update && sudo apt upgrade -y'
  
  # Docker (si installé via apt)
  if command -v docker &> /dev/null; then
    alias dps='docker ps'
    alias dlog='docker logs'
  fi
fi

