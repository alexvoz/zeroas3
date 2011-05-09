package com.zero.campi.faq
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class FAQItemContainer extends MovieClip
	{
		
		override public function get height():Number {
			if( this.numChildren ){
				var ultimo:DisplayObject = this.getChildAt( this.numChildren - 1);
				return ultimo.y + ultimo.height;
			} else {
				return 0;
			}
		}
		
	}

}