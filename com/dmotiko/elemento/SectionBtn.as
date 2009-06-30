package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.text.*;
	
	public class SectionBtn
	extends BaseMenuBtn {
		
		public var mcMask:SectionBtnBack;
		public var mcBack:SectionBtnBack;		
		public var mcPhoto:SectionBtnImg;		
		
		override protected function initClip():void {
			super.initClip();			
			mcBack.addEventListener( BaseClip.CLIP_SHOWED, showEnd);
			mcBack.addEventListener( BaseClip.CLIP_RESIZED, clipResized);
		}
		
		private function clipResized(e:Event):void {
			setSize( new Point( mcBack.width, mcBack.height ));
		}
				
		override public function rollOver(e:MouseEvent):void {
			if (bActive) return;
			mcMask.show();
			mcBack.show();
			mcPhoto.show();
			
		}
		override public function rollOut(e:MouseEvent):void {
			if (bActive) return;
			mcMask.hide();
			mcBack.hide();
			mcPhoto.hide();
		}
		
		override protected function refreshData():void {
			mcPhoto.setData( data );
		}
		
		override public function getSize():Point {
			return new Point( mcBack.width, mcBack.height );
		}
		
	}
	
}