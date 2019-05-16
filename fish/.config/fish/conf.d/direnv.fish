# Shutup direnv
set -x DIRENV_LOG_FORMAT ""

if type -q direnv
	eval (direnv hook fish)
end
