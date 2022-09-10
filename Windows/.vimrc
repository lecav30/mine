" Config vim
let g:netrw_liststyle=3
let &t_ut=''
let mapleader = " "

set number
set relativenumber
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set hidden
set ignorecase
set showmatch
set clipboard=unnamed
set ruler
set bg=dark
set cursorline
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

syntax on

filetype indent on
filetype on

nmap <leader>ww :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>qq :q!<CR>
