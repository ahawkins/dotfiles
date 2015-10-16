" Hard Tabs
setlocal expandtab

" Clean trailing whitespace
au BufWritePre <buffer> :call CleanTrailingSpace()
