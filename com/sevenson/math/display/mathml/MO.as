/**
 * com.sevenson.math.display.mathml.MO
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.math.display.mathml
{
	import flash.display.Sprite;
	import com.sevenson.math.display.mathml.*;
	import flash.text.TextField;
	
	/**
	 * The MO class
	 */
	public class MO extends MathMLBaseSprite
	{
		
		// vars
		private var _alignwidth:Number;
				
		/**
		 * Creates a new instance of the MO class
		 */
		public function MO ($node:XML)
		{
			//
			super($node);
			//
			buildContent($node.child('*'));
		}
		
		
		// STATIC PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// STATIC PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * This will build this item based on the $node passed in
		 * @param	$node
		 */
		private function buildContent($node:XMLList):void {
			//
			if(String(tf)==""){ return; }
			// create a text field to hold everything
			var tf:TextField = MathML.generateTextField();
			//
			tf.htmlText = $node.toString();
			
			var txt:String = tf.htmlText;
			
			switch (tf.text) {
				case "-":
					//txt = "&#32;&#8211;&#32;";				// endash?
					break;
				case "+":
				case "=":
					txt = "&#32;" + tf.htmlText + "&#32;";		// extra spacing
					break;
				
				default:
					//
					break;
			}
			
			txt = MathML.parseString(txt);
			
			tf.htmlText = txt;
			
			_alignwidth = tf.width - 4;// -2 to compensate for the 2 pixel gutter on text fields
			
			//
			addChild(tf);
		}		
		
		
		// PROTECTED FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Returns the width that should be used to align this item
		 */
		override public function get alignWidth():Number {
			return _alignwidth;
		}
		
	}
}