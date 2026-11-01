# zmodload zsh/zprof

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HIST_FIND_NO_DUPS=1

# Share history across all open terminal tabs
setopt SHARE_HISTORY

# Expire duplicate entries first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST

# Don't record an entry if it's a duplicate of the previous one
setopt HIST_IGNORE_DUPS
# setopt HIST_IGNORE_ALL_DUPS

# Do not write duplicate entries in the history file
setopt HIST_SAVE_NO_DUPS

# Remove superfluous blanks before recording an entry
setopt HIST_REDUCE_BLANKS

# OMZ lib settings
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
# # no autoescaping for URLs
# DISABLE_MAGIC_FUNCTIONS=true

zstyle :omz:plugins:ssh-agent agent-forwarding on

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=white,bold'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#657b83"

# predicates for `conditional:` entries in .zsh_plugins.txt
has_fzf()     { (( $+commands[fzf] )) }
no_starship() { (( ! $+commands[starship] )) }

# antidote plugin manager (plugins listed in ~/.zsh_plugins.txt); bootstraps itself on first run
[[ -d $HOME/.antidote ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
source $HOME/.antidote/antidote.zsh
antidote load

# Customize to your needs...

if [[ -f $HOME/.ssh/known_hosts ]]; then
    hosts=( $( cut -d ' ' -f 1 $HOME/.ssh/known_hosts | cut -d , -f 1 ) )
    zstyle ':completion:*:hosts' hosts $hosts
fi

eval $(dircolors $HOME/.dircolors)

export LESS=' -SIR '
HISTSIZE=100000
SAVEHIST=100000
KEYTIMEOUT=1

export AWS_PAGER=
export BAT_THEME="Solarized (dark)"
export DO_NOT_TRACK=1
export FX_NO_MOUSE=1
export FX_THEME=1
export GH_PAGER=
export HOMEBREW_NO_ANALYTICS=1
export JQ_COLORS="2;31:1;31:1;32:0;36:0;36:1;39:1;39"
export OPENCODE_ENABLE_EXA=1

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

# dotfiles repo lives outside $HOME/.git so tools don't pick it up
alias gith='git --git-dir=$HOME/.dotfiles.git'

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

if which sf &>/dev/null; then
    eval $(sf autocomplete script zsh)
fi

if [ `uname` = "Darwin" ]; then
    alias dm='sudo dmesg'
else
    alias dm='sudo dmesg -HP'
fi

alias xpg='perl -E "@w=grep/^[a-z]{3,9}$/i,map s/^\s+|\s+$//grs,<ARGV>;for(1..10){say join q{ },map{fc\$w[rand\$#w]}1..5}" /usr/share/dict/words'
alias bru='brew update && brew upgrade --greedy && brew cleanup && brew cleanup -s'
alias apu='sudo apt -y update && sudo apt -y upgrade && sudo apt clean'
alias nobs='rg -n "[\u2010-\u201F\u2026\u00A0]|[\p{C}--[\t\r\n]]"'
alias oc='nono run --allow-cwd --profile opencode -- opencode'
alias cl='nono run --allow-cwd --profile claude-local -- claude --dangerously-skip-permissions'
alias clq='nono run --allow-cwd --profile qwic-claude -- claude --dangerously-skip-permissions'
# zprof
