# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="dracula"
#CATPPUCCIN_FLAVOR="mocha" # Required! Options: mocha, flappe, macchiato, latte
#CATPPUCCIN_SHOW_TIME=true  # Optional! If set to true, this will add the current time to the prompt.

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="/home/congnx3/.local/bin:$PATH"

# Alias for docker compose 
alias dc="docker-compose"

# Enter into specific docker container's bash
enter (){docker exec -it $1 bash;}

# Add protoc-gen... into PATH for executing
export PATH=$PATH:$HOME/go/bin

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
alias f=fzf
# preview with bat
alias fp='fzf --multi --preview="bat --color=always {}"'
# alias fm='fzf --multi --preview="bat --color=always {}"'
# open neovim with select file by tab
alias fv='nvim $(fzf -m --preview="bat --color=always {}")'

# my alias for an easier life
alias v=nvim
alias vim=nvim
alias nv=nvim
alias os='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias k='kubectl'
# source tmux
alias stm='tmux source-file ~/.tmux.conf \;'
# confirm before remove something... fk.
alias rm="rm -i"
# PATH
alias vcf="v ~/.config/nvim"
alias python=python3
alias dc=docker-compose
# fetch then allow to fuzzy finding branches
alias gcof='git fetch && git checkout $(git branch | fzf | sed "s/^..//")'
# push with set upstream for the current branch
gpup() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  git push --set-upstream origin "$branch"
}
opg() {
  local dir
  dir=$(find ~/Documents/git -mindepth 1 -maxdepth 1 -type d | fzf) && cd "$dir"
}
op() {
  local user_dir="$HOME"
  local dir
  dir=$(find "$user_dir" -mindepth 1 -maxdepth 1 -type d  ! -name '.*' | fzf) && cd "$dir"
}

# rsync some folders to remote server
alias lzd='lazydocker'

# Doom emacs
export PATH="$HOME/.config/emacs/bin:$PATH"
alias emacs-client="emacsclient -c -a 'emacs'"
alias emacs-daemon="emacs --daemon"

# Tmux alias
alias t="tmux"
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias tl="tmux ls"
alias tk="tmux kill-session -t"


# Some key bindings to manipulate the terminal
bindkey "^B" backward-word
bindkey -r "^N"
bindkey "^N" forward-word
bindkey -r "^F"
bindkey "^F" forward-char
bindkey -r "^D"
bindkey "^D" kill-word
bindkey -r "^K"
bindkey -r "^U"
bindkey "^O" kill-line
bindkey "^U" backward-kill-line
# Bind Ctrl-Z to search directory
bindkey "^Z" fzf-cd-widget

# Neostrech
if [ -z $TMUX ] && [ -n "$PS1" ] && command -v neofetch >/dev/null 2>&1; then
  neofetch
fi

# Port fowarding
function pf() {
  ssh -N -f -L "$1":localhost:"$1" aic-speech@10.110.84.110
}

# kube alias
alias kctx='kubectx'
alias kns='kubens'
alias k='kubectl'

# yazi 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}



# export OPENCODE config
export OPENCODE_CONFIG="~/.config/opencode/opencode.json"

# alias Copilot CLI
alias co="copilot"


# opencode
export PATH=/home/congnx3/.opencode/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/congnx3/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/congnx3/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/congnx3/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/congnx3/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zoxide 
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# basepod A100 congnx3
export SSHPASS="1"

# alias web search
w() {
  local query
  query=$(printf '%s' "$*" | sed 's/ /+/g')
  w3m "https://html.duckduckgo.com/html/?q=$query"
}

# function to search web with w3m
search_web() {
  local session="search"
  local query
  query=$(printf '%s' "$*" | sed 's/ /+/g')
  local cmd="w3m 'https://html.duckduckgo.com/html/?q=$query'" 

  if tmux has-session -t "$session" 2>/dev/null; then
    tmux send-keys -t "$session" "$cmd" C-m
    tmux attach-session -t "$session"
  else
    tmux new-session -s "$session" "$cmd"
  fi
}

# function to ask LLM through farbic
ask_llm() {
  local query=""
  local args=()
  local cmd=(fabric -s)

  # Case 1: no argument
  if [ $# -eq 0 ]; then
    if [ -t 0 ]; then
      cat <<'EOF'
Usage:
  ask_llm "query text" -- [fabric options...]
  echo "query text" | ask_llm -- [fabric options...]

Examples:
  # Ask a simple question
  ask_llm "Explain OAuth in Vietnamese"

  # Ask with a Fabric pattern
  ask_llm "Explain OAuth vs API key" -- -p explain

  # Summarize text from stdin
  echo "OAuth is an authorization framework..." | ask_llm -- -p summarize

  # Summarize a file
  cat notes.txt | ask_llm -- -p summarize

  # Analyze git diff
  git diff | ask_llm -- -p analyze_changes

  # Improve selected text from Neovim
  # Visual mode -> select text -> then run:
  # :'<,'>!ask_llm -- -p improve_writing

Notes:
  --       separates your query from Fabric options.
  -p       selects a Fabric pattern.
  -s       is already enabled by default in this function.
EOF
      return 1
    else
      # stdin exists, no extra fabric args
      "${cmd[@]}"
      return $?
    fi
  fi

  # Case 2: first argument is --
  # Example:
  #   cat notes.txt | ask_llm -- -p summarize
  if [ "$1" = "--" ]; then
    shift
    args=("$@")

    "${cmd[@]}" "${args[@]}"
    return $?
  fi

  # Case 3: first argument is query text
  # Example:
  #   ask_llm "Explain OAuth" -- -p explain
  query="$1"
  shift

  # Remove optional separator --
  if [ "${1:-}" = "--" ]; then
    shift
  fi

  args=("$@")

  printf "%s\n" "$query" | "${cmd[@]}" "${args[@]}"
  return $?
}



alias "?"="search_web"
alias "??"="ask_llm"

# Fabric set up
# Golang environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Update PATH to include GOPATH and GOROOT binaries
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
