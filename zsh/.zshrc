# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path for tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

#source $ZSH/oh-my-zsh.sh
# starship
unset STARSHIP_SESSION_KEYMAP
eval "$(starship init zsh)"

# start tmux
# if [[ -z "$TMUX" ]]; then
#     exec tmux new-session
# fi
if [[ -z "$TMUX" ]] && [[ -n "$DISPLAY" ]]; then
    tmux new-session
fi


# User configuration

# history
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_VERIFY
setopt HIST_SAVE_NO_DUPS
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# vim mode
#bindkey -v
#set -o vi

# Default terminal
export TERMINAL=ghostty
export XDG_TERMINAL=ghostty

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias n="nvim"
alias v="nvim"
alias vim="nvim"

alias yta='yt-dlp -f bestaudio --embed-thumbnail --add-metadata --convert-thumbnails jpg --extract-audio --audio-format mp3 --audio-quality 0'
alias mpvterm='mpv --no-video'

alias la=tree
if command -v bat &>/dev/null; then alias cat=bat; fi


# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Eza
alias l="eza -l --icons --git -al"
if command -v eza &>/dev/null; then alias ls="eza -l --icons --git"; fi
alias lt="eza --tree --level=2  --icons --git"
alias ltree="eza --tree --level=2 --long --icons --git"

# navigation
cx() { cd "$@" && l; }
cv() { cd "$@" && nvim; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | wl-copy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }


# Eval tmuxifier
eval "$(tmuxifier init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
