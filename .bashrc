# [Hub官方release](https://github.com/mislav/hub/releases)
# npm i -g @antfu/ni 
# npm i -g @antfu/nr
# npm i live-server -g
# ~./bashrc
# 详细目录请使用 Antfu/tools/antfu-eslint-cmd

# ssh key-agent

eval $(ssh-agent)
    ssh-add ~/.ssh/id_rsa
    ssh-add ~/.ssh/gitee
    ssh-add ~/.ssh/github

# this is windows bashrc

alias nio="ni --prefer-offline"
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias bw="nr build --watch"
alias t="nr test"
alias tu="nr test -u"
alias tw="nr test --watch"
alias w="nr watch"
alias p="nr play"
alias c="nr typecheck"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias release="nr release"
alias re="nr release"

# -------------------------------- #
# Git
# -------------------------------- #

# Use github/hub
alias git=hub

# Go to project root
alias grt='cd "$(git rev-parse --show-toplevel)"'

alias gs='git status'
alias gp='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'

alias main='git checkout main'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gb='git branch'
alias gbd='git branch -d'

alias grb='git rebase'
alias grbom='git rebase origin/master'
alias grbc='git rebase --continue'

alias gl='git log'
alias glo='git log --oneline --graph'

alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/master'

alias gxn='git clean -dn'
alias gx='git clean -df'

alias gsha='git rev-parse HEAD | pbcopy'

alias ghci='gh run list -L 1'

rd(){
  source ~/.bashrc
}

glp() {
  git --no-pager log -$1
}

gd() {
  if [[ -z $1 ]]; then
    git diff --color | diff-so-fancy
  else
    git diff --color $1 | diff-so-fancy
  fi
}

gdc() {
  if [[ -z $1 ]]; then
    git diff --color --cached | diff-so-fancy
  else
    git diff --color --cached $1 | diff-so-fancy
  fi
}

# -------------------------------- #
# Directories
#
# I put
# `~/i` for my projects
# `~/f` for forks
# `~/r` for reproductions
# -------------------------------- #

i02shelp(){
  echo "### -- i02s <3 help -- ###"
  echo "Shortcuts:                                  Sample:"
  echo "i      -- go to i dir (customizable)              : i" 
  echo "dir    -- create a new directory and cd into it   : dir my-dir"
  echo "clonei -- clone to i dir and cd into it           : clonei yourepo [my-dir]"
  echo "repros -- go to repros dir                        : repros my-repo [user/repo]"
  echo "forks  -- go to forks dir                         : forks my-repo     "
  echo "pr     -- checkout a pr                           : pr #123"
  echo "codei  -- go to i dir makes a file and code .     : codei a.md"
  echo "serve  -- serve dist folder                       : serve index.js"
  echo "------"
  echo "Project Aliases:"
  echo ""
  echo " nio    : ni --prefer-offline"
  echo " s      : nr start"
  echo " d      : nr dev"
  echo " b      : nr build"
  echo " bw     : nr build --watch"
  echo " t      : nr test"
  echo " tu     : nr test -u"
  echo " tw     : nr test --watch"
  echo " w      : nr watch"
  echo " p      : nr play"
  echo " c      : nr typecheck"
  echo " lint   : nr lint"
  echo " lintf  : nr lint --fix"
  echo " release: nr release"
  echo " re     : nr release"

  echo "Git Aliases:"
  echo ' gs  : git status '
  echo ' gp  : git push '
  echo ' gpf : git push --force '
  echo ' gpft: git push --follow-tags '
  echo ' gpl : git pull --rebase '
  echo ' gcl : git clone '
  echo ' gst : git stash '
  echo ' grm : git rm '
  echo ' gmv : git mv '
  echo ' main: git checkout main '
  echo ' gco : git checkout '
  echo ' gcob: git checkout -b '
  echo ' gb  : git branch '
  echo ' gbd : git branch -d '
  echo ' grb : git rebase '
  echo ' grbom: git rebase origin/master '
  echo ' grbc: git rebase --continue '
  echo ' gl  : git log '
  echo ' glo : git log --oneline --graph '
  echo ' grh : git reset HEAD '
  echo ' grh1: git reset HEAD~1 '
  echo ' ga  : git add '
  echo ' gA  : git add -A '
  echo ' gc  : git commit '
  echo ' gcm : git commit -m '
  echo ' gca : git commit -a '
  echo ' gcam: git add -A && git commit -m '
  echo ' gfrb: git fetch origin && git rebase origin/master '
  echo ' gxn : git clean -dn '
  echo ' gx  : git clean -df '
  echo ' gsha: git rev-parse HEAD | pbcopy '
  echo ' ghci: gh run list -L 1 '

}

i() {
  cd /d/i/$1
}

repros() {
  cd ~/r/$1
}

forks() {
  cd ~/f/$1
}

pr() {
  if [ $1 = "ls" ]; then
    gh pr list
  else
    gh pr checkout $1
  fi
}

dir() {
  mkdir $1 && cd $1
}

clone() {
  if [[ -z $2 ]]; then
    hub clone "$@" && cd "$(basename "$1" .git)"
  else
    hub clone "$@" && cd "$2"
  fi
}

# Clone to ~/i and cd to it
clonei() {
  i && clone "$@" && code . && cd ~2
}

cloner() {
  repros && clone "$@" && code . && cd ~2
}

clonef () {
  forks && clone "$@" && code . && cd ~2
}

codei() {
  i && code "$@" && cd -
}

serve() {
  if [[ -z $1 ]]; then
    live-server dist
  else
    live-server $1
  fi
}


#if [ -t 1 ]; then
#  exec zsh
#fi
