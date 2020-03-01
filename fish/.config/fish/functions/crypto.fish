function crypto --description 'gpg/crypto helpers'
	switch "$argv[1]"
		case restart
			gpgconf --kill gpg-agent
			gpg-connect-agent reloadagent /bye
		case ssh
			ssh-add -L | grep --color=never -Fi 'cardno'
		case gpg
			gpg -a --export 'adam@hawkins.io'
		case '*'
			echo "Unknown command $argv[1]" 1>&2
			return 1
	end
end
