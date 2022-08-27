function brewup
  brew update

  set -l outdated_brews (brew outdated)

  if count $outdated_brews > /dev/null
  	brew upgrade $outdated_brews
  else
		echo 'No brews to upgrade'
	end

	brew cleanup
end
