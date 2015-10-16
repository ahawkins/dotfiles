function rebrew
	brew update
	brew cleanup
	set -lx outdated_brews (brew outdated)
	if count $outdated_brews
		brew unlink $outdated_brews
		brew uninstall $outdated_brews
		brew install $outdated_brews
	else
		echo "Everything up to date"
	end
end
