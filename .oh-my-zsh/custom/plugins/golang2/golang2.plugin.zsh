export GO15VENDOREXPERIMENT=1

export GOPATH=~/workspace

gopathhere() {
    export GOPATH=$(pwd)
    echo $GOPATH
}
