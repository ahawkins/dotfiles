namespace :install do
  desc "Symlinks config files to the apporitate locations" 
  task :configs do
    paths = {
      'gemrc' => '~/.gemrc',
      'irbrc' => '~/.irbrc',
      'rvmrc' => '~/.rvmrc',
      'vimrc.local' => '~/.vimrc.local',
      'gvimrc.local' => '~/.gvimrc.local',
      'global.gems' => '~/.rvm/gemsets/',
      'profile' => '~/.profile'
    }.each_pair do |source, destination|
      puts "Linking #{source} => #{destination}"
      real_path = File.expand_path "../#{source}", __FILE__    
      %x(ln -sf #{real_path} #{destination})
    end
  end

  desc "Install global gems"
  task :gems => :configs do
    %x(source ~/.rvm/scripts/rvm; for ruby in $(rvm list strings) ; do rvm ${ruby}@global ; echo "Importing global gems into $ruby" ; rvm gemset import ~/.rvm/gemsets/global.gems ; done)
  end
  
  desc "Install/Update my Janus fork"
  task :janus do
    if File.directory?('~/.vim') 
      %x(cd ~/.vim ; rake)
    else
      %x(git clone git://github.com/Adman65/janus.git ~/.vim ; cd ~/.vim ; rake)
    end
  end
  
  desc "Install generated version of Gitignore from templates"
  task :gitignore do
    git_ignore_path = File.expand_path '../gitignore.global', __FILE__
    if File.exists? git_ignore_path
      %x(rm #{git_ignore_path})
    end

    # create a new file to write the templates into
    %x(touch #{git_ignore_path})

    # copy templates into file
    templates = %w(Ruby Rails Global/OSX Global/vim Global/TextMate)
    templates.each do |template|
      template_path = File.expand_path "../gitignore/#{template}.gitignore", __FILE__
      puts "Installing #{template_path}"
      %x(cat #{template_path} >> #{git_ignore_path})
    end

    %x(git config --global core.excludesfile #{git_ignore_path})
  end

  task :all => [:janus, :configs, :gems, :gitignore]
end

task :default => 'install:all'
