#!/usr/bin/env bash

set -eou pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking configs"
mkdir -p ~/.config
ln -sf "$script_dir/tmux" ~/.tmux

ln -sf "$script_dir/gitignore" ~/.gitignore
ln -sf "$script_dir/gitconfig" ~/.gitconfig

rm -rf ~/.config/fish
ln -sf "$script_dir/fish/" ~/.config/fish

rm -rf ~/.vimrc
rm -rf ~/.vim
mkdir -p ~/.vim

ln -sf "$script_dir/vim/functions" ~/.vim/functions
ln -sf "$script_dir/vim/ftplugin" ~/.vim/ftplugin
ln -sf "$script_dir/vim/plugin" ~/.vim/plugin
ln -sf "$script_dir/vim/rc" ~/.vim/rc
ln -sf "$script_dir/vim/vimrc" ~/.vimrc

if [ "$SHELL" !=  "$(which fish)" ]; then
  echo "Time to enter Fish"
  chsh -s $(which fish)
fi
