" Soft Tabs
setlocal expandtab

au BufWritePre <buffer> :call CleanTrailingSpace()
