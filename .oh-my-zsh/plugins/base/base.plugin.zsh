bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

alias k=clear

c() {
    cd $HOME/code/$1
}
_c() {
    conda_root_dir
    compadd $(ls ~/code/)
}
compdef _c c

alias ccc="conda-cluster"
source /usr/local/opt/autoenv/activate.sh
