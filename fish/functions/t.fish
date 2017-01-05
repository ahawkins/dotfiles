function t
	switch "$argv[1]"
		case ss # saltside
			set -x TODO_FILE $TODO_DIR/saltside.txt
			command todo.sh $argv[2..-1]
		case sd # slashdeploy
			set -x TODO_FILE $TODO_DIR/slashdeploy.txt
			command todo.sh $argv[2..-1]
		case '*'
			command todo.sh $argv
	end
end
