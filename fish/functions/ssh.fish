function ssh -w ssh
	set -l config_file (mktemp)

	mkdir -p ~/.config/ssh/conf.d

	cat ~/.config/ssh/conf.d/* > $config_file

	command ssh -F $config_file $argv
end
