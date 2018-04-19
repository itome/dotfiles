set -x PATH $PATH $HOME/.nodebrew/current/bin
set -x PATH $PATH $HOME/flutter/bin
set -x PATH $PATH $HOME/.pyenv/bin
set -x PATH $PATH $HOME/Library/Android/sdk/tools
set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8.0)
set -x PATH $PATH $HOME/.pyenv/bin
source (pyenv init - | psub)

# remove greeting message
set fish_greeting ""

# key bindings
function fish_user_key_bindings
  bind \cx\cf peco_z
end

alias peco="peco --layout=bottom-up"
alias emulator="~/Library/Android/sdk/emulator/emulator"
alias grep="grep --color"
alias weather="wget http://wttr.in -O -"
alias gs "git status"
alias gd "git diff"
