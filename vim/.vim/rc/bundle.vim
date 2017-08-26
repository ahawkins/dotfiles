if !isdirectory(expand('~/.vim/bundle/Vundle.vim'))
  !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let fresh_vundle = 1
endif

set nocompatible

" this must be turned off for vundle, but is renabled later
" See: http://tooky.co.uk/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
filetype on
filetype off

" Add vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'tpope/vim-vividchalk'
Plugin 'w0ng/vim-hybrid'

" Language & Project specific plugins
Plugin 'timcharper/textile.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'nono/vim-handlebars'
Plugin 'solarnz/thrift.vim'
Plugin 'elzr/vim-json'
Plugin 'rodjek/vim-puppet'
Plugin 'elixir-lang/vim-elixir'
Plugin 'uarun/vim-protobuf'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-scripts/fish.vim'
Plugin 'asciidoc/vim-asciidoc'

" General plugins
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rking/ag.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'milkypostman/vim-togglelist'

" Required by vundle
call vundle#end()
filetype plugin indent on

let g:ctrlp_extensions = ['funky']

if exists('fresh_vundle')
  PluginInstall
  unlet fresh_vundle
  wincmd c
endif
