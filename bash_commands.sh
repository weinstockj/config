alias lss="ls -alh"

# misc functions
git_log() {
    git log --graph --abbrev-commit --decorate --date=relative --all
}

watch_tail() {
    watch tail -n30 $1
}

run_bash_script() {
    basename=$(basename $1 ".sh")
    stdout=${basename}.stdout.log
    stderr=${basename}.stderr.log
    echo "now executing"
    echo "$1 2>${stderr} 1>${stdout} &"
    bash $1 2>${stderr} 1>${stdout} &
}

function kill_cromwell() {
    ps -ef | grep cromwell | grep -v grep | awk '{print $2}' | xargs kill -9
}
