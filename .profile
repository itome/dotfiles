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
export PATH=$HOME/opt/local:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$GOPATH/src/bin:$PATH
export PATH=$PATH:~/.roswell/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:~/.emacs.d/bin
export PATH="/Users/itome/.local/share/solana/install/active_release/bin:$PATH"
export WASMTIME_HOME="$HOME/.wasmtime"
export GO111MODULE=on
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/itome/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/itome/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/itome/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/itome/google-cloud-sdk/completion.zsh.inc'; fi

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
