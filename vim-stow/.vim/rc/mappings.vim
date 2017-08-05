" Leader/Remaps
let mapleader=','

" Tab to go next buffer
" Shift-Tab to go previous buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Map 2x leader to toggle buffers
nnoremap <Leader><Leader> <C-^>

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" use ctrl h/j/k/l to switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map - to switch plugin
noremap - :Switch<CR>

" Map space in normal mode to CtrlP
nnoremap <Space> :CtrlP <CR>
nnoremap <Space><Space> :CtrlPFunky <CR>

" Autoformat file & cursors stays in same position
nnoremap === mgg=G`m^zz

" Dispatch
nnoremap <Leader>d :Dispatch <CR>
nnoremap <Leader>db :Dispatch bundle<CR>

" Run dispatch with enter
autocmd! CmdwinEnter * unmap <buffer> <CR>
autocmd! CmdwinLeave * call s:MapCR()
function! s:MapCR()
  if mapcheck('<CR>', 'n') == ''
    nmap <buffer> <CR> :Dispatch<CR>
  endif
endfunction
call s:MapCR()

" Indent and outdent keep visual selection
vnoremap > >gv
vnoremap < <gv

" Searching
map <leader>a :Ag<space>

" Make . in visual mode execute command across section in normal mode
" aka . works in visual mode
" From Vim masterclass
xnoremap . :norm.<CR>

" Make @ reply macro across visual selection
" From Vim masterclass
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>"
