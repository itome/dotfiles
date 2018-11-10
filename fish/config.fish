clear

# remove greeting message
set fish_greeting

# key bindings
function fish_user_key_bindings
  bind \cx\cf peco_z
end

function pbhighlight
    pbpaste | highlight -k 'Source Code Pro' -s "Moria" -O rtf -S $argv | pbcopy
end

alias peco="peco --layout=bottom-up"
alias emulator="~/Library/Android/sdk/emulator/emulator"
alias grep="grep --color"
alias weather="wget http://wttr.in -O -"
alias gs "tig status"
alias gl "tig log"
