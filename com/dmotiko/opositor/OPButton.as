package com.dmotiko.opositor {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	
	public class OPButton
	extends BaseClip {
		
		public var txtLabel:TextField;
		public var mcTrigger:Sprite;
				
		override protected function initClip():void {
			stop();
			this.useHandCursor = true;
			this.buttonMode = true;
			
			this.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			this.addEventListener( MouseEvent.ROLL_OUT, rollOut);
		}
		
		public function rollOver( evnt:MouseEvent ):void {
			this.gotoAndStop(2);
		}
		
		public function rollOut( evnt:MouseEvent ):void {
			this.gotoAndStop(1);
		}
		
	}
	
}