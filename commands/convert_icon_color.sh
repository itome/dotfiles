#!/bin/bash

input="$1"
output="$2"
size="$3"
color="$4"

resized_image=`mktemp --suffix .png`
echo convert -geometry $size $input $resized_image
convert -trim -geometry $size $input $resized_image
if [ $? -ne 0 ];then
    exit 1
fi

alpha_image=`mktemp --suffix .png`
convert $resized_image -alpha extract $alpha_image
if [ $? -ne 0 ];then
    exit 2
fi

convert $alpha_image -background "${color}" -alpha shape ${output}
if [ $? -ne 0 ];then
    exit 3
fi

echo "COMPLETED:" ${input} to ${output}
exit 0
