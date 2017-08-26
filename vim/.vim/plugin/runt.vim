" runt.vim - A test runner for ruby
" Maintainer: Terje Larsen <https://www.github.com/terlar>
" Version:    0.1
if exists('g:loaded_runt') || exists(':Rrunner')
  finish
endif

let g:loaded_runt = 1

" Initialization {{{
function! runt#init(path)
  if exists('b:rake_root')
    let b:runt_root = b:rake_root
  elseif !exists('b:runt_root')
    let dir = s:find_root(a:path)

    if dir !=# ''
      let b:runt_root = dir
    endif
  endif

  if exists('b:runt_root')
    silent doautocmd User Runt
  endif
endfunction

function! s:find_root(path) abort
  let markers = ['Gemfile', 'Rakefile', '.git', '.hg', '.svn', '.bzr']

  let root = a:path
  let prev = ''

  while root !=# prev && root !=# '/'
    for marker in markers
      if getftime(root.'/'.marker) != -1
        return root
      endif
    endfor

    let prev = root
    let root = fnamemodify(root, ':h')
  endwhile

  return ''
endfunction
" }}}

" Project {{{
function! runt#has_path(path)
  return getftime(b:runt_root.'/'.a:path) != -1
endfunction

function! runt#has_feature(feature)
  let map = {
    \'bundler': 'Gemfile',
    \'rake':    'Rakefile'}

  let path = get(map, a:feature, a:feature.'/')
  return runt#has_path(path)
endfunction

function! runt#find_first_file(...) abort
  for file in a:000
    if runt#has_path(file)
      return file
    endif
  endfor
  return ''
endfunction

function! runt#find_test_file(filename)
  let path = fnamemodify(a:filename, ':p')
  let name = path[strlen(b:runt_root)+1 : -1]

  if name =~# '^\%(test\|spec\)/'
    return name
  else
    let bare = substitute(name[4:-1], '\.rb$', '', 'g')
    return runt#find_first_file(
      \'test/'.bare.'_test.rb',
      \'spec/'.bare.'_spec.rb',
      \'test/lib/'.bare.'_test.rb',
      \'spec/lib/'.bare.'_spec.rb',
      \'test/unit/'.bare.'_test.rb',
      \'spec/unit/'.bare.'_spec.rb')
  endif
endfunction
" }}}

" :Rrunner
function! runt#run_command(bang, count, args) abort
  if !empty(a:args)
    let args = a:args
  elseif a:count
    let args = @%
  else
    let args = runt#find_test_file(@%)
    if empty(args)
      let args = a:args
    endif
  endif

  let extra = ''

  if args =~# '^test/.*_test\.rb$'
    let compiler = 'rubyunit'
  elseif args =~# '^spec/.*\%(_spec\.rb\|\.feature\)$'
    if executable('rspec')
      let compiler = 'rspec'
    else
      let compiler = 'rubyunit'
    end
  elseif args =~# '^features/.*\.feature$'
    let compiler = 'cucumber'
  else
    let compiler = 'ruby'
  endif

  execute 'compiler '.compiler

  if compiler ==# 'ruby'
    let &l:makeprg = 'rake'
  elseif compiler ==# 'rubyunit'
    let &l:makeprg = 'ruby -Itest'
  elseif compiler ==# 'rspec'
    if a:count > 0
      let extra = ':'.a:count
    endif
  endif

  if runt#has_feature('bundler')
    let &l:makeprg = 'bundle exec '.&l:makeprg
  endif

  call s:make(a:bang, args.extra)

  return ''
endfunction

function! s:make(bang, args, ...)
  if exists(':Make')
    execute 'Make'.(a:bang ? '! ' : ' ').a:args
  else
    execute 'make! '.a:args
    if !a:bang
      execute (a:0 ? a:1 : 'cwindow')
    endif
  endif
endfunction

augroup runt_commands
  autocmd!
  autocmd User Runt
    \ command! -buffer -bang -nargs=? -range=0 -complete=customlist,runt#command_complete Rrunner
    \ execute runt#run_command(<bang>0, <count>?<line1>:0, <q-args>)
augroup END

augroup runt
  autocmd!
  autocmd FileType ruby call runt#init(expand('%:p'))
augroup END
