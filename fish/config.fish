
# remove greeting message
set fish_greeting ""

# get along with emacs
function fish_title
  true
end

# incremental search with peco and z
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

function fish_user_key_bindings
  bind \x1b peco_z # bind to C-[
end
