function p --description "Switch between projects"
	set -l config_file "$HOME/.projects.json"

	if test (count $argv) -eq 0
		if test -n "$TMUX"
			tmux choose-session
		else
			echo "USAGE: $_ [PROJECT]"
			echo

			echo "Configured projects:"
			jq -r 'keys | .[]' $config_file

			return 1
		end
	else
		set -l arg $argv[1]

		switch $arg
			case 'edit'
				eval $EDITOR $config_file
			case '*'
				# NOTE: The things are evaled to expand ~ or $HOME in project paths
				set -l project_root (eval echo (jq -er ".$arg.root" $config_file))
				set -l tmux_name (jq -er ".$arg.session" $config_file)

				tmux start-server ^&1 > /dev/null

				if not tmux has-session -t $tmux_name
					env TMUX= tmux new-session -d -c $project_root -s $tmux_name
					tmux send-keys -t $tmux_name vim Enter
				end

				if test -n "$TMUX"
					tmux switch -t $tmux_name
				else
					tmux attach -t $tmux_name
				end
		end
	end
end
