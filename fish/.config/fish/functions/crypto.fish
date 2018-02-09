function crypto --description 'gpg/crypto helpers'
	switch "$argv[1]"
		case reload
			gpg-connect-agent reloadagent /bye
		case ssh
			ssh-add -L | grep --color=never -Fi 'cardno'
		case gpg
			gpg -a --export 'hi@ahawkins.me'
		case '*'
			echo "Unknown command $argv[1]" ^&1
			return 1
	end
end
