export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/flutter/bin/cache/dart-sdk/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/dotfiles/commands
export PATH=$HOME/.cargo/bin:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=$PYENV_ROOT/shims:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:~/.roswell/bin
export NVM_DIR="$HOME/.nvm"

if [ "$(uname)" == 'Darwin' ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

eval "$(pyenv init -)"
eval "$(rbenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"
