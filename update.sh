#!/bin/sh

cd $HOME

mv .git{_,}
git submodule foreach --recursive git pull
mv .git{,_}

perlbrew self-upgrade 2>/dev/null
cpan-outdated | cpanm
cpanm-reporter
