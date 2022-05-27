if [ `uname` = "Darwin" ]; then
    if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    if [ -x "$HOMEBREW_PREFIX/opt/curl/bin/curl" ]; then
        export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
        export LDFLAGS="-L$HOMEBREW_PREFIX/opt/curl/lib"
        export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/curl/include"
        export PKG_CONFIG_PATH="i$HOMEBREW_PREFIX/opt/curl/lib/pkgconfig"
    fi
    if [ -e "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    fi
    if [ -x "$HOMEBREW_PREFIX/opt/mysql-client/bin/mysql" ]; then
        export PATH="$HOMEBREW_PREFIX/opt/mysql-client/bin:$PATH"
    fi
    ssh-add -A &> /dev/null
fi

if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
fi

if [ -d "$HOME/perl5/lib/perl5" ]; then
    eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
fi

if [ -e "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

