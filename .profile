if [ "$SHELL" == "/opt/local/bin/bash" ]; then

    # MacPorts Installer addition on 2012-07-30_at_22:44:09: adding an appropriate PATH variable for use with MacPorts.
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    # Finished adapting your PATH environment variable for use with MacPorts.

    export PATH=/opt/local/lib/postgresql92/bin:$PATH
    #export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
fi

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
export HISTSIZE=32768
export LESS=' -SIR '

set -o vi

# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

bind '"\C-[[A": history-search-backward'
bind '"\C-[[B": history-search-forward'
