package com.dmotiko.seluteens {
	import com.general.*;
	import flash.display.Loader;
	import flash.events.*;
	import flash.system.LoaderContext;
	import flash.net.*;
	
	public class STNewsPhoto
	extends STCollectionPhoto {
		
		override protected function refreshData():void {
			var sNoCache:String = ( STSite.getApp() ) ? STSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( data + sNoCache );
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
				
	}
	
}