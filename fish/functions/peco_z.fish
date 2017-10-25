function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --layout=top-down --query "$query"
  else
    set peco_flags --layout=top-down
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
    cd $recent
    commandline -r ''
    commandline -f repaint
  end
end
