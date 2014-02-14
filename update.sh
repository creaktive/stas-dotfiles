#!/bin/sh

echo "\n * zsh"
git -C ~/.oh-my-zsh pull

echo "\n * vim"
git -C ~/.vim submodule foreach git pull

echo "\n * tmux-powerline"
git -C ~/tmux-powerline pull

echo "\n * perl"
perlbrew self-upgrade 2>/dev/null
cpan-outdated | cpanm
cpanm-reporter
