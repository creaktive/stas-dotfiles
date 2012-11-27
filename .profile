export PATH=$HOME/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PERL_MM_USE_DEFAULT=1
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
. $HOME/perl5/perlbrew/etc/bashrc
. setup-bash-complete

. $HOME/.bashrc

export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export LESS=' -iR '

set -o vi

# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen
