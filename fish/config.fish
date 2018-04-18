# remove greeting message
set fish_greeting ""

# key bindings
function fish_user_key_bindings
  bind \cx\cf peco_z
end

alias peco="peco --layout=bottom-up"
alias grep="grep --color"
alias weather="wget http://wttr.in -O -"
alias gs "git status"
alias gd "git diff"
