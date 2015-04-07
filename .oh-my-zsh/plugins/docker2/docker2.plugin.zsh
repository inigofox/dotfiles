local test_=$(boot2docker status) 2>/dev/null
if [[ $test_ == "running" ]]; then
    export DOCKER_HOST=tcp://$(boot2docker ip):2376
    export DOCKER_CERT_PATH=/Users/drodriguez/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
    alias docker-cmd="docker run -t -i"

    docker-build() { docker build -t=\'$1\' . }
    docker-bash() { docker run -t -i $1 /bin/bash }
    docker-stop-all() { docker rm `docker ps --no-trunc -aq` }
    docker-rmi() { docker rmi $(docker images | grep "^<none>" | awk '{print $3}')  }
    docker-salt() { docker run -t -i -v $2:/srv/salt -v $3:/srv/pillar $1 /bin/bash }
else
    # echo "boot2docker not running"
fi
