local test_=$(docker-machine status default) 2>/dev/null

docker-machine-create() {
  docker-machine create -d virtualbox --virtualbox-cpu-count "2" --virtualbox-memory 4096 default
}

docker-env() {
  if [[ $test_ == "Running" ]]; then
  else
    docker-machine start default
  fi
  docker-machine env default
  eval "$(docker-machine env default)"
}

if [[ $test_ == "Running" ]]; then
    eval "$(docker-machine env default)"
else
    # echo "docker-machine not running"
fi

alias docker-cmd="docker run -it"
docker-build() { docker build -t=\'$1\' . }
docker-bash() { docker run -it $1 /bin/bash }
docker-stop-all() { docker stop $(docker ps -a -q) }
docker-rm-stop() { docker rm $(docker ps -a -q) }
docker-rmi-none() { docker rmi $(docker images | grep "^<none>" | awk '{print $3}') }
docker-clean() { docker-stop-all; docker-rm-stop; docker-rmi-none; }
# docker-salt() { docker run -t -i -v $2:/srv/salt -v $3:/srv/pillar $1 /bin/bash }
