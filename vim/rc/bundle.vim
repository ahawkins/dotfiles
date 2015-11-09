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
Plugin "gmarik/vundle"

" Themes
Plugin "tpope/vim-vividchalk"

" Language & Project specific plugins
Plugin "timcharper/textile.vim"
Plugin "vim-ruby/vim-ruby"
Plugin "pangloss/vim-javascript"
Plugin "kchmck/vim-coffee-script"
Plugin "tpope/vim-haml"
Plugin "tpope/vim-markdown"
Plugin "tpope/vim-rails"
Plugin "nono/vim-handlebars"
Plugin "solarnz/thrift.vim"
Plugin "elzr/vim-json"
Plugin "rodjek/vim-puppet"
Plugin "elixir-lang/vim-elixir"
Plugin "uarun/vim-protobuf"
Plugin "mustache/vim-mustache-handlebars"
Plugin "vim-scripts/fish.vim"

" General plugins
Plugin "scrooloose/nerdtree"
Plugin "tpope/vim-fugitive"
Plugin "tpope/vim-git"
Plugin "tpope/vim-surround"
Plugin "tomtom/tcomment_vim"
Plugin "tpope/vim-endwise"
Plugin "tpope/vim-repeat"
Plugin "godlygeek/tabular"
Plugin "tpope/vim-dispatch"
Plugin "kien/ctrlp.vim"
Plugin "tacahiroy/ctrlp-funky"
Plugin "christoomey/vim-tmux-navigator"
Plugin "rking/ag.vim"
Plugin "AndrewRadev/switch.vim"
Plugin "milkypostman/vim-togglelist"


let g:ctrlp_extensions = ['funky']

if exists('fresh_vundle')
  BundleInstall
  unlet fresh_vundle
  wincmd c
endif
