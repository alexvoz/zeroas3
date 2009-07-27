package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class LangBtn
	extends BaseClip {
		
		public var mcSpanish:BaseMenuBtnNormal;
		public var mcEnglish:BaseMenuBtnNormal;
				
		override protected function initClip():void {
			super.initClip();			
			mcSpanish.addEventListener( MouseEvent.CLICK, change_language);
			mcEnglish.addEventListener( MouseEvent.CLICK, change_language);
			Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, lang_changed);
			lang_changed(undefined);
		}
		
		private function lang_changed(e:Event):void {
			if ( Site.getApp().getLanguage() == Site.SPANISH ) {
				mcSpanish.rollOver(undefined);
				mcSpanish.setActive(true);
				mcEnglish.setActive(false);
				
			} else {
				mcEnglish.rollOver(undefined);
				mcEnglish.setActive(true);
				mcSpanish.setActive(false);
				
			}
		}
		
		private function change_language(e:MouseEvent):void {
			if ( e.currentTarget == mcSpanish ) {
				Site.getApp().setLanguage( Site.SPANISH );
			} else {
				Site.getApp().setLanguage( Site.ENGLISH );
			}
		}
		
		
		
	}
	
}