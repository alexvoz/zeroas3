package com.zero.snap 
{
	import com.general.BaseClip;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TrailerThumb 
	extends BaseClip
	{
		private var loader:Loader;
		private var initBounds:Rectangle;
		
		
		override protected function initClip():void {
			loader = new Loader();
			addChild(loader);
			loader.y = 5;
			loader.scaleX = 0.6;
			loader.scaleY = 0.6;
			this.buttonMode = true;
			this.addEventListener( MouseEvent.MOUSE_OVER, mouse_over);
			this.addEventListener( MouseEvent.MOUSE_OUT, mouse_out);
		}
		
		private function mouse_over(e:MouseEvent):void 
		{
			registerTween( "scaleX", new Tween( loader, "scaleX", Regular.easeOut, loader.scaleX, 1, 0.5, true) );
			registerTween( "scaleY", new Tween( loader, "scaleY", Regular.easeOut, loader.scaleY, 1, 0.5, true), false, false, true );
			var rect:Rectangle = getBounds( stage );
			rect.top -= 50;
			rect.bottom -= 50;
			if( data.@tooltip) {
				Site.getApp().showTooltip( data.@tooltip, rect );
			}
		}
		private function mouse_out(e:MouseEvent):void 
		{
			registerTween( "scaleX", new Tween( loader, "scaleX", Regular.easeOut, loader.scaleX, 0.6, 0.5, true) );
			registerTween( "scaleY", new Tween( loader, "scaleY", Regular.easeOut, loader.scaleY, 0.6, 0.5, true), false, false, true );
			Site.getApp().hideTooltip();
		}
		
		override protected function refreshData():void {
			loader.load( new URLRequest(data.@src) );
			loader.contentLoaderInfo.addEventListener( Event.INIT, thumb_init );
		}
		
		private function thumb_init(e:Event):void 
		{
			initBounds = loader.content.getBounds(this);
			tweenChanged( "scaleY", undefined);
		}
		
		override protected function tweenChanged(key:String, tween:Tween):void {
			if(key == "scaleY"){
				loader.content.x = initBounds.left + ( initBounds.width - loader.content.getBounds(this).width ) / 2;
				loader.content.y = initBounds.bottom - loader.content.getBounds(this).height;
			}
			
		}
		
	}
	
}