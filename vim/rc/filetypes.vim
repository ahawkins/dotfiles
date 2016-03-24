" Required by vundle
filetype plugin indent on

" Set file types for custom files
au BufRead,BufNewFile {AssetFile,Vagrantfile,Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.handlebars,*.hbs,*.hjs set ft=handlebars

" Custom Ruby Extensions
au BufRead,BufNewFile *{god,dropzone} set ft=ruby

" .asc => Asciidoc
au BufRead,BufNewFile *.asc set ft=asciidoc

" .bats => Shell
au BufRead,BufNewFile *.bats set ft=sh
au BufRead,BufNewFile *.bats let g:is_bash=1

" .fish => Fish
au BufRead,BufNewFile *.fish set ft=fish
