#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Hombrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

echo "Installing vundler"
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Vundling..."
vim -u bundle.vim +BundleInstall +qall

echo "Installing development brews"
brew install git
brew install zsh 
brew install tmux reattach-to-user-namespace
brew install rbenv ruby-build
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
ln -sf "$script_dir/gemrc" ~/.gemrc
ln -sf "$script_dir/vimrc" ~/.vimrc
ln -sf "$script_dir/redbugrc" ~/.rdebugrc
ln -sf "$script_dir/zshrc" ~/.zshrc
ln -sf "$script_dir/zshenv" ~/.zshenv
ln -sf "$script_dir/rspec" ~/.rspec
ln -sf "$script_dir/tmux" ~/.tmux
rm -rf ~/.irssi
ln -sf "$script_dir/irssi/" ~/.irssi

echo "Setting global git ingore file"
git config --global core.excludesfile "$script_dir/gitignore"

echo "Time to enter ZSH"
chsh -s $(which zsh)
