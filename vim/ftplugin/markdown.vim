call SetupWrapping()

" Soft Tabs
setlocal noexpandtab

au BufWritePre <buffer> :call CleanTrailingSpace()

map <buffer> <Leader>m :Mm <CR>

" <Leader>` Surround a word with `brackets`
map <Leader>` ysiw`
vmap <Leader>` c`<C-R>"`<ESC>
