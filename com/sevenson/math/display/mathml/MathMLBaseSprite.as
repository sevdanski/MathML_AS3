/**
 * com.sevenson.math.display.mathml.MathMLBaseSprite
 * 
 * This is a base class for all of the different MathML representations. It sets up the common attributes, etc.
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.math.display.mathml
{
	import flash.display.Sprite;
	
	/**
	 * The MathMLBaseSprite class
	 */
	public class MathMLBaseSprite extends Sprite
	{
		
		// vars
		private var _xoffset:Number = 0;
		private var _yoffset:Number = 0;		
		
		
		/**
		 * Creates a new instance of the MathMLBaseSprite class
		 */
		public function MathMLBaseSprite ($node:XML)
		{
			parseAttributes($node);
		}
		
		
		// STATIC PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// STATIC PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * A clean up routine that destroys all external references to prepare the class for garbage collection
		 */
		public function destroy () : void
		{
			if (parent) parent.removeChild(this);
		}
		
		
		// PROTECTED FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Parses any pre-defined attributes
		 * @param	$node - the xml to parse for attributes
		 */
		protected function parseAttributes($node:XML):void {
			//
			if($node.@xoffset!=undefined) {
				_xoffset = Number($node.@xoffset);
			}
			//
			if($node.@yoffset!=undefined) {
				_yoffset = Number($node.@yoffset);
			}
			
			if($node.hasOwnProperty("@visible")) {
				visible = ($node.@visible=="true" || $node.@visible=="t" || $node.@visible=="1");
			}
		}		
		
		
		// PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Returns the currently set x offset
		 */
		public function get xoffset():Number {
			return _xoffset;
		}
		
		/**
		 * Returns the currently set y offset
		 */
		public function get yoffset():Number {
			return _yoffset;
		}
		
		/**
		 * Returns the height that should be used to align this item
		 */
		public function get alignHeight():Number {
			return height;
		}	
		
		/**
		 * Returns the width that should be used to align this item
		 */
		public function get alignWidth():Number {
			return width;
		}			
		
	}
}