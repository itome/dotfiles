#!/bin/sh

DATE=`date '+%y%m%d%H%M%S'`
FILE_NAME=record-${DATE}
YOUR_PATH=~/Desktop

adb shell screenrecord /sdcard/${FILE_NAME}.mp4 --size=360x640 &
pid=`ps x | grep -v grep | grep "adb shell screenrecord" | awk '{ print $1 }'`

if [ -z "$pid" ]; then
  printf "Not running a screenrecord."
  exit 1
fi

printf "Recording, finish? [y]"
while read isFinished; do
  case "$isFinished" in
    "y" | "Y") break ;;
    *) printf "Incorrect value." ;;
  esac
done

kill -9 $pid # Finished the process of adb screenrecord
while :
do
  alive=`adb shell ps | grep screenrecord | grep -v grep | awk '{ print $9 }'`
  if [ -z "$alive" ]; then
      break
  fi
done

printf "Finished the recording process : $pid\nSending to $YOUR_PATH...\n"
adb pull /sdcard/${FILE_NAME}.mp4 $YOUR_PATH
adb shell rm /sdcard/${FILE_NAME}.mp4

echo "Converts to GIF? [y]"
read convertGif
case $convertGif in
    "y" | "Y") ffmpeg -i ${YOUR_PATH}/${FILE_NAME}.mp4 -an -r 15 -pix_fmt rgb24 -f gif ${YOUR_PATH}/${FILE_NAME}.gif ;; # creating gif 
    *) ;;
esac
