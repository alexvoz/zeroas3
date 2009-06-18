package com.dmotiko.opositor {
	
	import fl.transitions.easing.Elastic;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;	
	import flash.events.*
	import com.general.*
			
	public class OPHomeSection
	extends BaseClip {
		
		//FLA clips
		public var mcLogo:OPHomeLogo;
		
		override protected function initClip():void {
			super.initClip();
			OPSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
		}
		
		private function section_changed(e:Event):void {
			if ( OPSite.getApp().getSection() != OPSite.HOME ) {
				OPSite.log("OPHomeSection | section_changed | hiding logo");
				mcLogo.hide();
			} else {
				mcLogo.show();
			}
		}
		
	}
	
}