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
$ brew install stow Rg bat tig zsh-autosuggestions tmux vim universal-ctags
```

## Link `.dotfiles`

```
$ git clone https://github.com/caoquocquy/.dotfiles.git ~/
```

```
$ cd ~/.dotfiles
$ stow conf
```

## Install `vim` Plugins Via `Plug.vim`

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
$ vim ~/.vimrc
:PlugInstall
```

```
# If denite.vim cannot work on vim8
pip3 install --user pynvim
```

## Install `tmux` Plugins Via `tpm`

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ source ~/.tmux.conf
$ brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro
```
### Come to iTerms and change to font `Source Code Pro`

## Create new `tmux` session

```
tmux new
```

`prefix` + `I` to install tmux plugin
