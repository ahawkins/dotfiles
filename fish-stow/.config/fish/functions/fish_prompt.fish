set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_char_stateseparator ''

# I only care if things are clean or not
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '*'

function fish_prompt --description 'Write out the prompt'
	set -l git_color (set_color yellow)
	set -l prompt_color (set_color -o brblack)

	if command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD > /dev/null ^/dev/null
		echo -n -s "$git_color" (__fish_git_prompt 'git:%s') "$__fish_prompt_normal" ' ' "$prompt_color" '>>' "$__fish_prompt_normal" ' '
	else
		echo -n -s "$prompt_color" '>>' "$__fish_prompt_normal" ' '
	end
end
