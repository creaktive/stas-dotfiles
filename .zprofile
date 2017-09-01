if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
fi

if [ -d "$HOME/perl5/lib/perl5" ]; then
    eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
fi

if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
    ssh-add -A &> /dev/null
fi
