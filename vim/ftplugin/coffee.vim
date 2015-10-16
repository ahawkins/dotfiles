" soft Tabs with 2 psaces
setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal expandtab

" Clean trailing whitespace
au BufWritePre <buffer> :call CleanTrailingSpace()
