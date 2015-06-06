" Disable the bell
set vb

" Set encoding
set encoding=utf-8

set nocompatible
colorscheme vividchalk

set autoindent
set number
set hlsearch
set ruler

" Speed for mappings
" This is especially important if there is a mapping like 
" <Space><Space> and <Space>. If the single <space> mapping is
" wanted vim will wait for timeout. This also means that all
" key combinations need to be entered before this timeout.
set timeoutlen=200

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Swap & Tempfiles
set nobackup
set nowritebackup
set noswapfile

" Whitespace stuff
set nowrap
set list listchars=tab:\ \ ,trail:·

" 2 space hard tabs by default
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab

" Share with system cliboard
set clipboard=unnamed
set pastetoggle=<Leader>v

" Persisent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Folding
if has("folding")
  set foldenable
  set foldmethod=manual
  set foldlevel=1
  set foldnestmax=2
endif

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc
set wildignore+=*/node_modules/*
set wildignore+=vendor/rails/**
set wildignore+=*vendor/cache/*
set wildignore+=*vendor/bundle/*
set wildignore+=*/_site/*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/coverage/*
set wildignore+=*.gem
set wildignore+=*/tmp/*
set wildignore+=*/log/*
set wildignore+=*dist/*

" more natural splitting
set splitbelow
set splitright

" File types / syntax stuff
syntax on

" Autoreload all files
set autoread

" Automatically write all files when exiting vim and other things
" that may cause loss of edits
set autowriteall

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Save buffer after a certain time after leaving insert mode
set updatetime=200
autocmd BufLeave,CursorHold,InsertLeave * silent! wa
