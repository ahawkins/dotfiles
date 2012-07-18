namespace :install do
  desc "Symlinks config files to the apporitate locations" 
  task :configs do
    paths = {
      'gemrc' => '~/.gemrc',
      'irbrc' => '~/.irbrc',
      'rvmrc' => '~/.rvmrc',
      'vimrc' => '~/.vimrc',
      'gvimrc' => '~/.gvimrc',
      'rdebugrc' => '~/.rdebugrc',
      'global.gems' => '~/.rvm/gemsets/',
      'zshrc' => '~/.zshrc',
      'rspec' => '~/.rspec'
    }.each_pair do |source, destination|
      puts "Linking #{source} => #{destination}"
      real_path = File.expand_path "../#{source}", __FILE__    
      %x(ln -sf #{real_path} #{destination})
    end

    vim_path = File.expand_path '../vim', __FILE__
    %x(ln -sf #{vim_path} ~/.vim)
  end

  desc "Installs vim bundles"
  task :bundle do
    git_bundles = [ 
      "git://github.com/airblade/vim-rooter",
      "https://github.com/scrooloose/nerdtree.git",
      "git://github.com/timcharper/textile.vim.git",
      "git://github.com/tpope/vim-cucumber.git",
      "git://github.com/tpope/vim-fugitive.git",
      "git://github.com/tpope/vim-git.git",
      "git://github.com/tpope/vim-haml.git",
      "git://github.com/tpope/vim-markdown.git",
      "git://github.com/tpope/vim-rails.git",
      "git://github.com/tpope/vim-surround.git",
      "git://github.com/tpope/vim-vividchalk.git",
      "git://github.com/tsaleh/vim-align.git",
      "git://github.com/tsaleh/vim-supertab.git",
      "git://github.com/ddollar/nerdcommenter.git",
      "git://github.com/vim-ruby/vim-ruby.git",
      "git://github.com/hallettj/jslint.vim.git",
      "git://github.com/pangloss/vim-javascript.git",
      "git://github.com/mileszs/ack.vim.git",
      "git://github.com/tpope/vim-endwise.git",
      "git://github.com/robgleeson/vim-markdown-preview.git",
      "git://github.com/mattn/gist-vim.git",
      "git://github.com/hallettj/jslint.vim.git",
      "git://github.com/taq/vim-rspec.git",
      "git://github.com/ajf/puppet-vim.git",
      "git://github.com/kchmck/vim-coffee-script.git",
      "git://github.com/tsaleh/vim-align.git"
    ]

    vim_org_scripts = [
      #["jquery",        "12107", "syntax"],
    ]

    require 'fileutils'
    require 'open-uri'

    bundle_dir = File.expand_path('../vim/bundle', __FILE__)
    FileUtils.mkdir_p bundle_dir

    # wipe the directory so we get a fresh start
    # so only the listed plugins are installed
    # except peepopen
    Dir[bundle_dir + "/*"].each do |dir|
      if !dir.match /peepopen/
        %x(rm -rf #{dir})
      end
    end

    git_bundles.each do |url|
      `cd #{bundle_dir} ; git clone #{url}`
    end

    vim_org_scripts.each do |name, script_id, script_type|
      puts "  Downloading #{name}"
      local_file = File.join(bundle_dir, name, script_type, "#{name}.vim")
      FileUtils.mkdir_p(File.dirname(local_file))
      File.open(local_file, "w") do |file|
        file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
      end
    end
  end

  desc "Install generated version of Gitignore from templates"
  task :gitignore do
    git_ignore_path = File.expand_path '../gitignore.global', __FILE__
    if File.exists? git_ignore_path
      %x(rm #{git_ignore_path})
    end

    # create a new file to write the templates into
    git_ignore = File.open git_ignore_path, "w"

    # copy templates into file
    templates = %w(Ruby Rails Global/OSX Global/vim Global/TextMate)
    templates.each do |template|
      template_path = File.expand_path "../gitignore/#{template}.gitignore", __FILE__
      puts "Installing #{template_path}"
      git_ignore.puts File.read(template_path)
    end

    # custom ignores
    git_ignore.puts File.read(File.expand_path('../gitignore.custom', __FILE__))

    %x(git config --global core.excludesfile #{git_ignore_path})

    git_ignore.close
  end

  task :all => [:bundle, :configs, :gitignore]
end

task :default => 'install:all'
