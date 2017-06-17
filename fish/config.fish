
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

# incremental serach visited directory
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

# make peco bottom up
function peco
  command peco --layout=bottom-up $argv
end

# key bindings
function fish_user_key_bindings
  bind \cx\cf peco_z
  bind \cr 'peco_select_history (commandline -b)'
end
