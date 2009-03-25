package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
		
	public class SeluCollectionThumb
	extends BaseMenuBtn {
		
		private var loader:Loader;
		private var clipAlpha:Tween;
		private var mcPhoto:Sprite;
		
		override protected function initClip():void {
			mcPhoto = this.addChild( new Sprite() ) as Sprite;
			mcPhoto.graphics.drawRect(0, 0, 63, 63);
			mcPhoto.buttonMode = true;
			mcPhoto.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			mcPhoto.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( SeluSite.getApp() ) ? SeluSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("mini") + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			mcPhoto.addChild( this.loader );
		}
		
		override public function rollOver( evnt:MouseEvent):void {
			if (clipAlpha) clipAlpha.stop();
			clipAlpha = new Tween( mcPhoto, "alpha", Regular.easeIn, mcPhoto.alpha, 1, 0.3, true);
		}
		override public function rollOut( evnt:MouseEvent):void {
			if ( bActive ) return;
			if (clipAlpha) clipAlpha.stop();
			clipAlpha = new Tween( mcPhoto, "alpha", Regular.easeIn, mcPhoto.alpha, 0.2, 0.3, true);
		}
		
		private function thumbInit( evnt:Event ):void {
			mcPhoto.alpha = 0.2;
			//clipAlpha = new Tween( mcPhoto, "alpha", Regular.easeOut, 0, 0.2, 1, true);
		}
	}
	
}