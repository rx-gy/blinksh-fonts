#!/usr/bin/env -S fontforge -quiet
#
# This script returns the font width based on the character 'a'

Open($1)
Select("a")
charWidth = GlyphInfo("Width");
Print(charWidth);
