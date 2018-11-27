export ANT_OPTS=-Xmx2048m

alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="la -al"

# tail, but in vim. use ctrl+c to pause
alias trail="less +F -n"

# Android
export PATH="/Users/greenman/android-sdk-macosx/ndk-bundle:$PATH"

# .bash_history
HISTSIZE=10000
HISTFILESIZE=20000

# home bin
export PATH=~/bin:$PATH

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$JAVA_HOME/bin:$PATH"

alias lsusb="system_profiler SPUSBDataType"
alias xml_pp="xmllint --format -"
alias mscrcpy="scrcpy -b 2M -m 1080"
alias gitrecent="git for-each-ref --sort=committerdate refs/remotes/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

plogcat() {
    if [[ -z $2 ]]; then
        adb logcat | grep -F "`adb shell ps | grep $1 | awk {'print $2'}`"
    else
        echo "usage: plogcat packagename"
    fi
}

commitdiff() {
    if [[ -z $3 ]]; then
        git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..$2
    else
        git log --date=relative $1..$2
    fi
}

pull-package() {
    PACKAGE=$1
    adb pull $(adb shell pm path ${PACKAGE} | cut -c 9- )
}

