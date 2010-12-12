set nocompatible
colorscheme spectacular

"GUI
set transparency=10
set guifont=Monaco:h12
set guioptions-=T

set autoindent
set number
set hlsearch

"Searching 
set ignorecase
set smartcase

"Swap & Tempfiles
set directory=$HOME/.vim/tmp//,.

"Tabbing
set tabstop=2
set shiftwidth=2
set smarttab

filetype plugin indent on
syntax on

" Tap completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Leader/Remaps
let mapleader=','

nnoremap ; :
