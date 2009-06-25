package com.general {
	
	import flash.events.*
	
	public class BaseMenuBtnNormal
	extends BaseMenuBtn {
		
		override public function rollOver(evnt:MouseEvent):void {
			this.gotoAndStop(2);
		}
		
		override public function rollOut(evnt:MouseEvent):void { 
			this.gotoAndStop(1);
		}
		
	}
	
}