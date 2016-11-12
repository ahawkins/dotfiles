#!/usr/bin/env bash

set -eou pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking configs from ${script_dir}"
mkdir -p ~/.config
ln -sf "${script_dir}/tmux" ~/.tmux.conf

ln -sf "${script_dir}/agignore" ~/.agignore

ln -sf "${script_dir}/git/gitignore" ~/.gitignore
ln -sf "${script_dir}/git/gitconfig" ~/.gitconfig
ln -sf "${script_dir}/git/templates" ~/.git-templates

rm -rf ~/.config/fish
ln -sf "${script_dir}/fish/" ~/.config/fish

rm -rf ~/.vimrc

ln -sfh "${script_dir}/vim/functions" ~/.vim/functions
ln -sfh "${script_dir}/vim/ftplugin" ~/.vim/ftplugin
ln -sfh "${script_dir}/vim/plugin" ~/.vim/plugin
ln -sfh "${script_dir}/vim/rc" ~/.vim/rc
ln -sf "${script_dir}/vim/vimrc" ~/.vimrc


if [ "${SHELL}" != "$(which fish)" ]; then
  echo "Time to enter Fish"
  chsh -s $(which fish)
fi
