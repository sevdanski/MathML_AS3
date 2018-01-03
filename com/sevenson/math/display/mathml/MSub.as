/**
 * com.sevenson.math.display.mathml.MSub
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
	 * The MSub class
	 */
	public class MSub extends MSubSup
	{
		
		
		/**
		 * Creates a new instance of the MSub class
		 */
		public function MSub ($node:XML)
		{
			//
			super($node);
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
		override protected function buildContent(node_xml:XMLList):void {
			// check that there is enough nodes
			var len:int = node_xml.length();
			if(len!=2) {
				throw new Error("MSub was given incorrect number of properties:\n" + node_xml);
				return;
			}
			
			//
			var tmp:XML = <mn></mn>
			//
			renderSubSupLayout(node_xml[0], node_xml[1], tmp);
			
		}		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		
	}
}