
function resize-display

  if test (count $argv) = 1

    set surface_resolution_width 2736
    set scale $argv[1]

    set connected (xrandr --current | grep 'connected' | grep -v 'disconnecte' | grep -v 'eDP1' | awk '{print $1}')
    set resolution_width (xrandr --current | grep 'connected' | grep -v 'disconnecte' | grep -v 'eDP1' | awk '{print $3}' | cut -d 'x' -f1)
    set resolution_height (xrandr --current | grep 'connected' | grep -v 'disconnecte' \
    | grep -v 'eDP1'| awk '{print $3}' | cut -d 'x' -f2 | cut -d '+' -f1)

    xrandr --output eDP1 --auto --output $connected --auto --panning \
    (math "$resolution_width*$scale")x(math "$resolution_height*$scale")+"$surface_resolution_width"+0 --scale "$scale"x"$scale" --right-of eDP1

    else
      echo "usage: resize-display <scale>"
  end
end
