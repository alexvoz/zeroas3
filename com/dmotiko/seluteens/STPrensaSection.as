package com.dmotiko.seluteens {
	
	import com.dmotiko.seluteens.dummy.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class STPrensaSection
	extends BaseClip {
		
		public var mcPressContainer:STPressContainer;
		public var mcPhoto;
		
		override protected function initClip():void {
			super.initClip();
			
			if ( !STSite.getApp() ) return;
			
			STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			var list:XMLList = STSite.getApp().getPressData();
			mcPressContainer.setData( list );
			mcPressContainer.addEventListener( Event.CHANGE, press_changed);
		}
		
		private function press_changed(e:Event):void {
			STSite.log("STPrensaSection | press_changed= " + e.currentTarget.getData());
		}
				
		private function section_changed(e:Event):void {
			if ( STSite.getApp().getSection() == STSite.PRENSA ) {
				
			}
		}
		
	}
	
}