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
			if ( mcLoader ) {
				swapChildren(mcLoader, mcImg);
				mcLoader.visible = false;
				mcLoader.addEventListener( Event.COMPLETE,  show_photo );
			}
		}
		
		private function show_photo(e:Event):void 
		{
			mcImg.addChild( this.loader );
			(loader.content as Bitmap).smoothing = true;
			this.dispatchEvent( new Event(Event.COMPLETE) );
		}
		
		override protected function refreshData():void {
			//var sNoCache:String = ( OPSite.getApp() ) ? OPSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( OPSite.getApp().getResource((data as XML).attribute("big")) );
			this.loader = new Loader();
			var context:LoaderContext = new LoaderContext(); 
			context.checkPolicyFile = true;
			this.loader.load( request, context );
			if (mcLoader) {
				mcLoader.visible = true;
				this.loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, load_progress);
				mcLoader.setData( { dummy: true } );
			}
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
		}
		
		protected function load_progress(e:ProgressEvent):void {
			mcLoader.setData( e );
		}
				
		protected function thumbInit( evnt:Event ):void {
			if( mcLoader ) mcLoader.setData( evnt );
			//(loader.content as Bitmap).smoothing = true;
			//this.dispatchEvent( new Event(Event.COMPLETE) );
		}
		
	}
	
}