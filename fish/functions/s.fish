function s
	switch $argv[1]
		case dotfiles
			command s ahawkins/dotfiles
		case bindir
			command s ahawkins/bindir
		case '*'
			command s $argv
	end
end
