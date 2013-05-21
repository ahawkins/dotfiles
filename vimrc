" Vundle
source ~/dotfiles/bundle.vim

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

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,,*.rbc,tmp,node_modules

" more natural splitting
set splitbelow
set splitright

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

" use ctrl h/j/k/l to switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map space in normal mode to CtrlP
map <Space> :CtrlP <CR>

" Map <Leader>-t to open CtrlP
map <Leader>t :CtrlP<CR>
vmap <Leader>t :CtrlP<CR>

" Configure build command for specific types of files
au BufRead,BufNewFile *_test.rb let b:dispatch = 'testrb %'
au BufRead,BufNewFile *_spec.rb let b:dispatch = 'rspec %'

" Map Enter in normal mode on regular windows to :Dispatch
" autocmd! CmdwinEnter * unmap <buffer> <CR>
" autocmd! CmdwinLeave * call s:MapCR()
" function! s:MapCR()
"   if mapcheck('<CR>', 'n') == ''
"     nmap <buffer> <CR> :Dispatch<CR>
"   endif
" endfunction
" call s:MapCR()"

" Map <Leader>d to :Dispatch
map <Leader>d :Dispatch <CR>
vmap <Leader>d :Dispatch <CR>

" Save buffer after a certain time after leaving insert mode
set updatetime=200
autocmd BufLeave,CursorHold,InsertLeave * silent! wa
