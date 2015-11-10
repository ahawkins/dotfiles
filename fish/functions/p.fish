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
			case 'list'
				jq -r 'keys | .[]' $config_file

				return 1
			case '*'
				# NOTE: The things are evaled to expand ~ or $HOME in project paths
				set -l project_root (eval echo (jq -er ".$arg.root" $config_file))
				set -l tmux_name (jq -er ".$arg.session" $config_file)

				# NOTE: jq returns the "null" string for missing keys. It also
				# exits non-zero, but fish does not have an equivalent to set -e
				# so command failures most be handled in this way.
				if test "null" = "$project_root" ;or test "null" = "$tmux_name"
					echo "$arg project not configured correctly" >&2
					return 1
				end

				if not test -d "$project_root"
					echo "$project_root is not a directory" >&2
					return 1
				end

				tmux start-server ^&1 > /dev/null

				if not tmux has-session -t $tmux_name ^&1 > /dev/null
					env TMUX= tmux new-session -d -c $project_root -s $tmux_name
					tmux send-keys -t $tmux_name $EDITOR Enter
				end

				if test -n "$TMUX"
					tmux switch -t $tmux_name
				else
					tmux attach -t $tmux_name
				end
		end
	end
end
