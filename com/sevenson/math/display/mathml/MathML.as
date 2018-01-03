/**
 * com.sevenson.math.display.mathml.MathML
 * 
 * This class is the main class for parsing MathML.
 * Pass the required MathML to the static method .parse() and it will return a sprite representations.
 * The parsing and create is done via recursion through the various nodes.
 * 
 * Note: 	Not all tags are supported yet - interegate the parseMathMLNode method for a list of supported tags.
 * 		 	The following address was used as a guide for creating these classes
 * 			http://www.dessci.com/en/support/mathtype/tutorials/mathml/presentation.htm
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.math.display.mathml
{
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.display.Sprite;
	
	/**
	 * The MathML class provides a set of static properties and methods
	 */
	public class MathML
	{
		
		//
		static private var _format_default:TextFormat;		// this will hold the default txt (for attributes)
		static private var _embedFonts_default:Boolean;
		
		//
		static private var _format:TextFormat;				// holds the current format for this parse
		static private var _embedFonts:Boolean;
		
		
		/*
		 * Static constructor
		*/
		{
			resetDefaultTextFormat();
			_embedFonts_default = false;
		}
		
		/**
		 * [Static class] MathML cannot be directly instantiated
		 */
		public function MathML ()
		{
			throw new Error("MathML cannot be directly instantiated.");
		}
		
		
		
		
		// STATIC PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		/**
		 * 	
		 * @param	$xml			XML - the MathML to parse
		 * @param	$format			TextFormat - the text format to apply to the elements created - when null, defaults to the defaultTextFormat
		 * @param	$embedFonts		Object - should embeded fonts be used - should be boolean (null results in default embedFonts settings)
		 * @return	Sprite	
		 */
		static public function parse($xml:XML, $format:TextFormat=null, $embedFonts:Object=null):Sprite {
			// make sure there is a format, text field, etc
			_format = ($format == null) ? _format_default : $format;
			_embedFonts = ($embedFonts==null) ? _embedFonts_default : Boolean(_embedFonts);
			
			// take the given $xml and srap it in an MROW
			var $newmml:XML = new XML('<mrow/>');
			$newmml.appendChild($xml.children());
			var $mobj:Sprite = parseMathMLNode($newmml);
			//
			var $s:Sprite = new Sprite();
			$s.addChild($mobj);
			//
			_format = null;
			_embedFonts = _embedFonts_default;
			//
			return $s;
		}
		
		
		/**
		 * Resets the default text format to plain text
		 */
		static public function resetDefaultTextFormat():void {
			// set up a default text format
			_format_default = new TextFormat();
			_format_default.font = "Arial";
			_format_default.size = 16;
			_format_default.color = 0x000000;
		}		
		
		/**
		 * Set's the default text format to use when parsing.
		 */
		static public function get defaultTextFormat():TextFormat { return _format_default; }
		static public function set defaultTextFormat($format:TextFormat):void {
			_format_default = $format;
			
		}			
		
		
		/**
		 * Set's the default 'embedFonts' property
		 */
		static public function get defaultEmbedFonts():Boolean { return _embedFonts_default; }
		static public function set defaultEmbedFonts($value:Boolean):void {
			_embedFonts_default = $value;
			
		}	
		
		
		
		// STATIC PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// STATIC INTERNAL FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * This will look at the given xml node and generate the required sprite
		 * @param	node_xml
		 * @return
		 */
		static internal function parseMathMLNode($node_xml:XML):Sprite {
			//
			var $n:String = String($node_xml.name().localName).toLowerCase();
			switch ($n) {
				//-- Token Elements --//	
				case "mi":
					return new MI($node_xml);
					break;
				case "mn":
					return new MN($node_xml);
					break;
				case "mo":
					return new MO($node_xml);
					break;
				case "mtext":
					return new MText($node_xml);
					break;					
				case "mspace":
					return new MSpace($node_xml);
					break;
				
				//-- General Layout:  --//
				case "mrow":
					return new MRow($node_xml);
					break;
				
				case "mfrac":
					return new MFrac($node_xml);
					break;
					
				case "mroot":
					return new MRoot($node_xml);
					break;
					
				case "msqrt":
					return new MSqrt($node_xml);
					break;					
					
					
				//-- Scripts and Limits:  --//
				case "msub":
					return new MSub($node_xml);
					break;

				case "msup":
					return new MSup($node_xml);
					break;
					
				case "msubsup":
					return new MSubSup($node_xml);
					break;
					
				case "munderover":
					return new MUnderOver($node_xml);
					break;
					
				case "munder":
					return new MUnder($node_xml);
					break;
					
				case "mover":
					return new MOver($node_xml);
					break;
					
					
				case "mfenced":
					return new MFenced($node_xml);
					break;
					
				default:
					throw new Error('MathML - Unsupported node type: '+ $node_xml.name());
					break;
					
			}
		}		
		
		
		
		
		/**
		 * generates a text field to use inside a node (applyes the given format)
		 * @param	$format
		 * @return
		 */
		static internal function generateTextField():TextField {
			
			var $tf:TextField = new TextField();
			$tf.autoSize = TextFieldAutoSize.LEFT;
			$tf.multiline = false;
			$tf.wordWrap = false;
			$tf.selectable = false;

			
			$tf.defaultTextFormat = _format;
			$tf.setTextFormat(_format);
			
			$tf.embedFonts = _embedFonts;
						
			return $tf;
		}
		
		//
		static internal function parseString(str:String):String {
			return str;
		}		
		
		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		// used to calculate the size of super/subscript
		static internal function get subSupScale():Number { return 0.85; }
		
		// returns the current format being used to parse
		static internal function get currentTextFormat():TextFormat { return _format; }
		

	
		
	}
}