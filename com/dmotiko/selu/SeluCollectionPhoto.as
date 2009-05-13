package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.text.*;
	import flash.display.*;
	import flash.net.*;
	
	public class SeluCollectionPhoto
	extends BaseClip {
		private var loader:Loader;
		
		override protected function initClip():void {
			mcImg.mask = mcMask;
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( SeluSite.getApp() ) ? SeluSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("big") + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			mcImg.addChild( this.loader );
		}
				
		private function thumbInit( evnt:Event ):void {
			//mcImg.alpha = 0;
			(loader.content as Bitmap).smoothing = true;
			//registerTween("photoFade", new Tween( mcImg, "alpha", Regular.easeOut, 0, 1, 0.5, true));
		}
		
	}
	
}