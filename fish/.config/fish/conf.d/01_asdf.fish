# Configure ASDF for use with https://github.com/asdf-community/asdf-direnv
if test -f ~/.asdf/asdf.fish
	# Only add the asdf executable itself, do not source everything
	fish_add_path ~/.asdf/bin
	ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/asdf.fish
end
