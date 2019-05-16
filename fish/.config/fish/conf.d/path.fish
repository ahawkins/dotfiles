if not string match ~/.local/bin $PATH > /dev/null
	set -x PATH ~/.local/bin $PATH
end

if not string match /usr/local/bin $PATH > /dev/null
	set -x PATH $PATH /usr/local/bin
end

if not string match /usr/local/sbin $PATH > /dev/null
	set -x PATH $PATH /usr/local/sbin
end
