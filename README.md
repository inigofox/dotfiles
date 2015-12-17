# dotfiles

## Basic

### 1. Homebrew

[Homebrew](http://brew.sh/): `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### 2. Clone repo

Create [ssh key](https://help.github.com/articles/generating-ssh-keys):

```
ssh-keygen -t rsa -C "your_email@example.com"
ssh-add ~/.ssh/id_rsa
```

Copy and paste the public key into [github account](https://github.com/settings/ssh)
```
pbcopy < ~/.ssh/id_rsa.pub
```

Now can clone the repo: `git clone git@github.com:danielfrg/dotfiles.git`

### 3. Brew packages

Install: `brew bundle`

## Others

### Ohmyzsh

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sF $(pwd)/.oh-my-zsh/custom/plugins ~/.oh-my-zsh/custom
```

### Git

```
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.gitignore_global ~/.gitignore_global
```

### Atom

```
bash .atom/plugins.sh

ln -sf $(pwd)/.atom/projects.cson ~/.atom/projects.cson
ln -sf $(pwd)/.atom/config.cson ~/.atom/config.cson
ln -sf $(pwd)/.atom/init.coffee ~/.atom/init.coffee
ln -sf $(pwd)/.atom/keymap.cson ~/.atom/keymap.cson

# My packages:
git clone git@github.com:danielfrg/atom-nbviewer.git ~/workspace/atom-nbviewer
ln -sF ~/workspace/atom-nbviewer ~/.atom/packages/nbviewer

git clone git@github.com:danielfrg/atom-lighttable-syntax.git ~/workspace/atom-lighttable-syntax
ln -sF ~/workspace/atom-lighttable-syntax ~/.atom/packages/lighttable-syntax
```

### VI

```
ln -sF $(pwd)/.vim ~/.vim
ln -sf $(pwd)/.vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
