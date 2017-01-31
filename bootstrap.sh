#!/usr/bin/env bash

set -eou pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking configs from ${script_dir}"
mkdir -p ~/.config
ln -sf "${script_dir}/tmux" ~/.tmux.conf

ln -sf "${script_dir}/agignore" ~/.agignore

ln -sf "${script_dir}/git/gitignore" ~/.gitignore
ln -sf "${script_dir}/git/gitconfig" ~/.gitconfig
ln -sFh "${script_dir}/git/templates" ~/.git-templates

rm -rf ~/.config/fish
ln -sFh "${script_dir}/fish" ~/.config/fish

rm -rf ~/.vimrc

mkdir -p ~/.vim

ln -sFh "${script_dir}/vim/functions" ~/.vim/functions
ln -sFh "${script_dir}/vim/ftplugin" ~/.vim/ftplugin
ln -sFh "${script_dir}/vim/plugin" ~/.vim/plugin
ln -sFh "${script_dir}/vim/rc" ~/.vim/rc
ln -sFh "${script_dir}/vim/spell" ~/.vim/spell
ln -sf "${script_dir}/vim/vimrc" ~/.vimrc

ln -sf "${script_dir}/ledgerrc" ~/.ledgerrc

case "$(uname -a | tr '[:upper:]' '[:lower:]')" in
	*darwin*)
		ln -sf "${script_dir}/iterm2.plist" ~/Library/Preferences/com.googlecode.iterm2.plist
		;;
esac

if [ "${SHELL}" != "$(which fish)" ]; then
  echo "Time to enter Fish"
  chsh -s $(which fish)
fi
