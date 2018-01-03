/**
 * com.sevenson.math.display.mathml.MUnderOver
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.math.display.mathml
{
	import flash.display.Sprite;
	import com.sevenson.math.display.mathml.*;
	
	/**
	 * The MUnderOver class
	 */
	public class MUnderOver extends MathMLBaseSprite
	{
		
		// vars
		protected var _alignheight:Number;
		protected var _accent:Boolean = false;
		protected var _accentunder:Boolean = false;
		
		
		/**
		 * Creates a new instance of the MUnderOver class
		 */
		public function MUnderOver ($node:XML)
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
		
		/**
		 * This will build this item based on the $node passed in
		 * @param	$node
		 */
		protected function buildContent($node:XMLList):void {
			// check that there is enough nodes
			var len:int = $node.length();
			if(len!=3) {
				throw new Error("MUNDEROVER was given incorrect number of properties:\n" + $node);
				return;
			}
			//
			renderUnderOverLayout($node[0], $node[1], $node[2]);
		}
		
		//
		override protected function parseAttributes($xml:XML):void {
			super.parseAttributes($xml)
			//
			var temp:String;
			if($xml.@accentunder!=undefined) {
				temp = String($xml.@accentunder).toLowerCase();
				_accentunder = (temp=="true");
			}
			if($xml.@accent!=undefined) {
				temp = String($xml.@accent).toLowerCase();
				_accent = (temp=="true");
			}
			
		}			
		
		
		//
		// this will render out the given text
		protected function renderUnderOverLayout(basenode:XML, undernode:XML, overnode:XML):void {
			// parse the base
			var base:Sprite = MathML.parseMathMLNode(basenode);
			addChild(base);
			//
			_alignheight = base.height;
			
			// parse the under
			var under:Sprite = MathML.parseMathMLNode(undernode);
			addChild(under);
			under.scaleX = under.scaleY = MathML.subSupScale;
			
			// parse the over
			var over:Sprite = MathML.parseMathMLNode(overnode);
			addChild(over);
			over.scaleX = over.scaleY = MathML.subSupScale;
			
			// position it
			var totalwidth:Number = this.width;
			//
			over.x = (totalwidth/2) - (over.width/2);
//			over.y = -(over.height);
			if(_accent==true) { over.y += over.height*0.3; }
				
			under.x = (totalwidth/2) - (under.width/2);
//			under.y = base.y + base.height;
			if(_accentunder==true) { under.y -= under.height*0.3; }
			
			base.x = (totalwidth/2) - (base.width/2);
			
			//
			over.y = 0;
			base.y = over.height;
			under.y = base.y + base.height;
			
		}		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Returns the height that should be used to align this item
		 */
		override public function get alignHeight():Number {
			//return _alignheight;
			return height;
		}
		
	}
}