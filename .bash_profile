# Set CLICOLOR if you want ANsi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export VISUAL=vim
export EDITOR="$VISUAL"

# git alias
alias gs='git status'
alias gp='git push -u'
alias gf='git fetch -p'
alias gc='git checkout'
alias gb='git branch'

# set vim keybinging for bash
set -o vi

function git_dirty {
  [[ -n "$(git status -s 2> /dev/null)" ]] && echo "*"
}

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)$(git_dirty)/"
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
