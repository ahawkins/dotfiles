#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Hombrew
# ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Rbenv
if [ ! -d "~/.rbenv" ] ; then
  echo "Installing rbenv"
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi

echo "Installing vundler"
# mkdir -p ~/.vim/bundle
# rm -rf ~/.vim/bundle/vundle
# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Vundling..."
# vim -u bundle.vim +BundleInstall +qall

echo "Installing development brews"
brew install git
brew install fish
brew install tmux reattach-to-user-namespace
brew install ruby-build
brew install node haskell-platform
brew install the_silver_searcher
brew install mongodb
brew install postgresql
brew install memcached
brew install elasticsearch
brew install rabbitmq
brew install redis
brew install wget
brew install hub
brew install irssi

echo "Installing personal brews"
brew install flac lame id3tool id3v2

echo "Installing services"
ln -nfs /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
ln -nfs /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
ln -nfs /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
ln -nfs /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
ln -nfs /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
ln -nfs /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents

echo "Linking configs"
mkdir -p ~/.config
ln -sf "$script_dir/gemrc" ~/.gemrc
ln -sf "$script_dir/vimrc" ~/.vimrc
ln -sf "$script_dir/redbugrc" ~/.rdebugrc
ln -sf "$script_dir/rspec" ~/.rspec
ln -sf "$script_dir/tmux" ~/.tmux
ln -sf "$script_dir/gitignore" ~/.gitignore
ln -sf "$script_dir/gitconfig" ~/.gitconfig
rm -rf ~/.irssi
ln -sf "$script_dir/irssi/" ~/.irssi
rm -rf ~/.config/fish
ln -sf "$script_dir/fish/" ~/.config/fish

if [ "$SHELL" !=  "$(which fish)" ]; then
  echo "Time to enter Fish"
  chsh -s $(which fish)
fi
