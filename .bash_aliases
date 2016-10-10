find-and-grep() {
    find . -name $1 -exec grep $2 {} +
}

find-and-remove() {
    for i in $( find . -name $1 ); do
        echo Removing $i
        rm $i
    done
}

find-in-source() {
    find . -regextype posix-extended -regex '.*\.(scala|java)' \
      -exec grep -n $1 {} +
}

find-and-exec() {
    FILENAME=$1
    shift
    find . -name $FILENAME -exec $@
}

find-and-git-log-patch() {
    ARRAY=( $@ )
    LEN=${#ARRAY[@]}
    FILENAME=${ARRAY[$LEN-1]}
    ARGS=${ARRAY[@]:0:$LEN-1}

    find . -name $FILENAME -exec git log -p $ARGS -- {} +
}

git-checkout-file-from-branch() {
    for i in $( git ls-tree --name-only -r $1 | grep $2 ); do
        echo Checking out $i
        git checkout $1 -- $i
    done
}

git-branch-and-checkout() {
    git branch $1 && git checkout $1
}

git-jump() {
    if [[ -n $(git status -s -uno) ]]
    then
        export STASHED=true
        git stash save "Jumping $(date -Is)"
    else
        export STASHED=false
    fi
    export RETURN_BRANCH=$(git symbolic-ref --short HEAD)
    git checkout $1
}

git-jump-back() {
    git checkout $RETURN_BRANCH
    if [ "$STASHED" = true ]
    then
        git stash apply
    fi
}

alias no='vim ~/things'
alias dev='dev.sh & disown & exit'
alias fis=find-in-source
alias fig=find-and-grep
alias fr=find-and-remove
alias fe=find-and-exec
alias fgl=find-and-git-log-patch
alias vi=vim
alias h='history | tail -n 30'
alias gcc='gcc -Wall -pedantic'
alias ffb=git-checkout-file-from-branch
alias nt='xterm & disown'

alias g=git
alias gs='git status'
alias gl='git log --name-status --decorate'
alias ga='git add'
alias gaa='git add -A'
alias gap='git add -p'
alias gc='git commit'
alias gac='git add -A && git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gbc=git-branch-and-checkout
alias gj=git-jump
alias gjb=git-jump-back

