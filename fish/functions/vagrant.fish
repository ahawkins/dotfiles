function vagrant
	switch $argv[1]
		case teardown
			command vagrant global-status | grep running | awk '{print $1}' | xargs -L1 vagrant halt
		case '*'
			command vagrant $argv
	end
end
