set nocompatible
colorscheme vividchalk

set autoindent
set number
set hlsearch
set ruler

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
inoremap <S-CR> <Esc>

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Vagrantfile,Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby


" Folding
if has("folding")
 set foldenable
 set foldmethod=syntax
 set foldlevel=1
 set foldnestmax=2
endif
