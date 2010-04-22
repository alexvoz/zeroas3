package com.dmotiko.selu {
	
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	
	public class SeluNovedadesSection
	extends BaseClip {
		
		public var mcNews:SeluNewsContainer;
		
		override protected function initClip():void {
			super.initClip();
			mcNews.setData( SeluSite.getApp().getNewsData() );
					}
		
	}
	
}