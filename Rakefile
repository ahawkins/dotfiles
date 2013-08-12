namespace :install do
  desc "Clones the vundler plugin into ~/.vim/bundle" 
  task :vundler do
    commands = [
      "mkdir -p ~/.vim/bundle",
      "rm -rf ~/.vim/bundle/vundle",
      "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    ]

    command = commands.join " ; "
    puts "Running: #{command}"

    `#{command}`
  end

  desc "Update bundled vim plugins"
  task :vundle => :vundler do
    `vim -u bundle.vim +BundleInstall +qall`
  end

  desc "Install all listed brews"
  task :brews do
    brews = File.new(File.expand_path('../brews', __FILE__)).each_line.map(&:strip).to_a
    `brew install #{brews.join(' ')}`
  end

  desc "Symlinks config files to the apporitate locations" 
  task :configs do
    paths = {
      'gemrc' => '~/.gemrc',
      'vimrc' => '~/.vimrc',
      'gvimrc' => '~/.gvimrc',
      'rdebugrc' => '~/.rdebugrc',
      'zshrc' => '~/.zshrc',
      'zshenv' => '~/.zshenv',
      'rspec' => '~/.rspec',
      'tmux' => '~/.tmux.conf',
      'irssi' => '~/.irssi',
      'workspace' => '~/workspace'
    }.each_pair do |source, destination|
      puts "Linking #{source} => #{destination}"
      real_path = File.expand_path "../#{source}", __FILE__    
      %x(ln -sf #{real_path} #{destination})
    end
  end

  desc "Install generated version of Gitignore from templates"
  task :gitignore do
    %x(git config --global core.excludesfile ~/dotfiles/gitignore.global)
  end

  task :all => [:install_vundler, :gitignore, :configs, :vundle]
end

task :default => 'install:all'
