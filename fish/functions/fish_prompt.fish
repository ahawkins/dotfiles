set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_char_stateseparator ''

# I only care if things are clean or not
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '*'

function fish_prompt --description 'Write out the prompt'
	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q -g __fish_classic_git_functions_defined
		set -g __fish_classic_git_functions_defined

		function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
			if status --is-interactive
				set -e __fish_prompt_user
				commandline -f repaint ^/dev/null
			end
		end

		function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
			if status --is-interactive
				set -e __fish_prompt_host
				commandline -f repaint ^/dev/null
			end
		end
	end

	switch $USER

	case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

	case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

	end

	if not set -q __fish_prompt_user
		set -g __fish_prompt_user (set_color magenta)
	end
	if not set -q __fish_prompt_host
		set -g __fish_prompt_host (set_color yellow)
	end

	echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" ' ' at ' ' "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' in ' ' "$__fish_prompt_cwd" (prompt_pwd) (set_color -o yellow) (__fish_git_prompt '(%s)') "$__fish_prompt_normal" ' '
end
