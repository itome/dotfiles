# rename files recursively
# usage: _rename <file_name> <color>

function change_color
  find . -name $argv[1] | xargs -ICON convert CON -fuzz 90% -channel RGBA -fill $argv[2] -opaque \#212121 CON
end
