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
  set textwidth=70
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>m :Mm <CR>
endfunction

" Set file types for custom files
au BufRead,BufNewFile {AssetFile,Vagrantfile,Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.handlebars,*.hbs,*.hjs set ft=handlebars

" Custom Ruby Extensions
au BufRead,BufNewFile *{god,dropzone}  set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" <Leader># Surround a word with #{ruby interpolation}
map <Leader># ysiw#
vmap <Leader># c#{<C-R>"}<ESC>

" <Leader>" Surround a word with "quotes"
map <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>

" <Leader>' Surround a word with 'single quotes'
map <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>

" <Leader>) or <Leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <Leader>( ysiw(
map <Leader>) ysiw)
vmap <Leader>( c( <C-R>" )<ESC>
vmap <Leader>) c(<C-R>")<ESC>

" <Leader>[ Surround a word with [brackets]
map <Leader>] ysiw]
map <Leader>[ ysiw[
vmap <Leader>[ c[ <C-R>" ]<ESC>
vmap <Leader>] c[<C-R>"]<ESC>

" <Leader>{ Surround a word with {braces}
map <Leader>} ysiw}
map <Leader>{ ysiw{
vmap <Leader>} c{ <C-R>" }<ESC>
vmap <Leader>{ c{<C-R>"}<ESC>

" <Leader>` Surround a word with `brackets`
map <Leader>` ysiw`
vmap <Leader>` c`<C-R>"`<ESC>

" Gary B's Hash rocket
imap <c-l> <space>=><space>
