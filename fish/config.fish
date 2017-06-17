
# remove greeting message
set fish_greeting ""

# get along with emacs
function fish_title
  true
end

function cd
  builtin cd $argv
  ls -a
end

function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
    cd $recent
    commandline -r ''
    commandline -f repaint
  end
end

function peco
  command peco --layout=bottom-up $argv
end

function fish_user_key_bindings
  bind \cx\cf peco_z # Ctrl-[にバインドする
  bind \cr 'peco_select_history (commandline -b)'
end