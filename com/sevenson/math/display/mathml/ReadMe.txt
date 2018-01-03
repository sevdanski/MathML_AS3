
MathML - sevenson.com.au

These classes are set up to generate a sprite based on some MathML.
Hopefully they are easy enough to use.

The main class is the static class MathML. The remaining classes are
support classes for generating the various elements.


Usage:

var $sprite:Sprite = MathML.parse(MathML:XML[, $format:TextFormat=null, $embedFonts:Boolean=null ]);



That's it.

Some optional settings to make life a bit easier are:


.defaultTextFormat 			- 	set/get the default TextFormat to use when parsing (used if no textFormat
								is passed in as a param)
.resetDefaultTextFormat()	-	resets the default TextFormat back to it's original state

.defaultEmbedFonts			-	set/get if embeded fonts should be used

		