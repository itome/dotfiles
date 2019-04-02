export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/dotfiles/commands
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$HOME/.cargo/bin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"
eval $(pyenv init -)
eval $(pyenv virtualenv-init -)
eval $(rbenv init -)


export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export PATH=$PATH:~/.pub-cache/bin

export PATH=$PATH:~/.roswell/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/s04407/google-cloud-sdk/path.bash.inc' ]; then . '/Users/s04407/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/s04407/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/s04407/google-cloud-sdk/completion.bash.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
