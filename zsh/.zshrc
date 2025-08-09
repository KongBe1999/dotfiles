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
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

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

# Alias for docker compose 
alias dc="docker-compose"

# Enter into specific docker container's bash
enter (){docker exec -it $1 bash;}

# Add protoc-gen... into PATH for executing
export PATH=$PATH:$HOME/go/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/congnx/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/congnx/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/congnx/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/congnx/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# fzf
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
alias ss='source ~/.zshrc'
alias k='kubectl'
# source tmux
alias stm='tmux source-file ~/.tmux.conf \;'
# confirm before remove something... fk.
alias rm="rm -i"
# PATH
alias vcf="cd ~/.config/nvim && nvim"
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
rsync_H100() {
  rsync -avzhe ssh ~/dotfiles/nvim/.config/nvim/ aic_speech@10.110.84.110:~/.config/nvim/
  rsync -avzhe ssh ~/dotfiles/tmux/.tmux.conf aic_speech@10.110.84.110:~/.tmux.conf
  # rsync -avzhe ssh ~/dotfiles/zsh/.zshrc aic_speech@10.110.84.110:~/.zshrc
}
rsync_orgfiles(){
  rsync -avzhe ssh ~/Documents/orgfiles/ aic_speech@
}
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

# macOS specific settings
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
# imagemagick
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# Some key bindings to manipulate the terminal
bindkey "^B" backward-word
bindkey -r "^F"
bindkey "^F" forward-word
bindkey -r "^V"
bindkey "^V" forward-char
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
