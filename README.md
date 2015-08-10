# dotfiles + mac configuration

## 1. Homebrew

[Homebrew](http://brew.sh/): `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## 2. Clone repo

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

## 3. Brew apps

1. Install brew bundle: `brew tap Homebrew/brewdler`
2. Install brew packages: `brew brewdle`

## VI

1. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
2. `vim +PluginInstall +qall`
