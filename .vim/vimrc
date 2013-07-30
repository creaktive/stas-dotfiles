set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()

set number
set mouse=a
set vb
set t_Co=256
set guifont=Terminus\ Medium:h12
set noantialias
set guioptions-=T
set guioptions-=L
set guioptions-=r
"let g:solarized_termcolors=256
let g:solarized_italic=0
let g:Powerline_symbols='fancy'
colorscheme solarized
set background=dark


let g:airline_theme='solarized'
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

" set cryptmethod=blowfish

syntax on
set synmaxcol=200
set hlsearch

set wildmenu
set cursorline
set laststatus=2

set spell spelllang=pt,en

set history=10000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linebreak

set foldenable
set foldmethod=syntax
" set foldlevel=0

set autoindent
set smartindent

set showmatch
set incsearch
set ignorecase

filetype on
filetype plugin on
filetype indent on

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -maxdepth 4 -type f -size +0c']

" let g:perl_compiler_force_warnings = 0
let perl_fold=1
let perl_nofold_packages=1
let perl_extended_vars=1
let perl_include_pod=1
autocmd FileType perl :call SetupPerl()
function! SetupPerl()
    compiler perl
    setlocal makeprg=perl\ -I.\ -I..\ -I../..\ -I../../..\ -Ilib\ -Mstrict\ -wc\ %
    setlocal iskeyword=48-57,_,A-Z,a-z,192-255,:
    setlocal path+=.,..,../..,../../..,lib
    setlocal complete=.,w,b,u,t

    map <F6> :%!perltidy<CR>
    vmap <F6> :!perltidy<CR>
endfunction

autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete
autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx

set backup
set backupdir=~/tmp,/tmp
set dir=~/tmp,/tmp
if has("persistent_undo")
    set undodir=~/tmp,/tmp
    set undofile
endif

nnoremap <F3> :UndotreeToggle<cr>

"set grepprg=ack\ -a

" dont use Q for Ex mode
map Q :q

" edit/write/quit alias
cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev Q w

" overwrite protected files (https://coderwall.com/p/xp9kjw)
cmap w!! %!sudo tee > /dev/null %

" kill'em all!!!
"nnoremap    <Up> <NOP>
"nnoremap    <Down> <NOP>
"nnoremap    <Left> <NOP>
"nnoremap    <Right> <NOP>
"noremap     <Insert> ""
"noremap!    <Insert> <NOP>
"noremap     <Delete> ""
"noremap!    <Delete> <NOP>
"noremap     <Home> ""
"noremap!    <Home> <NOP>
"noremap     <End> ""
"noremap!    <End> <NOP>
"noremap     <PageUp> ""
"noremap!    <PageUp> <NOP>
"noremap     <PageDown> ""
"noremap!    <PageDown> <NOP>

" now all operations work with the OS clipboard
"set clipboard=unnamed

" make tab in v mode ident code
vmap <Tab> >gv
vmap <S-Tab> <gv

" Surround text currently selected while in visual mode
" (The surrounded text is kept selected after being surround)
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>< S<
" no space
vmap <leader>) S)lvi(
vmap <leader>} S}lvi{
vmap <leader>] S]lvi[
vmap <leader>> S>lvi<
" with space
vmap <leader>( S(lvi(
vmap <leader>{ S{lvi{
vmap <leader>[ S[lvi[

" make tab in normal mode ident code
"nmap <Tab> I<tab><esc>
"nmap <S-Tab> ^i<bs><esc>

"let g:SuperTabDefaultCompletionType = "context"
let g:manpageview_multimanpage = 0

" Ctrl-r searches for selected text
vnoremap <C-r> "zy:/<C-r>z

" eregex
nnoremap <leader>/ :call eregex#toggle()<CR>

map <F5> :make<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

nnoremap <silent> <F8> :TagbarToggle<CR>
"let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1

"set autochdir
set tags=tags,./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags

"nnoremap <C-down> :BufExplorer<CR>
"noremap <C-left> :bprev<CR>
"noremap <C-right> :bnext<CR>
"let g:buftabs_only_basename=1

" tmux-alike
map <C-a> <C-w>
map <C-w>- :new<CR>
map <C-w>\| :vnew<CR>
map <C-w>; <C-\>

highlight clear SpellBad
highlight SpellBad gui=undercurl guisp=#bc6c4c
highlight clear SpellCap
highlight SpellCap gui=undercurl guisp=#bc6c4c
highlight clear SpellLocal
highlight SpellLocal gui=undercurl guisp=#bc6c4c
highlight clear SpellRare
highlight SpellRare gui=undercurl guisp=#bc6c4c

highlight clear SignColumn

autocmd FocusLost * nested silent! wall

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
