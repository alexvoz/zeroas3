package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiContent extends MovieClip
	{
		
		public static const SHOW_END:String = "show_end";
		public static const HIDE_END:String = "hide_end";
	
		
		public function CampiContent() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init );
		}
		
		protected function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Event.RESIZE, init);
			this.height = stage.stageHeight;
			this.scaleX = this.scaleY;
			
		}
		
		public function show(e:Event = null ):void {
			dispatchEvent( new Event( SHOW_END ) );
		}
		
		public function hide(e:Event = null):void {
			//dispatchEvent( new Event( HIDE_END ) );
			if ( this.mask ) {
				TweenMax.to( this.mask, 0.5, { scaleX: 0, ease: Strong.easeOut, onComplete: this.hide_end } );
			} else {
				hide_end();
			}
		}
		
		protected function hide_end():void
		{
			trace("campi content hide_end");
			this.mask = null;
			this.stage.removeEventListener( Event.RESIZE, init);
			this.parent.removeChild(this);
			dispatchEvent( new Event( HIDE_END ) );
		}
		
	}

}