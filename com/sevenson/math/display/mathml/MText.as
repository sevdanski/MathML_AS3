/**
 * com.sevenson.math.display.mathml.MText
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
	 * The MText class
	 */
	public class MText extends MathMLBaseSprite
	{
		
		// vars
		private var _alignwidth:Number;
				
		/**
		 * Creates a new instance of the MText class
		 */
		public function MText ($node:XML)
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
	
		
		
		// PROTECTED FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// this should build the required content
		protected function buildContent(node_xml:XMLList):void {
			//
			if(String(tf)==""){ return; }
			// create a text field to hold everything
			var tf:TextField = MathML.generateTextField();
			
			var s:String = node_xml.toString();
			s = s.split("&nbsp;").join(" ");
			//
			tf.htmlText = MathML.parseString(s);
			
			//
			_alignwidth = tf.width;
			
			//
			addChild(tf);
		}		
		
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