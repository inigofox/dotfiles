alias docker-cmd="docker run -it"
docker-build() { docker build -t=\'$1\' . }
docker-bash() { docker run -it $1 /bin/bash }
docker-stop-all() { docker stop $(docker ps -a -q) }
docker-delete-stop() { docker rm $(docker ps -a -q) }
docker-rmi-none() { docker rmi $(docker images | grep "^<none>" | awk '{print $3}') }
docker-clean() { docker-delete-stop; docker-rmi-none; }
