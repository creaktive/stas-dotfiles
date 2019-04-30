```shell
cd ~
git clone https://github.com/creaktive/stas-dotfiles.git
cd stas-dotfiles/
git submodule update --init --recursive
git submodule foreach --recursive git checkout master
cp -a . .. && cd .. && rm -rf stas-dotfiles
```
