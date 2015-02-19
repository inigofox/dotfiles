alias k=clear

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

c() {
    cd $HOME/code/$1
}
_c() {
    conda_root_dir
    compadd $(ls ~/code/)
}
compdef _c c

alias docker-cmd="docker run -t -i"
docker-build() { docker build -t=\'$1\' . }
docker-bash() { docker run -t -i $1 /bin/bash }
docker-stop-all() { docker rm `docker ps --no-trunc -aq` }
docker-rmi() { docker rmi $(docker images | grep "^<none>" | awk '{print $3}')  }
docker-salt() { docker run -t -i -v $2:/srv/salt -v $3:/srv/pillar $1 /bin/bash }
