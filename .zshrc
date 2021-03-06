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
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(cpanm gnu-utils history-substring-search ssh-agent sudo)

zstyle :omz:plugins:ssh-agent agent-forwarding on

# no autoescaping for URLs
DISABLE_MAGIC_FUNCTIONS=true

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
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

alias tb='tmux save-buffer'
alias ts='eval $( tmux show-env -s | grep "^SSH_" )'

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS GREP_COLOR

alias apg="apg -m 12 -M sNC -n 10 -r /usr/share/dict/words -t"

# zprof
