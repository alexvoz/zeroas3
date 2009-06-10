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
		public var mcPhoto:STPressPhoto;
		
		override protected function initClip():void {
			super.initClip();
			
			if ( !STSite.getApp() ) return;
			
			var list:XMLList = STSite.getApp().getPressData();
			mcPressContainer.addEventListener( Event.CHANGE, press_changed);
			mcPressContainer.setData( list );
		}
		
		private function press_changed(e:Event):void {
			mcPhoto.setData( mcPressContainer.getSelectedItem().getData().data );
		}
		
		
	}
	
}