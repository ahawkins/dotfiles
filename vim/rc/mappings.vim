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

" <Leader># Surround a word with #{ruby interpolation}
map <Leader># ysiw#
vmap <Leader># c#{<C-R>"}<ESC>

" <Leader>" Surround a word with "quotes"
map <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>

" <Leader>' Surround a word with 'single quotes'
map <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>

" <Leader>) or <Leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <Leader>( ysiw(
map <Leader>) ysiw)
vmap <Leader>( c( <C-R>" )<ESC>
vmap <Leader>) c(<C-R>")<ESC>

" <Leader>[ Surround a word with [brackets]
map <Leader>] ysiw]
map <Leader>[ ysiw[
vmap <Leader>[ c[ <C-R>" ]<ESC>
vmap <Leader>] c[<C-R>"]<ESC>

" <Leader>{ Surround a word with {braces}
map <Leader>} ysiw}
map <Leader>{ ysiw{
vmap <Leader>} c{ <C-R>" }<ESC>
vmap <Leader>{ c{<C-R>"}<ESC>

" <Leader>` Surround a word with `brackets`
map <Leader>` ysiw`
vmap <Leader>` c`<C-R>"`<ESC>

" use ctrl h/j/k/l to switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map - to switch plugin
noremap - :Switch<CR>

" Map space in normal mode to CtrlP
map <Space> :CtrlP <CR>
nnoremap <Leader>f :CtrlPFunky<CR>

" Autoformat file & cursors stays in same position
nnoremap === mgg=G`m^zz

" Map <Leader>d to :Dispatch
map <Leader>d :Dispatch <CR>

" Dispatch
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

" Mapping for Ag.vim
map <leader>f :Ag<space>

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
