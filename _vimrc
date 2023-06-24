" Config vim
let g:netrw_liststyle=3
let mapleader = " "

set backspace=indent,eol,start
set number
set relativenumber
set guifont=Hurmit\ Nerd\ Font\ Mono:h16
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
set showcmd
set showmode
set hlsearch
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" STATUS LINE
" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2


colorscheme sorbet
syntax on

filetype indent on
filetype on

" Save and Exit
nmap <leader>ww :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>qq :q!<CR>

" Select All
nmap <C-a> gg<S-v>G

" Terminal
tmap <Esc> <C-\\><C-n>

" Autocomplete
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

autocmd filetype cpp nnoremap <f6> :w <bar> !g++ % -o %:r <cr> :!%:r <cr>
