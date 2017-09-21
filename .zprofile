if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
fi

if [ -d "$HOME/perl5/lib/perl5" ]; then
    eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
fi

if [ `uname` = "Darwin" ]; then
    if [ -x /usr/local/opt/curl/bin/curl ]; then
        export PATH="/usr/local/opt/curl/bin:$PATH"
        export LDFLAGS=-L/usr/local/opt/curl/lib
        export CPPFLAGS=-I/usr/local/opt/curl/include
        export PKG_CONFIG_PATH=/usr/local/opt/curl/lib/pkgconfig
    fi
    ssh-add -A &> /dev/null
fi
