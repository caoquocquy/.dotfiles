export ZSH=~/.oh-my-zsh
ZSH_THEME="avit"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# dotfiles
alias edot="cd ~/.dotfiles"
alias ezsh="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias etmx="vim ~/.tmux.conf"

# git alias
alias nlog="git log --oneline --graph"

alias tp="cd ~/code/tinypulse"

# tmp for coach project
alias coach="cd ~/code/coach_dev_env/services/coach; tmux new -n coach"
alias env="cd ~/code/coach_dev_env"
alias up="cd ~/code/coach_dev_env; docker-compose up"
alias upd="cd ~/code/coach_dev_env; docker-compose up -d"
alias down="cd ~/code/coach_dev_env; docker-compose down"
alias sh="cd ~/code/coach_dev_env; docker-compose exec coach /bin/sh"
alias api="cd ~/code/coach_dev_env/services/coach"
alias apidebug="cd ~/code/coach_dev_env; docker-compose run --service-ports coach"
alias spa="cd ~/code/coach_dev_env/services/coach-spa"

# msql@5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# heroku-cli autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# other
export EDITOR='vim'
export DISABLE_AUTO_TITLE=true
