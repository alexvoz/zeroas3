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
		private var shadowAlpha:Tween;
		private var clipAlpha:Tween;
		
		override protected function initClip():void {
			mcShadow.alpha = 0.6;
			mcShadow.buttonMode = true;
			mcShadow.useHandCursor = true;
			mcShadow.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			mcShadow.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			mcPhoto.mask = mcMask;
		}
		
		override protected function refreshData():void {
			trace( data );
			/*
			var sNoCache:String = ( SeluSite.getApp() ) ? SeluSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( photo.getIcon() + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			mcPhoto.addChild( this.loader );
			*/
		}
		
		override public function rollOver( evnt:MouseEvent):void {
			if (shadowAlpha) shadowAlpha.stop();
			shadowAlpha = new Tween( mcShadow, "alpha", Regular.easeIn, mcShadow.alpha, 0, 1, true);
		}
		override public function rollOut( evnt:MouseEvent):void {
			if ( bActive ) return;
			if (shadowAlpha) shadowAlpha.stop();
			shadowAlpha = new Tween( mcShadow, "alpha", Regular.easeOut, mcShadow.alpha, 0.6, 1, true);
		}
		
		private function thumbInit( evnt:Event ):void {
			mcPhoto.alpha = 0;
			clipAlpha = new Tween( mcPhoto, "alpha", Regular.easeOut, 0, 1, 1, true);
		}
	}
	
}