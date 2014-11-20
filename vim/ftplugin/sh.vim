" Set Hard Tabs
"
" Set softtabstop to control how many columns vim uses when you hit Tab in
" insert mode. If softtabstop is less than tabstop and expandtab is not set,
" vim will use a combination of tabs and spaces to make up the desired
" spacing. If softtabstop equals tabstop and expandtab is not set, vim will
" always use tabs. When expandtab is set, vim will always use the appropriate
" number of spaces.
"
" settings.vim sets softtabscop & tabstop to equal values. Unsetting this
" tells vim to use hard tabs.
set noexpandtab
