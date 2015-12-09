export GO15VENDOREXPERIMENT=1

ex-gopath() {
    export GOPATH=$(pwd)
    echo $GOPATH
}
