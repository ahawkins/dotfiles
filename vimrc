call pathogen#runtime_append_all_bundles()

" Set encoding
set encoding=utf-8

set nocompatible
colorscheme vividchalk

set autoindent
set number
set hlsearch
set ruler

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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Folding
if has("folding")
 set foldenable
 set foldmethod=syntax
 set foldlevel=1
 set foldnestmax=2
endif

" Tap completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Leader/Remaps
let mapleader=','

nnoremap ; :
inoremap <S-CR> <Esc>

" File types / syntax stuff
filetype plugin indent on
syntax on

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>m :Mm <CR>
endfunction

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Vagrantfile,Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1
