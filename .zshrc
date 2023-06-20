# zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
# ZSH_THEME="flazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export HIST_FIND_NO_DUPS=1
export HIST_IGNORE_DUPS=1
setopt HIST_IGNORE_ALL_DUPS

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    vi-mode
    ag
    cpanm
    docker
    fancy-ctrl-z
    fzf
    gh
    git
    gnu-utils
    ssh-agent
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#657b83"
source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh

# # no autoescaping for URLs
# DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

if [[ -f $HOME/.ssh/known_hosts ]]; then
    hosts=( $( cut -d ' ' -f 1 $HOME/.ssh/known_hosts | cut -d , -f 1 ) )
    zstyle ':completion:*:hosts' hosts $hosts
fi

eval $(dircolors $HOME/.dircolors)

export LESS=' -SIR '
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

zstyle ':urlglobber' url-other-schema

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey '^ ' autosuggest-execute
bindkey '^[.' insert-last-word
bindkey '^[q' push-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey -M vicmd 'V' edit-command-line

alias t='tmux new -As0'
alias tb='tmux save-buffer'
alias ts='eval $( tmux show-env -s | grep "^SSH_" )'

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS GREP_COLOR

if which bat &>/dev/null; then
    alias cat='bat -P'
elif which batcat &>/dev/null; then
    alias cat='batcat -P'
fi

if which starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

if [ `uname` = "Darwin" ]; then
    alias dm='sudo dmesg'
else
    alias dm='sudo dmesg -HP'
fi

# zprof
