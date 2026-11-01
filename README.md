# Init

```shell
git clone --bare https://github.com/creaktive/stas-dotfiles.git ~/.dotfiles.git
git --git-dir=$HOME/.dotfiles.git config core.bare false
git --git-dir=$HOME/.dotfiles.git config core.worktree $HOME
git --git-dir=$HOME/.dotfiles.git config status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles.git checkout
```

`checkout` refuses to overwrite existing files; move them aside first.

The repo lives in `~/.dotfiles.git` instead of `~/.git`, so tools scanning for a git repo don't treat all of `$HOME` as one.
Use the `gith` alias (defined in `.zshrc`) instead of `git`.

zsh plugins (listed in `.zsh_plugins.txt`) are installed by [antidote](https://github.com/mattmc3/antidote) on the first `zsh` launch.

# Update

```shell
gith pull --rebase
antidote update
```
