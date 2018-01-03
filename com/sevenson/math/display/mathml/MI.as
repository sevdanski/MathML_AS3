/**
 * com.sevenson.math.display.mathml.MI
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
	 * The MI class
	 */
	public class MI extends MathMLBaseSprite
	{
		
		// vars
		private var _alignwidth:Number;
		
		
		/**
		 * Creates a new instance of the MI class
		 */
		public function MI ($node:XML)
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
			if (String(tf) == ""){ return; }

			// create a text field to hold everything
			var tf:TextField = MathML.generateTextField();
			//
			var txt:String = MathML.parseString($node);
			tf.htmlText = txt;		
			//
			if (tf.text.length == 1) {
				tf.htmlText = "<i>" + tf.htmlText + "</i>";
			}
			
			//
			_alignwidth = tf.width -4;

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