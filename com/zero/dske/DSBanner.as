package com.zero.dske {
	import com.general.BaseClip;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	
	public class DSBanner
	extends BaseClip {
		private var tBanner:Timer;
		private var swfLoader:Loader;
		private var aBanners:Array;
		private var nBanner:uint;
		private var container:Sprite;
				
		function DSBanner() {
			var nDelay:uint = LoaderInfo(this.root.loaderInfo).parameters.bannerDelay;
			if (!nDelay) nDelay = 5000;
			tBanner = new Timer( nDelay );
			tBanner.addEventListener(TimerEvent.TIMER, loadBanner);
			container = new Sprite();
			this.addChild(container);
			swfLoader = new Loader();
			swfLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, swf_loaded);
			aBanners = new Array();
			var nCount:Number = 1;
			
			while (LoaderInfo(this.root.loaderInfo).parameters["banner" + nCount] ) {
				aBanners.push(LoaderInfo(this.root.loaderInfo).parameters["banner" + nCount]);
				nCount++;
			}
						
			nBanner = 0;
			if(aBanners.length > 0) loadBanner();
			
			this.addEventListener( MouseEvent.MOUSE_MOVE, reset_timer);
		}
		
		private function reset_timer(e:MouseEvent):void {
			tBanner.reset();
			tBanner.start();
		}
		
		private function swf_loaded(e:Event):void {
			if( container.numChildren == 1 ) container.removeChildAt(0);
			container.addChild( e.currentTarget.content );
			tBanner.start();
		}
		
		private function loadBanner( e:TimerEvent = undefined ):void {
			
			if ( nBanner == aBanners.length ) nBanner = 0;
			swfLoader.load( new URLRequest( aBanners[nBanner] ) );
			nBanner ++;
		}
				
	}
	
}