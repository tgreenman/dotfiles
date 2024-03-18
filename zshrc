export ANT_OPTS=-Xmx2048m

export PATH=~/bin:$PATH

export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

### MISC COMMANDS ###

alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="la -al"

# tail, but in vim. use ctrl+c to pause
alias trail="less +F -n"

alias decode="echo $1 | base64 -D | gunzip"

alias flushDns="sudo killall -HUP mDNSResponder"

alias lsusb="system_profiler SPUSBDataType"

alias xml_pp="xmllint --format -"

alias mscrcpy="scrcpy -b 2M -m 1080"

alias gitrecent="git for-each-ref --sort=committerdate refs/remotes/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

alias vpnStatus="/opt/cisco/anyconnect/bin/vpn status"

alias vpnDisconnect="/opt/cisco/anyconnect/bin/vpn disconnect"

alias tvnc="/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home/bin/java -jar ~/tightvnc-jviewer.jar"

alias ndcv="~/bin/dcv-cdd.py connect $DEV"

alias overlay="adb shell am broadcast -a com.amazon.action.toggle.metric.overlay"

alias fos_overlay="adb shell am start com.amazon.ssm/com.amazon.ssm.ControlPanel"

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

git-lfs-nuke() {
    git rm --cached -r .
    git reset --hard
    git rm .gitattributes
    git reset .
    git checkout .
}

### DEV ENVIRONMENT ###

# Android
export PATH="/Users/$USER/Library/Android/sdk/tools/bin:$PATH"
export PATH="/Users/$USER/Library/Android/sdk/platform-tools:$PATH"
export PATH="/Users/$USER/Library/Android/sdk/ndk-bundle:$PATH"
export ANDROID_HOME="/Users/$USER/Library/Android/sdk/"
export ANDROID_NDK_HOME="/Users/$USER/Library/Android/sdk/ndk-bundle/"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)

java8() {
    export PATH=$JAVA_8_HOME/bin:$PATH
    export JAVA_HOME=$JAVA_8_HOME
}

java11() {
    export PATH=$JAVA_11_HOME/bin:$PATH
    export JAVA_HOME=$JAVA_11_HOME
}

java17() {
    export PATH=$JAVA_17_HOME/bin:$PATH
    export JAVA_HOME=$JAVA_17_HOME
}

# brazil
alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias brazil-reconnect="brazil-package-cache enable_edge_cache; brazil-package-cache start"
alias envupdate="brazil ws env update --activate"

### TOOLING SETUP ###

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/Users/greenman/.pyenv/bin:$PATH"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export PATH="/usr/local/Cellar/ninja/1.10.2/bin:$PATH"

eval "$(rbenv init - -bash)"




