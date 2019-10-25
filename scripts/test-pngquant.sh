#! /usr/bin/sh

INPUT='/root/data/pngquant-input.png'
OUTPUT='/root/data/pngquant-output.png'

rm -rf /root/data/*

if [ ! -f "$FILE" ]; then
    echo "Download image file"
    wget https://user-images.githubusercontent.com/1334195/66661466-5b4b3780-ec47-11e9-9073-7666fe5e1ccb.png -O $INPUT
fi

echo "Debug: pngquant -h"
pngquant -h

pngquant --output $OUTPUT --speed 1 --force -v -- $INPUT