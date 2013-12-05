namespace :install do
  desc "Clones the vundler plugin into ~/.vim/bundle" 
  task :vundler do
    sh "rm -rf ~/.vim/bundle",
    sh  "mkdir -p ~/.vim/bundle",
    sh "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
  end

  desc "Update bundled vim plugins"
  task :vundle => :vundler do
    sh "vim -u bundle.vim +BundleInstall +qall"
  end

  desc "Install all listed brews"
  task :brews do
    brews = File.new(File.expand_path('../brews', __FILE__)).each_line.map(&:strip).to_a
    sh "brew install #{brews.join(' ')}"
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
      real_path = File.expand_path "../#{source}", __FILE__
      sh "ln -sf #{real_path} #{destination})";w
    end
  end

  desc "Install generated version of Gitignore from templates"
  task :gitignore do
    sh "git config --global core.excludesfile ~/dotfiles/gitignore.global"
  end

  task :all => [:vundle, :gitignore, :configs]
end

task :default => 'install:all'
