export PATH=$HOME/anaconda/bin:$PATH

fpath+=$PWD
compinit conda

conda_root_dir() {
    # This works but its slow, just hard coded :)
    # ANACONDA=$(conda info | grep root | awk 'BEGIN { FS = " " } ; { print $4 }' | sed 's/^[ \t]*//;s/[ \t]*$//')
    ANACONDA="$HOME/anaconda"
}

lsvirtualenvs() {
    conda_root_dir
    ls $ANACONDA/envs
}

mkvirtualenv() {
    conda_root_dir
    $ANACONDA/bin/conda create -n $1 pip
}

_complete_conda_envs() {
    conda_root_dir
    compadd $(ls $ANACONDA/envs)
}

rmvirtualenv() {
    conda_root_dir
    rm -rf $ANACONDA/envs/$1
}
compdef _complete_conda_envs rmvirtualenv

cdvirtualenv() {
    conda_root_dir
    cd $ANACONDA/envs/$1
}
compdef _complete_conda_envs cdvirtualenv

workon() {
    conda_root_dir
    if [[ $1 == "cc" ]]; then
        export PYTHONPATH=$HOME/code/conda-cluster:$PYTHONPATH
    fi
    source $ANACONDA/bin/activate $1
}
compdef _complete_conda_envs workon

workoff() {
    conda_root_dir
    source $ANACONDA/bin/deactivate
}
