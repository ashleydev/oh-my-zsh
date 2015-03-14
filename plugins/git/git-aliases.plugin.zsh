# Aliases

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

#alias g='git'                                 ; compdef g=git
alias ga='git add'                            ; compdef _git ga=git-add
alias gaa='git add --all'                     ; compdef _git gaa=git-add

alias gc='git commit -v'                      ; compdef _git gc=git-commit
alias gca='git commit -v -a'                  ; compdef _git gca=git-commit

alias gs='git status -sb'                     ; compdef _git gs=git-status
alias gst='git status'                        ; compdef _git gst=git-status
# gsts is for `gsts "<message>"`
alias gsts='git stash save'                   ; compdef _git gsts=git-stash
alias gstp='git stash pop'                    ; compdef _git gstp=git-stash
alias gstl='git stash list'                   ; compdef _git gstl=git-stash
alias gstll='git stash show -p --stat'        ; compdef _git gstll=git-stash

alias gl='git pull'                           ; compdef _git gl=git-pull
alias gp='git push'                           ; compdef _git gp=git-push
alias glb='git pull origin $(current_branch)' ; compdef _git glb=git
alias gpb='git push origin $(current_branch)' ; compdef _git gpb=git
alias glpb='git pull origin $(current_branch) && git push origin $(current_branch)'; compdef _git glpb=git
alias gf='git fetch'                          ; compdef _git gf=git-fetch
alias gup='git fetch && git rebase'           ; compdef _git gup=git-fetch

alias gcp='git cherry-pick'                   ; compdef _git gcp=git-cherry-pick
alias gm='git merge'                          ; compdef _git gm=git-merge

# gd: diff changes not in the index
alias gd='git diff --no-ext-diff -b'          ; compdef _git gd=git-diff
# gD: diff changes 'add'ed to the index
alias gD='git diff --no-ext-diff -b --cached' ; compdef _git gD=git-diff
alias gdw='git diff --no-ext-diff'            ; compdef _git gdw=git-diff
alias gDw='git diff --no-ext-diff --cached'   ; compdef _git gDw=git-diff
gdv() { git diff -w "$@" | view - }           ; compdef _git gdv=git-diff
gDv() { git diff --cache -w "$@" | view - }   ; compdef _git gDv=git-diff

alias gco='git checkout'                      ; compdef _git gco=git-checkout
alias gb='git branch'                         ; compdef _git gb=git-branch
alias gba='git branch -a'                     ; compdef _git gba=git-branch
#
# Statistics:
#
# Git Branch Last commit date:
alias gbl='git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)"'
# number of commits per user
alias gcount='git shortlog -sn'               ; compdef gcount=git
# commits by user:
alias gls='git shortlog'                      ; compdef _git gls=shortlog

# Git history (pretty)
local pretty_format_oneline='--pretty=format:"%C(yellow)%h %C(green)%cd %C(cyan)%an %C(bold cyan)%d%C(reset) %s" --date=short'
local pretty_format_medium='--pretty=format:"%C(yellow)commit %H %C(bold cyan)%d%C(reset)
%C(cyan)Author: %an <%ae>%C(reset)
%C(green)Date: %cd%C(reset)
%+s
%+b"'
alias gh="git log --graph $pretty_format_oneline"                               ; compdef _git gh=git-log
alias ghh="git log --graph $pretty_format_medium"                               ; compdef _git ghh=git-log
alias ghhh="git log --graph --stat $pretty_format_medium"                       ; compdef _git ghhh=git-log
alias ghhhh="git log --graph --stat -p --full-diff $pretty_format_medium"       ; compdef _git ghhhh=git-log
alias gha="git log --all --graph $pretty_format_oneline"                        ; compdef _git gha=git-log
alias ghha="git log --all --graph $pretty_format_medium"                        ; compdef _git ghha=git-log
alias ghhha="git log --all --graph --stat $pretty_format_medium"                ; compdef _git ghhha=git-log
alias ghhhha="git log --all --graph --stat -p --full-diff $pretty_format_medium"; compdef _git ghhhha=git-log

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef _git git-svn-dcommit-push=git
