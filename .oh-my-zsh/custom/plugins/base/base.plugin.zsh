# Color scheme
BASE16_SHELL="$HOME/workspace/dotfiles/iterm2/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH=/usr/local/sbin:$PATH
export PATH=$(brew --prefix coreutils)/libexec/bin:$PATH
export PATH=$(brew --prefix moreutils)/libexec/bin:$PATH

bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

alias k=clear
alias cdw='cd ~/workspace'
alias l='ls -lAhG'
alias ls='ls -lAhG'
alias grep='grep -i --color=always'
alias fuck='eval $(thefuck $(fc -ln -1))'

# Typos
alias it='git'
alias gi='git'
alias tit='git'
alias sl='ls'

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
