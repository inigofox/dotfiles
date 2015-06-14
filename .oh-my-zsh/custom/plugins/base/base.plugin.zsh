export PATH=$(brew --prefix coreutils)/libexec/bin:$PATH
export PATH=$(brew --prefix moreutils)/libexec/bin:$PATH

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

alias k=clear
alias fuck='eval $(thefuck $(fc -ln -1))'

c() {
    cd $HOME/code/$1
}
_c() {
    conda_root_dir
    compadd $(ls ~/code/)
}
compdef _c c

source /usr/local/opt/autoenv/activate.sh
