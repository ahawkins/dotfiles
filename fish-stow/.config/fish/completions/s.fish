# Check if there is an existing argument provided on the command line. This is
# the command -poc call. The -c option follows the cursor. It does not behave
# correctly without it. Also check if S_SRC_DIR is set. This prevent failing
# completions if the environment is not configured properly.
function __s_project_can_complete
	set -q S_SRC_DIR; or return 1

	set -l cmd (commandline -poc)
	not set -q cmd[2]
end

function __s_project_completions
	# NOTE: tree is faster than find for this sort of depth first traversal
	# as it does not have to proces all files/directories through filters.
	# The output is directory/project. Also strip out the first line which
	# for the top level directory.
	tree -L 2 -d -if $S_SRC_DIR | tail -n +2 | string replace "$S_SRC_DIR/" '' | grep --color=never -F '/'
end

complete -c s -n '__s_project_can_complete' -f -a '(__s_project_completions)'
