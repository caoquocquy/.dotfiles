export ZSH=~/.oh-my-zsh ZSH_THEME="avit"

# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff"

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
alias onboard="cd ~/code/integrate"

# tmp for coach project
alias coach="cd ~/code/coach_dev_env"
alias stats="cd ~/code/coach_dev_env/services/coach_stats"
alias api="cd ~/code/coach_dev_env/services/coach"
alias spa="cd ~/code/coach_dev_env/services/coach-spa"
alias p40="cd ~/code/pulse40_configuration"
alias golem="cd ~/code/tiny_golem; bundle exec tiny_golem"
alias scheduler="cd ~/code/ws/survey_scheduler"
alias notifier="cd ~/code/ws/survey_notifier"
alias generator="cd ~/code/ws/survey_generator"
alias benchmarker="cd ~/code/ws/survey_benchmarker"
alias calendar="cd ~/code/tp_calendar"
alias query="cd ~/code/tp_query"
alias snippets="cd ~/code/snippets"
alias dotfiles="cd ~/.dotfiles"

alias up="docker-compose up -d"
alias down="docker-compose down"
alias ps="docker-compose ps"

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
export CXXFLAGS="-mmacosx-version-min=10.9"
export LDFLAGS="-mmacosx-version-min=10.9" 

export FZF_DEFAULT_OPTS='
  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#719e07
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
  --reverse
  --cycle
  --no-bold
  --no-mouse
  --bind ctrl-p:preview-up
  --bind ctrl-n:preview-down
  --bind ?:toggle-preview
'
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export FZF_DEFAULT_COMMAND='ag --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules" --glob "!node_modules" --glob "!tmp/*" --glob "!**/*.min.js" --glob "!**/*.min.css"'
unsetopt nomatch
