#!/usr/bin/env bash

# This describes the process I used to embed the font in the
# CSS format that blinksh accepts

cssname=$1
fontname=$2
ttf_file=$3

echo "Results written to: $cssname"
echo "The font will be called: $fontname"
echo "The font will embed: $ttf_file"


echo "@font-face {" > $cssname
echo "font-family: \"${fontname}\";" >> $cssname
echo "font-style: normal;" >> $cssname  # I haven't checked if this values matter
echo "font-weight: 200;" >> $cssname    # I haven't checked if this values matter
echo -n "src: url(data:font/woff;charset=utf-8;base64," >> $cssname


base64 -w 0 $ttf_file >> $cssname
echo ");" >> $cssname
echo "}" >> $cssname
