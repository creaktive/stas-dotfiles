export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ "$SHELL" = "/opt/local/bin/zsh" ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export PATH=/opt/local/lib/postgresql92/bin:$PATH
    export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH

    TRAPALRM () {
        `$HOME/bin/setproxy`
        export no_proxy=localhost
        export rsync_proxy=$http_proxy
    }

    TMOUT=60
    TRAPALRM
fi

export NODE_PATH=$HOME/node_modules
export PATH=$HOME/.vim/bin:$HOME/bin:$NODE_PATH/.bin:$PATH

export PERL_MM_USE_DEFAULT=1

export EDITOR=vim
