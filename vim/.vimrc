set nocompatible
colorscheme spectacular

set transparency=10

set autoindent
set number
set tabstop=2
set shiftwidth=2
set smarttab
set hlsearch

set guifont=Monaco:h12
set guioptions-=T

filetype plugin indent on
syntax on

" Tap completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Leader/Remaps
let mapleader=','

nnoremap ; :
