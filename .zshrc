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
plugins=(gnu-utils history-substring-search)

source $ZSH/oh-my-zsh.sh
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Customize to your needs...

eval $(dircolors $HOME/.dircolors)

export LESS=' -SIR '
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

if [ -z "$TMUX" ]; then
    if [ ! -z "$SSH_TTY" ]; then
        if [ ! -z "SSH_AUTH_SOCK" ]; then
            ln -sf "$SSH_AUTH_SOCK" "$HOME/.wrap_auth_sock"
        fi
        export SSH_AUTH_SOCK="$HOME/.wrap_auth_sock"
    fi
fi

alias tb='tmux save-buffer'

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS GREP_COLOR

alias apg="apg -m 12 -M sNC -n 10 -r /usr/share/dict/words -t"
