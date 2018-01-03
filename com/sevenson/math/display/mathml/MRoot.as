/**
 * com.sevenson.math.display.mathml.MRoot
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.math.display.mathml
{
	import flash.display.Sprite;
	import com.sevenson.math.display.mathml.*;
	import flash.geom.Rectangle;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;
	
	/**
	 * The MRoot class
	 */
	public class MRoot extends MathMLBaseSprite
	{
		
		// vars
		private var _linethickness:Number = 1;
		private var _radicalpointwidth:Number = 3;
		private var _alignheight:Number;
		private var _gutteroffsetinternal:Number = -4;
		
		/**
		 * Creates a new instance of the MRoot class
		 */
		public function MRoot ($node:XML)
		{
			//
			super($node);
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

		
		/**
		 * This will build this item based on the $node passed in
		 * @param	$node
		 */
		protected function buildContent($node:XMLList):void {
			// check that there is enough nodes
			var len:int = $node.length();
			if(len!=2) {
				throw new Error("MFRAC was given incorrect number of properties:\n" + $node);
				return;
			}
			//
			renderRootLayout($node[0], $node[1]);
		}		
		
		
		// this will render out the given text
		protected function renderRootLayout(basenode:XML, powernode:XML):void {
			// parse the base
			var base:Sprite = MathML.parseMathMLNode(basenode);
			var baserect:Rectangle = base.getRect(base);
			base.y -= baserect.top;
			addChild(base);
			
			
			
			// parse the power
			var power:Sprite = MathML.parseMathMLNode(powernode);
			addChild(power);
			power.scaleX = power.scaleY = 0.8;
			power.x -= _gutteroffsetinternal;
			
			// create the radical
			var radical:Sprite = new Sprite();
			radical.graphics.lineStyle(_linethickness, int(MathML.currentTextFormat.color), 1, false, LineScaleMode.NONE, CapsStyle.NONE);
			radical.graphics.moveTo(0, 0);
			radical.graphics.lineTo(base.width+(_linethickness*3), 0);
			radical.graphics.moveTo(0, 0);
			radical.graphics.lineTo(-_radicalpointwidth, base.height);
			radical.graphics.lineTo(-(_radicalpointwidth*2), base.height/2);
			radical.graphics.lineTo(-(_radicalpointwidth*3), base.height/2);
			addChild(radical);
			

			radical.x = (_radicalpointwidth*3) + power.width + _gutteroffsetinternal*0.5;
			base.x = power.width + (_linethickness*3) + (_radicalpointwidth*3) + _gutteroffsetinternal*0.5;
			
			verticallyPositionElements(base, power, radical);
			
			_alignheight = base.height;
		}		
		
		protected function verticallyPositionElements($base:Sprite, $power:Sprite, $radical:Sprite):void {
			// position it
			$power.y = ($base.height / 2) - ($power.height + _linethickness);
			
		}
		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Returns the height that should be used to align this item
		 */
		override public function get alignHeight():Number {
			return _alignheight;
		}	
		
		
	}
}