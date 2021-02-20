if not string match ~/.local/bin $PATH > /dev/null
	set -x PATH ~/.local/bin $PATH
end

if test -d ~/.local/comp/bin
	if not string match ~/.local/comp/bin $PATH > /dev/null
		set -x PATH ~/.local/comp/bin $PATH
	end
end

set -x YARN_PREFIX $HOME/.yarn

if not string match $YARN_PREFIX/bin $PATH > /dev/null
	set -x PATH $YARN_PREFIX/bin $PATH
end

if test -f ~/.asdf/asdf.fish
	source ~/.asdf/asdf.fish

	ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/asdf.fish
end
