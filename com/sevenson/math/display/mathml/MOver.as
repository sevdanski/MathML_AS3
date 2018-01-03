/**
 * com.sevenson.math.display.mathml.MOver
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
	 * The MOver class
	 */
	public class MOver extends MUnderOver
	{
		
		// vars
		
		
		/**
		 * Creates a new instance of the MOver class
		 */
		public function MOver ($node:XML)
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
		
		// this should build the required content
		override protected function buildContent(node_xml:XMLList):void {
			// check that there is enough nodes
			var len:int = node_xml.length();
			if(len!=2) {
				throw new Error("MOVER was given incorrect number of properties:\n" + node_xml);
				return;
			}
			//
			var tmp:XML = <mn></mn>			
			//
			renderUnderOverLayout(node_xml[0], tmp, node_xml[1]);
			
		}	
		
		
		// PROTECTED FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		//
		override public function get alignHeight():Number {
			return height;
		}
		
	}
}