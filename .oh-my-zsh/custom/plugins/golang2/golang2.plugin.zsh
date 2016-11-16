export GOPATH=~/workspace/go
export PATH=$GOPATH/bin:$PATH

gopathhere() {
    export GOPATH=$(pwd)
    export PATH=$GOPATH/bin:$PATH
    echo GOPATH=$GOPATH
    echo PATH=$PATH
}
