call SetupWrapping()

au BufWritePre <buffer> :call CleanTrailingSpace()
