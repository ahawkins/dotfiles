function fish_prepend_path
	if not string match -q $PATH $argv[1]
		set -x PATH $argv[1] $PATH
	end
end
