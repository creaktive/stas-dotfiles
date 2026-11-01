# Init

```shell
cd ~
git clone https://github.com/creaktive/stas-dotfiles.git
cd stas-dotfiles/
cp -a . .. && cd .. && rm -rf stas-dotfiles
```

zsh plugins (listed in `.zsh_plugins.txt`) are installed by [antidote](https://github.com/mattmc3/antidote) on the first `zsh` launch.

# Update

```shell
cd ~
git pull --rebase
antidote update
```
