package com.dmotiko.opositor {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.system.LoaderContext;
	import flash.text.*;
	import flash.display.*;
	import flash.net.*;
	
	public class OPCollectionPhoto
	extends BaseClip {
		protected var loader:Loader;
		public var mcImg:Sprite;
		public var mcMask:Sprite;
		public var mcLoader:BaseClip;
		
		override protected function initClip():void {
			//OPSite.log( "OPCollectionPhoto | initClip ");
			
			if ( !mcImg ) {
				mcImg = new Sprite();
				addChild( mcImg );
			}
			if (mcMask) {
				mcImg.x = mcMask.x;
				mcImg.y = mcMask.y;
				mcImg.mask = mcMask;
			}
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( OPSite.getApp() ) ? OPSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("big") + sNoCache );
			this.loader = new Loader();
			var context:LoaderContext = new LoaderContext(); 
			context.checkPolicyFile = true;
			this.loader.load( request, context );
			if (mcLoader) {
				this.loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, load_progress);
			}
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			mcImg.addChild( this.loader );
		}
		
		protected function load_progress(e:ProgressEvent):void {
			mcLoader.setData( e );
		}
				
		protected function thumbInit( evnt:Event ):void {
			if( mcLoader ) mcLoader.setData( evnt );
			(loader.content as Bitmap).smoothing = true;
			this.dispatchEvent( new Event(Event.COMPLETE) );
		}
		
	}
	
}