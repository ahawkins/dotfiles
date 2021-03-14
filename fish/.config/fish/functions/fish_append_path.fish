function fish_append_path
	if not string match -q $PATH $argv[1]
		set -x PATH $PATH $argv[1]
	end
end
