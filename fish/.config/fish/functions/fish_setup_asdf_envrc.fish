function fish_setup_asdf_envrc --on-event fish_prompt
	if not test -f .tool-versions
		return
	end

	if not test -f .envrc
		echo "use asdf" > .envrc
		direnv allow
	else if not grep -qF 'use asdf' .envrc
		echo "use asdf" >> .envrc
		direnv allow
	end
end
