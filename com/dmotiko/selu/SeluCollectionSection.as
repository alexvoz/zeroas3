package com.dmotiko.selu {
	
	import flash.events.*
	import com.general.*
	
	public class SeluCollectionSection
	extends BaseClip {
		
		private var thumbs:SeluCollectionThumbs;
		private var info:SeluCollectionInfo;
		
		override protected function initClip():void {
			super.initClip();
			thumbs = getChildByName("mcThumbs") as SeluCollectionThumbs;
			info = getChildByName("mcInfo") as SeluCollectionInfo;
			thumbs.addEventListener( Event.CHANGE, thumbs_changed);
			thumbs.setData( SeluSite.getApp().getCollectionData() );
		}
		
		private function thumbs_changed(e:Event):void {
			
		}
		
	}
	
}