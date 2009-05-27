package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.system.LoaderContext;
	import flash.text.*;
	import flash.display.*;
	import flash.net.*;
	
	public class SeluTeensCollectionPhoto
	extends BaseClip {
		private var loader:Loader;
		public var mcImg:Sprite;
		public var mcMask:Sprite;
		
		override protected function initClip():void {
			mcImg.mask = mcMask;
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( SeluTeensSite.getApp() ) ? SeluTeensSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("big") + sNoCache );
			this.loader = new Loader();
			var context:LoaderContext = new LoaderContext(); 
			context.checkPolicyFile = true;
			this.loader.load( request, context );
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