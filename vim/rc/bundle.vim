if !isdirectory(expand('~/.vim/bundle/vundle'))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  let fresh_vundle = 1
endif

set nocompatible

" this must be turned off for vundle, but is renabled later
" See: http://tooky.co.uk/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle "gmarik/vundle"

" Themes
Bundle "tpope/vim-vividchalk"

" Language & Project specific plugins
Bundle "timcharper/textile.vim"
Bundle "vim-ruby/vim-ruby"
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "nono/vim-handlebars"

" " General plugins
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "tpope/vim-surround"
Bundle "ddollar/nerdcommenter"
Bundle "rking/ag.vim"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-repeat"
Bundle "godlygeek/tabular"
Bundle "tpope/vim-dispatch"
Bundle "kien/ctrlp.vim"
Bundle "tacahiroy/ctrlp-funky"
Bundle "christoomey/vim-tmux-navigator"
Bundle "rking/ag.vim"
Bundle "AndrewRadev/switch.vim"

let g:ctrlp_extensions = ['funky']

if exists('fresh_vundle')
  BundleInstall
  unlet fresh_vundle
  wincmd c
endif
