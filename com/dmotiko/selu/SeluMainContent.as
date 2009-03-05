package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	
	public class SeluMainContent
	extends BaseClip {
		
		private var homeSection:MovieClip;
		private var coleccionSection:MovieClip;
		private var backstageSection:MovieClip;
		
		override protected function initClip():void {
			homeSection = this.getChildByName("mcHome");
			coleccionSection = this.getChildByName("mcColeccion");
			backstageSection = this.getChildByName("mcBackstage");
			backstageSection = this.getChildByName("mcBackstage");
			
			if (!SeluSite.getApp()) return;
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
		}
		
		private function sectionChanged(e:Event):void 
		{
			
		}
		
	}
	
}