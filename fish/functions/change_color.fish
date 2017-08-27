# change android project image resource color recursively
# usage: change_color <file_name> <color>

function change_color
  if test (count $argv) = 2
    set file_name $argv[1]
    set color $argv[2]
    find . -name $file_name | xargs -ICON convert CON -fuzz 90% -channel RGBA -fill $color -opaque \#212121 CON

  else
    echo 'usage: change_color <file_name> <color>'
  end
end
