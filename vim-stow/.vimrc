" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif

runtime! functions/*.vim

runtime rc/bundle.vim
runtime rc/settings.vim
runtime rc/filetypes.vim
runtime rc/mappings.vim
