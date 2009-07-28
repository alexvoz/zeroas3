package com.dmotiko.elemento {
	
	import com.general.*
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class LangSens
	extends BaseClip {
		
		override protected function initClip():void {
			super.initClip();
			stop();
			if ( Site.getApp() ) {
				Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, lang_changed);
				lang_changed(undefined);
			}
			
		}
		
		protected function lang_changed(e:Event):void 
		{
			if ( Site.getApp().getLanguage() == Site.SPANISH ) {
				gotoAndStop(1);
			} else {
				gotoAndStop(2);
			}
		}
		
	}
	
}