export PATH=$HOME/anaconda/bin:$PATH
alias ccc=conda-cluster

conda_root_dir() {
    conda_root=$(conda info | grep root | awk 'BEGIN { FS = " " } ; { print $4 }' | sed 's/^[ \t]*//;s/[ \t]*$//')
}

lsvirtualenvs() {
    conda_root_dir
    ls $conda_root/envs
}
mkvirtualenv() {
    conda_root_dir
    $conda_root/bin/conda create -n $1 pip
}
_complete_conda_envs() {
    conda_root_dir
    compadd $(ls $conda_root/envs)
}
rmvirtualenv() {
    conda_root_dir
    rm -rf $conda_root/envs/$1
}
compdef _complete_conda_envs rmvirtualenv

cdvirtualenv() {
    conda_root_dir
    cd $conda_root/envs/$1
}
compdef _complete_conda_envs cdvirtualenv

workon() {
    conda_root_dir
    if [[ $1 == "cc" ]]; then
        export PYTHONPATH=$HOME/code/conda-cluster:$PYTHONPATH
    fi
    source $conda_root/bin/activate $1
}
compdef _complete_conda_envs workon

# workoff() {
#     conda_root_dir
#     source $conda_root/bin/deactivate
# }
