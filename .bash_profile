export PATH=$HOME/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PERL_MM_USE_DEFAULT=1

if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
fi

if [ -d "$HOME/perl5/lib/perl5" ]; then
    eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
fi

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

export EDITOR=vim
export LESS=' -SIR '

# http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export HISTCONTROL=ignoreboth:erasedups # no duplicate entries
export HISTSIZE=100000                  # big big history
export HISTFILESIZE=100000              # big big history
shopt -s histappend                     # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

set -o vi
shopt -s extglob

# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

bind '"\C-[[A": history-search-backward'
bind '"\C-[[B": history-search-forward'
