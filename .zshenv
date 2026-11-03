export LANG=en_US.UTF-8

export NODE_PATH=$HOME/node_modules
export NODE_DISABLE_COLORS=1
# .zprofile prepends these again: macOS path_helper reorders PATH in login shells
typeset -U path
user_path=($HOME/.vim/bin $HOME/bin $HOME/.local/bin $NODE_PATH/.bin /usr/local/sbin)
path=($user_path $path)

export PERL_MM_USE_DEFAULT=1

export EDITOR=vim

export HOMEBREW_CASK_OPTS="--no-quarantine"
