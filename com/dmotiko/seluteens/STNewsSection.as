package com.dmotiko.seluteens {
	
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	
	public class STNewsSection
	extends BaseClip {
		
		public var mcNewsContainer:STNewsContainer;
		public var mcPopUp:STNewPopUp;
		
		override protected function initClip():void {
			super.initClip();
			
			if ( !STSite.getApp() ) return;
			
			var list:XMLList = STSite.getApp().getNewsData();
			mcNewsContainer.addEventListener( Event.CHANGE, news_changed);
			mcNewsContainer.setData( list );
		}
		
		private function news_changed(e:Event):void {
			mcPopUp.setData( mcNewsContainer.getSelectedItem().getData() );
		}
		
	}
	
}