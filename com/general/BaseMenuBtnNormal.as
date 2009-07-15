package com.general {
	
	import flash.events.*
	
	public class BaseMenuBtnNormal
	extends BaseMenuBtn {
		
		override protected function initClip():void {
			super.initClip();
			stop();
		}
		
		override public function rollOver(evnt:MouseEvent):void {
			this.gotoAndStop(2);
		}
		
		override public function rollOut(evnt:MouseEvent):void { 
			if (bActive) return;
			this.gotoAndStop(1);
		}
		
	}
	
}