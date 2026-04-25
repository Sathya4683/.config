# ---------- Editor ----------
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
alias n="nvim"

# ---------- Keybindings ----------
bindkey -v

# Better history navigation (like your bash arrows)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ---------- Env ----------
export DATABASE_PASSWORD="4683"
export TMPDIR="$HOME/tmp"

# ---------- PATH ----------
export PATH="./bin:$HOME/.local/bin:$HOME/.local/share/omakub/bin:$PATH"

# ---------- NVM (Zsh-safe) ----------
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  emulate sh -c 'source "$NVM_DIR/nvm.sh"'
fi

# ---------- Function ----------
mcd() {
  mkdir -p "$1" && cd "$1"
}

# ---------- File system ----------
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}' --height=80%"
alias fd='fdfind'
alias cd='z'   # zoxide override

f() {
  local file
  file=$(fzf --preview 'batcat --style=numbers --color=always {}') && nvim "$file"
}

rf() {
  local file
  file=$(rg --files | fzf --preview 'batcat --style=numbers --color=always {}') && nvim "$file"
}

kp() {
  ps aux | fzf | awk '{print $2}' | xargs kill -9
}

# ---------- Directories ----------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ---------- Tools ----------
alias g='git'
alias d='docker'
alias r='rails'
alias bat='batcat'
alias lzg='lazygit'
alias lzd='lazydocker'

# ---------- Git ----------
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# ---------- Compression ----------
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"

# ---------- Media ----------
webm2mp4() {
  input_file="$1"
  output_file="${input_file%.webm}.mp4"
  ffmpeg -i "$input_file" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 192k "$output_file"
}

# ---------- ISO to SD ----------
iso2sd() {
  if [ $# -ne 2 ]; then
    echo "Usage: iso2sd <input_file> <output_device>"
    lsblk -d -o NAME | grep -E '^sd[a-z]' | awk '{print "/dev/"$1}'
  else
    sudo dd bs=4M status=progress oflag=sync if="$1" of="$2"
    sudo eject $2
  fi
}

# ---------- Android ----------
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"

# ---------- Conda ----------
if command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.zsh hook)"
fi

# ---------- Java ----------
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"

# ---------- Rust ----------
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# ---------- pnpm ----------
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# ---------- Tools integration ----------

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# fzf (Zsh version)
if command -v fzf >/dev/null 2>&1; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# ---------- Zsh completion ----------
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ---------- History ----------
HISTSIZE=32768
SAVEHIST=32768
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY


# fzf keybindings (Ubuntu way)
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# ---------- Autosuggestions ----------
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------- Syntax highlighting (MUST BE LAST) ----------
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ---------- Prompt ----------
eval "$(starship init zsh)"
