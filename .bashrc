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

# NVM
export NODE_BINARY_PATH="$(which node)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

