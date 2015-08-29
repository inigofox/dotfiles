local test_=$(docker-machine status docker-dev) 2>/dev/null
if [[ $test_ == "Running" ]]; then
    eval "$(docker-machine env docker-dev)"

    alias docker-cmd="docker run -t -i"
    docker-build() { docker build -t=\'$1\' . }
    docker-bash() { docker run -t -i $1 /bin/bash }
    docker-stop-all() { docker rm `docker ps --no-trunc -aq` }
    docker-rmi() { docker rmi $(docker images | grep "^<none>" | awk '{print $3}')  }
    # docker-salt() { docker run -t -i -v $2:/srv/salt -v $3:/srv/pillar $1 /bin/bash }
else
    # echo "boot2docker not running"
fi
