# stas-vim

Personal Vim config. Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug)
(vendored in `autoload/plug.vim`). Requires Vim 9.1+ (uses the bundled `comment` package).

## Install

```sh
git clone git@github.com:creaktive/stas-vim.git ~/.vim
vim              # first start installs missing plugins into ~/.vim/plugged
```

Vim 7.4+ reads `~/.vim/vimrc` automatically; no `~/.vimrc` symlink needed.
The first start needs `git` and network access.

Any other checkout works too: `vim -u path/to/vimrc` adds that directory to
`runtimepath` and installs plugins into its own `plugged/`.

### Outside Vim

- Truecolor terminal for solarized8 (`termguicolors`): iTerm2, kitty, WezTerm, Ghostty.
  In tmux: `set -as terminal-features ',*:RGB'`.
- Powerline or Nerd font for airline's arrow glyphs (`g:airline_powerline_fonts = 1`).
- [fzf](https://github.com/junegunn/fzf) binary (`brew install fzf`) for `<C-p>`.
- tmux side of [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator#tmux)
  in `~/.tmux.conf`, otherwise `<C-h/j/k/l>` only moves between Vim splits.

## Plugins

The list is the `Plug '...'` block at the top of `vimrc`.

| Plugin | What it gives you |
|--------|-------------------|
| eregex | `/`, `?` and `:S` use Perl regex (`\d+`, `(a\|b)`) by default; `:call eregex#toggle()` switches back to Vim regex |
| fzf, fzf.vim | `<C-p>` file finder; also `:Buffers`, `:History`, `:Lines`, `:Rg` |
| vim-bufkill | `:BD` / `:BW` close a buffer but keep its window |
| vim-gitgutter | `+ ~ -` signs for changed lines; `]c` / `[c` next / previous hunk |
| vim-surround | `cs"'` change quotes, `ds(` delete parens, `ysiw]` wrap word, visual `S"` |
| vim-unimpaired | `[b ]b` buffers, `[q ]q` quickfix, `[<Space>` blank line, `yos` toggle spell, `yon` numbers |
| vim-tmux-navigator | `<C-h/j/k/l>` move across Vim splits and tmux panes |
| vim-vinegar | `-` opens the directory of the current file (netrw); `-` again goes up |
| vim-airline (+ themes) | status line and buffer tabs at the top |
| vim-solarized8 | color scheme; light/dark follows the terminal background |

| Task | How |
|------|-----|
| Update all plugins | `:PlugUpdate` |
| Update vim-plug itself | `:PlugUpgrade`, then commit `autoload/plug.vim` |
| Add a plugin | add `Plug 'owner/repo'` to `vimrc`, `:PlugInstall` |
| Remove a plugin | delete its line, `:PlugClean` |
| Pin a version | `Plug 'owner/repo', {'commit': '<sha>'}` |
| Status | `:PlugStatus` |

Other machines: `git pull` in `~/.vim`, restart Vim (new plugins install
automatically), then `:PlugClean` to delete plugins that were dropped from the list.

### Upgrading from the old submodule layout

```sh
cd ~/.vim && git pull && rm -rf bundle .git/modules/bundle
```

Swap, undo and backup files used to live in `~/tmp`; old `*.swp`, `*.un~` and `*~`
files there can be deleted.

## Notable mappings

- `<C-p>`: fuzzy file finder (git files inside a repo, else all files)
- `gc{motion}`, `gcc`, `<C-_><C-_>` (Ctrl-/ twice): toggle comments
- `K`: man page for word under cursor (`:Man` in a split)
- `<C-a>` as `<C-w>` (tmux-style splits: `<C-a>-`, `<C-a>|`)
- visual `<Tab>` / `<S-Tab>`: indent / outdent and keep the selection

## Where state lives

Undo history, swap files and write backups go to `$XDG_STATE_HOME/vim`
(default `~/.local/state/vim`), created with mode 0700 on startup.
Spell checking is on for Dutch, Portuguese and English; word lists ship in `spell/`.
