#!/usr/bin/env -S fontforge -quiet
#
# This script returns the font width based on the character 'a'

Open($1)
Select("a")
charWidth = GlyphInfo("Width");
Print(charWidth);
SelectAll();
a = Array(100);  # This could overflow
i = 0;
j = 2;
a[0] = 0;
a[1] = charWidth;
flag = 0;
foreach
	while (i < j)
		if (GlyphInfo("Width") == a[i]);
			flag = 1;
		endif
		i++;
	endloop
	if (flag == 0)
		a[j] = GlyphInfo("Width");
		Print(a[j]);
		j++;
	endif
	i = 0;
	flag = 0;
endloop
