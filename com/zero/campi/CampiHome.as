package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
		
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiHome extends CampiTramaContent
	{
		
		public var mcBanner:MovieClip;
		
		public function CampiHome() 
		{
			
			animationClass = TramaTransition7;
			
			super();
			
			mcBanner.y = -mcBanner.height - 30;
			removeChild(mcBanner);
			mcBanner.stop();
			
		}
		
		override public function hide():void {
			TweenLite.to( mcBanner, 0.8, { y: -mcBanner.height - 30, ease: Strong.easeInOut, onComplete: hide_trama } );
		}
		
		private function hide_trama():void
		{
			super.hide();
		}
		
		override protected function animation_hide_end(e:Event):void 
		{
			super.hide_end();
		}
		
		override protected function animation_show_end(e:Event):void 
		{
			super.animation_show_end(e);
			removeChild( trama );
			addChild( mcFoto );
			addChild(mcBanner);
			TweenLite.to( mcBanner, 0.8, { y: trama.getChildByName("r2c5").y, delay: 0.2, ease: Strong.easeInOut } );
		}
		
	}

}