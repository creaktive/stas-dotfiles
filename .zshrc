# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode dircycle git gnu-utils macports history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
mvim() { if [ "$*" ]; then /opt/local/bin/mvim --remote $*; else /opt/local/bin/mvim --remote .; fi }
alias gvim=mvim

eval $(dircolors $HOME/.dircolors)
alias ls='ls --color=auto'
#unalias ag

type gfind >/dev/null 2>&1
if [ "$?" -eq 0 ]; then
    alias find=gfind
fi

type gnutar >/dev/null 2>&1
if [ "$?" -eq 0 ]; then
    alias tar=gnutar
fi

export LESS=' -SIR '
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

autoload -U zcalc
autoload -U zed

bindkey ' '     magic-space
bindkey '^w'    backward-kill-word
bindkey '^r'    history-incremental-search-backward
bindkey '^[.'   insert-last-word
bindkey -s '^[l' "ls\n"

if [ -z "$TMUX" ]; then
    if [ ! -z "$SSH_TTY" ]; then
        if [ ! -z "SSH_AUTH_SOCK" ]; then
            ln -sf "$SSH_AUTH_SOCK" "$HOME/.wrap_auth_sock"
        fi
        export SSH_AUTH_SOCK="$HOME/.wrap_auth_sock"
    fi
fi

if [ -x /usr/local/bin/booking-perl ]; then
    prompt_git(){}
    export GIT_NO_TIMING=1
fi

function rtmux {
    case "$2" in
        "") autossh -M 0 -A $1 -t "if tmux -qu has; then tmux -qu attach; else tmux -qu new; fi";;
        *) autossh -M 0 -A $1 -t "if tmux -qu has -t $2; then tmux -qu attach -t $2; else tmux -qu new -s $2; fi";;
    esac
}
