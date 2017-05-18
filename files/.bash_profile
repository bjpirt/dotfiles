function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       BLACK="\[\033[0;00m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE\u@\h$LIGHT_GREEN:\w $GREEN\$(parse_git_branch)\
 $LIGHT_GREEN\$$BLACK "
PS2='> '
PS4='+ '
}
proml

alias freq="cat ~/.bash_history | cut -d' ' -f1,2  | sort | uniq -c | sort -rn | head"

alias gst='git status'
alias gpr='git pull --rebase'
alias gsh='git show'
alias gl='git log'
alias gf='git fetch origin'
alias gg='git grep'
alias gba='git branch -al'
alias gbl='git branch -l'
alias gco='git checkout'
alias gcb='git checkout --track -b'
alias gca='git commit -a'
alias gpo='git push origin'
alias gpu='git push upstream'
alias gpb='git push bjpirt'
alias gfu='git fetch upstream'
alias gr='git rebase upstream/develop develop'
alias gd='git diff'
alias gx='git fetch upstream && git rebase upstream/master master && git push bjpirt master'

alias ll='ls -al'
alias n='nano'
alias v='vim'
alias ss='script/spec'
alias rta='rake test:all'
alias rdr='rake db:rebuild'
alias b='bundle exec'
alias r='rake'
alias br='bundle exec rake'
alias bi='bundle install'
alias gps='ps aux | grep'

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export RBENV_ROOT=/etc/rbenv

export PATH=$PATH:~/.bin
