" Configure build command for specific types of files
au BufRead,BufNewFile *_test.rb let b:dispatch = 'testrb %'
au BufRead,BufNewFile *_spec.rb let b:dispatch = 'rspec %'

nmap <buffer> <CR> :Rrunner<CR>
nmap <buffer> <Leader><CR> :.Rrunner<CR>

au BufWritePre <buffer> :call CleanTrailingSpace()
