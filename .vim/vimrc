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
let white_background=$WHITE_BACKGROUND
if white_background == '1'
    set background=light
else
    set background=dark
endif
set backspace=indent,eol,start

" Display indentation guides
set list
set listchars=tab:¦\-,trail:·,extends:»,precedes:«,nbsp:×

" Delete trailing white space
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

" Automatically delete training white space on save
" autocmd BufWrite *.pl :call DeleteTrailingWS()
" autocmd BufWrite *.pm :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" set cryptmethod=blowfish

syntax on
" set synmaxcol=200
set colorcolumn=81
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
set foldlevel=10

set autoindent
set smartindent

set showmatch
set incsearch
set ignorecase
set smartcase

set showcmd
set whichwrap+=<,>,h,l,[,]

filetype on
filetype plugin on
filetype indent on

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:100'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'find %s -maxdepth 4 -type f -size +0c']
let g:CommandTUseGitLsFiles = 1

" let g:perl_compiler_force_warnings = 0
" let perl_fold=1
" let perl_nofold_packages=1
let perl_extended_vars=1
let perl_include_pod=1
autocmd FileType perl,mason :call SetupPerl()
function! SetupPerl()
    compiler perl
    setlocal makeprg=perl\ -I.\ -I..\ -I../..\ -I../../..\ -Ilib\ -Mstrict\ -wc\ %
    setlocal iskeyword=48-57,_,A-Z,a-z,192-255,:
    setlocal path+=.,..,../..,../../..,lib
    setlocal complete=.,w,b,u,t

    map <F6> :%!perltidy<CR>
    vmap <F6> :!perltidy<CR>
endfunction
set updatetime=500

autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete
autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile *.comp set ft=mason
autocmd BufRead,BufNewFile *.hql set ft=sql
autocmd BufRead,BufNewFile /tmp/sql* set ft=sql
autocmd BufRead,BufNewFile *.[ct]sv set ft=text

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
nnoremap    <Up> <NOP>
nnoremap    <Down> <NOP>
nnoremap    <Left> <NOP>
nnoremap    <Right> <NOP>
noremap     <Insert> ""
noremap!    <Insert> <NOP>
noremap     <Delete> ""
noremap!    <Delete> <NOP>
noremap     <Home> ""
noremap!    <Home> <NOP>
noremap     <End> ""
noremap!    <End> <NOP>
noremap     <PageUp> ""
noremap!    <PageUp> <NOP>
noremap     <PageDown> ""
noremap!    <PageDown> <NOP>

nnoremap k gk
nnoremap j gj

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

nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
"let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1
let g:tagbar_type_perl = {
    \ 'kinds' : [
        \ 'p:packages:1:0',
        \ 'c:constants:0:0',
        \ 'f:formats:0:0',
        \ 's:subroutines',
    \ ],
\ }

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
set splitbelow
set splitright

" Easily increase and decrease next number with ctrl+m and ctrl+n
nnoremap <C-m> <C-a>
nnoremap <C-n> <C-x>

highlight clear SignColumn
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

autocmd BufReadPost * nested
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif |
    \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
    \   let b:reload_dos = 1 |
    \   e ++ff=dos |
    \ endif

autocmd QuickFixCmdPost *grep* cwindow

" \\g for global git search for word under the cursor (with highlight)
nmap <leader>g :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>

" Stuff from http://programming.oreilly.com/2013/10/more-instantly-better-vim.html

"====[ Make the 81st column stand out ]====================

" OR ELSE just the 81st column of wide lines...
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)
