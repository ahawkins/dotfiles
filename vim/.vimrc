set nocompatible
colorscheme vividchalk

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
set nobackup
set nowritebackup
set noswapfile

"Tabbing
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab

filetype plugin indent on
syntax on

" Tap completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Leader/Remaps
let mapleader=','

nnoremap ; :
