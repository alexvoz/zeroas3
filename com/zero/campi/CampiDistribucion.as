package com.zero.campi 
{
	import com.zero.campi.CampiContent;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiDistribucion extends CampiContent
	{
		
		public var foto:Sprite;
		
		override protected function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Event.RESIZE, init);
			this.foto.height = stage.stageHeight;
			this.foto.scaleX = this.foto.scaleY;
			
		}
		
	}

}