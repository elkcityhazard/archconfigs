let mapleader = " "

" set local leader / prefix key
let maplocalleader = "\\"

set encoding=utf-8
set nobackup
set nowritebackup
set fileformat=unix
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set number
set relativenumber
set smartindent
set showmatch
set backspace=indent,eol,start
syntax on

set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set smarttab
set ruler

""status line
set statusline=%f\ %h%m%r%w\ %=\ %Y\ %l,%c\ %P

""no swap
set noswapfile
set undolevels=1000
set backspace=indent,eol,start

nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

set number
set numberwidth=2
set relativenumber
set wrap
set shiftround
set showmatch
set matchtime=5
set textwidth=100
set sidescroll=5
set listchars+=precedes:<,extends:>
set filetype=on

" key maps

" delete and move up or down
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" upper and lower case selected word
inoremap <c-u> <esc> viwU
inoremap <c-l> <esc> viwu
nnoremap <c-u> viwU<esc>
nnoremap <c-l> viwu<esc>


" delete or delete and go into insert mode
nnoremap <leader>d dd
nnoremap <leader>c ddO

" open vimrc in vertical split
" source any updates to vimrc
" new vsplit that opens vimrc and carriages returns
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" wrap in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
" wrap in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" map H to go the beginning of the current line
nnoremap <leader><S-h> ^
" map L to go to end of line
nnoremap <leader><S-l> $
" remap esc in insert mode
inoremap jk <esc>
" disable esc in insert mode
inoremap <esc> <nop>

" disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" abbreviations
" note @ has to come last to trigger expansion
" email address
iab email@ andrew@andrew-mccall.com
iab dicker docker
" if err != nil
iab <buffer> ien@ if err != nil {<cr><cr>{PLACEHOLDER}}<cr>}<cr><esc>?{PLACEHOLDER}<cr>viwDki


nnoremap <leader>up :source ~/.config/vim/modules/012_update_funcs.vim<CR>

