" Hard tabs
setlocal noexpandtab

" Clean trailing witespace
au BufWritePre <buffer> :call CleanTrailingSpace()
