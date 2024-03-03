#!/usr/bin/env fontforge
#
# This is my attempt to ensure all glyphs (even empty) have
# a width set. The hope is that blinksh will display blanks
# with the right width then instead of picking a glyph from
# a font with a different width and screwing up the line
# lengths.

Open($1)
Select("a")
charWidth = GlyphInfo("Width");
Print("WIDTH A:" + charWidth);
Select("B")
charWidthb = GlyphInfo("Width");
Print("WIDTH B:" + charWidth);

foreach
	if (GlyphInfo("Width") == 0)
		SetWidth(charWidth);
	endif
endloop;
Save($1:r + '-mod.ttf');
