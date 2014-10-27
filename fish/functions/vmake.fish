function vmake
  vagrant ssh -c "cd /vagrant && make $argv"
end
