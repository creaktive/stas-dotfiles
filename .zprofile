if [ `uname` = "Darwin" ]; then
    if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    if [ -x "$HOMEBREW_PREFIX/opt/curl/bin/curl" ]; then
        export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
        # tied unique arrays: prepend without duplicating in nested login shells
        typeset -xTU LDFLAGS ldflags ' '
        typeset -xTU CPPFLAGS cppflags ' '
        typeset -xTU PKG_CONFIG_PATH pkg_config_path
        ldflags=(-L$HOMEBREW_PREFIX/opt/curl/lib $ldflags)
        cppflags=(-I$HOMEBREW_PREFIX/opt/curl/include $cppflags)
        pkg_config_path=($HOMEBREW_PREFIX/opt/curl/lib/pkgconfig $pkg_config_path)
    fi
    if [ -x "$HOMEBREW_PREFIX/opt/mysql-client/bin/mysql" ]; then
        export PATH="$HOMEBREW_PREFIX/opt/mysql-client/bin:$PATH"
    fi
fi

if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
elif [ -d "$HOME/perl5/lib/perl5" ]; then
    eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
fi

# after path_helper, brew shellenv and perlbrew, so user dirs win
path=($user_path $path)
