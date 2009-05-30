package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.system.LoaderContext;
	import flash.text.*;
	import flash.display.*;
	import flash.net.*;
	
	public class STCollectionPhoto
	extends BaseClip {
		private var loader:Loader;
		public var mcImg:Sprite;
		public var mcMask:Sprite;
		
		override protected function initClip():void {
			//STSite.log( "STCollectionPhoto | initClip ");
			
			if ( !mcImg ) {
				mcImg = new Sprite();
				mcImg.x = mcMask.x;
				mcImg.y = mcMask.y;
				addChild( mcImg );
			}
			
			mcImg.mask = mcMask;
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( STSite.getApp() ) ? STSite.getApp().getNoCache() : "";
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
			this.dispatchEvent( new Event(Event.COMPLETE) );
			//registerTween("photoFade", new Tween( mcImg, "alpha", Regular.easeOut, 0, 1, 0.5, true));
		}
		
	}
	
}