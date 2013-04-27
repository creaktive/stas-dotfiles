#!/bin/sh

echo "\n\t* zsh"
cd ~/.oh-my-zsh
git pull

echo "\n\t* vim"
cd ~/.vim
git submodule foreach git pull

echo "\n\t* tmux-powerline"
cd ~/tmux-powerline
git pull

echo "\n\t* perl"
cd ~
perlbrew self-upgrade 2>/dev/null
cpan-outdated | cpan-tested | cpant
