set nocompatible

" work from any checkout (vim -u path/to/vimrc), not only ~/.vim
let s:vimrc = expand('<sfile>:p')
let s:dir = fnamemodify(s:vimrc, ':h')
if index(map(split(&rtp, ','), 'fnamemodify(expand(v:val), ":p:h")'), s:dir) < 0
    let &rtp = s:dir . ',' . &rtp . ',' . s:dir . '/after'
endif

call plug#begin(s:dir . '/plugged')
Plug 'qpkorr/vim-bufkill'
Plug 'othree/eregex.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf'        " vim glue only; uses fzf binary from PATH
Plug 'junegunn/fzf.vim'
call plug#end()

" bundled with Vim 9.1+: gc{motion}, gcc
packadd! comment
" tcomment-style toggle (Ctrl-/ twice)
nmap <C-_><C-_> <Plug>(comment-toggle-line)
xmap <C-_><C-_> <Plug>(comment-toggle)

" own group, cleared on re-source so autocmds don't pile up
augroup vimrc | autocmd! | augroup END

" install missing plugins on first start (new machine)
autocmd vimrc VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | exe 'source' fnameescape(s:vimrc) | endif

set number
set mouse=a
set vb
set termguicolors
" 'background' is left to Vim, which asks the terminal for its colors
" Vim's builtin tmux/screen termcap has no query; tmux 3.3+ answers it
if empty(&t_RB) && $TERM =~# '^\(tmux\|screen\)'
    let &t_RB = "\<Esc>]11;?\<C-G>"
endif
silent! colorscheme solarized8
set backspace=indent,eol,start

" Display indentation guides
set list
set listchars=tab:¦\-,trail:·,extends:»,precedes:«,nbsp:×

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

set colorcolumn=81
set hlsearch

set wildmenu
set wildoptions=pum,fuzzy
set cursorline
set laststatus=2

set spell spelllang=nl,pt,en

set history=10000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linebreak

set autoindent
set smartindent

set showmatch
set incsearch
set ignorecase
set smartcase

set showcmd
set whichwrap+=<,>,h,l,[,]

" git ls-files inside a repo, else find
nnoremap <silent> <C-p> :execute system('git rev-parse --is-inside-work-tree') =~ 'true' ? 'GFiles -co --exclude-standard' : 'Files'<CR>

set updatetime=500

" swap/backup/undo under XDG state dir, like Neovim; 0700 since they hold file contents
let s:state = (empty($XDG_STATE_HOME) ? expand('~/.local/state') : $XDG_STATE_HOME) . '/vim'
for s:d in ['swap', 'backup', 'undo']
    call mkdir(s:state . '/' . s:d, 'p', 0700)
endfor
" trailing // = full-path file names, so same-named files don't collide
let &backupdir = s:state . '/backup//'
let &directory = s:state . '/swap//'
if has("persistent_undo")
    let &undodir = s:state . '/undo//'
    set undofile
endif

" make tab in v mode ident code
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" :Man and K open man pages in a split (bundled with Vim)
runtime ftplugin/man.vim
set keywordprg=:Man

" tmux-alike
map <C-a> <C-w>
map <C-w>- :new<CR>
map <C-w>\| :vnew<CR>
map <C-w>; <C-\>
set splitbelow
set splitright

autocmd vimrc BufReadPost * nested
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif |
    \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
    \   let b:reload_dos = 1 |
    \   e ++ff=dos |
    \ endif

autocmd vimrc QuickFixCmdPost *grep* cwindow
