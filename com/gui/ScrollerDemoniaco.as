package com.gui 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Lucas
	 */
	public class ScrollerDemoniaco
	extends ScrollerMovie
	{
		
		override protected function content_check(e:Event):void {
			if( !checkScroll() ) return;
			/*set a variable 
			this variable basically stores info regarding what fraction of the total content 
			is being displayed through the mask and ensures that dragging the mcDrag
			from top to bottom will reveal all the text.
			*/
			scrollAmount=(mcContent.height-(mcMask.height/*/1.3*/))/(mcBar.height-mcDrag.height);
			//set a new target y position
			targY =-mcDrag.y*scrollAmount;
			//set the y of the text to 1/5 of the distance between its current y and the target y
			
			//change the 5 to a lower number for faster scrolling or a higher number for slower scrolling
			mcContent.y-=(mcContent.y-targY)/5 + 2;
		}
		
		override public function checkScroll():Boolean {
			mcBar.visible = mcDrag.visible = true;
			var needScroll:Boolean = mcContent.height > mcMask.height;
			if ( !needScroll ) {
				mcBar.alpha = mcDrag.alpha = 0.4;
				mcBar.mouseEnabled = mcDrag.mouseEnabled = false;
				
			} else {
				mcBar.alpha = mcDrag.alpha = 1;
				mcBar.mouseEnabled = mcDrag.mouseEnabled = true;
			}
			return needScroll;
		}
		
	}

}