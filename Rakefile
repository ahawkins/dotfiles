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
  
  desc "Install/Update my Janus fork"
  task :janus do
    if File.directory?('~/.vim') 
      %x(cd ~/.vim ; rake)
    else
      %x(git clone git://github.com/Adman65/janus.git ~/.vim ; cd ~/.vim ; rake)
    end
  end
  
  task :all => [:janus, :configs]
end

task :default => 'install:all'
