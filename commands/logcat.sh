#!/bin/sh

while true; do
    adb logcat -v time | logcat_color.awk
    echo "#### DEVICE DISCONNECTED !"
done
