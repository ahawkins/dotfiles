# Configure ASDF for use with https://github.com/asdf-community/asdf-direnv
if test -f ~/.asdf/asdf.fish
	fish_append_path ~/.asdf/bin
	ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/asdf.fish
end
