if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
fi

if [ -d "$HOME/perl5/lib/perl5" ]; then
    eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
fi

if [ -e "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

if [ `uname` = "Darwin" ]; then
    if [ -x /usr/local/opt/curl/bin/curl ]; then
        export PATH="/usr/local/opt/curl/bin:$PATH"
        export LDFLAGS=-L/usr/local/opt/curl/lib
        export CPPFLAGS=-I/usr/local/opt/curl/include
        export PKG_CONFIG_PATH=/usr/local/opt/curl/lib/pkgconfig
    fi
    if [ -e "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    fi
    if [ -x /usr/local/opt/mysql-client/bin/mysql ]; then
        export PATH="/usr/local/opt/mysql-client/bin:$PATH"
    fi
    ssh-add -A &> /dev/null
fi
