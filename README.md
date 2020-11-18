## Install `iTerm2` at https://www.iterm2.com/

## Install `oh-my-zsh`

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install `brew`

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
$ brew install stow Rg tig zsh-autosuggestions tmux vim
```

## Link `.dotfiles`

```
$ git clone https://github.com/caoquocquy/.dotfiles.git ~/
```

```
$ cd ~/.dotfiles
$ stow conf
```

## Install `vim` Plugins Via `Vundle.vim`

```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

```
$ vim ~/.vimrc
:PluginInstall
```

```
# If denite.vim cannot work on vim8
pip3 install --user pynvim
```

## Install `tmux` Plugins Via `tpm`

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ source ~/.tmux.conf
$ brew tap caskroom/fonts && brew cask install font-source-code-pro
```
### Come to iTerms and change to font `Source Code Pro`

## Create new `tmux` session

```
tmux new
```

`prefix` + `I` to install tmux plugin
