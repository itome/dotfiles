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

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
else
    echo "Your platform ($(uname -a)) is not supported."
fi

eval "$(pyenv init -)"
eval "$(rbenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/s04407/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/s04407/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/s04407/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/s04407/google-cloud-sdk/completion.zsh.inc'; fi
