# remove greeting message
set fish_greeting ""

# get along with emacs
function fish_title
  true
end

# hit ls whenever cd command hitted
function cd
  builtin cd $argv
  ls -a
end

# make peco bottom up
function peco
  command peco --layout=bottom-up $argv
end

# key bindings
function fish_user_key_bindings
  bind \cx\cf peco_z
  bind \cr 'peco_select_history (commandline -b)'
end
