function t
	if not set --query argv[1]
		command todo.sh ls
	else
		command todo.sh $argv
	end
end
