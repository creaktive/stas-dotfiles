# Init

```shell
cd ~
git clone https://github.com/creaktive/stas-dotfiles.git
cd stas-dotfiles/
git submodule update --init --recursive
cp -a . .. && cd .. && rm -rf stas-dotfiles
```

zsh plugins (listed in `.zsh_plugins.txt`) are installed by [antidote](https://github.com/mattmc3/antidote) on the first `zsh` launch.

# Update

```shell
cd ~
git submodule update --remote --rebase --recursive
antidote update
```
