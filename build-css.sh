#!/usr/bin/env bash


# This describes the process I used to embed the font in the
# CSS format that blinksh accepts

cssname=$1
fontname=$2
ttf_file=$3
width=$(./getfontwidth.sh $ttf_file)

echo "FONT WIDTH: $width"

echo "Results written to: $cssname"
echo "The font will be called: $fontname"
echo "The font will embed: $ttf_file"


echo "@font-face {" > $cssname
echo "font-family: \"${fontname}\";" >> $cssname
echo "font-style: normal;" >> $cssname  # I assume font-style is just a name...
echo "font-weight: $width;" >> $cssname    # Font width is important
echo -n "src: url(data:font/woff;charset=utf-8;base64," >> $cssname


base64 -w 0 $ttf_file >> $cssname
echo ");" >> $cssname
echo "}" >> $cssname
