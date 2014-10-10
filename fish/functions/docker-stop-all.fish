function docker-stop-all
  docker stop (docker ps -a -q)
  docker rm (docker ps -a -q)
end
