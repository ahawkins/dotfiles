function! CleanTrailingSpace()
  let save_cursor = getpos('.')
  :%s/\s\+$//e
  :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
  unlet save_cursor
endfunction
