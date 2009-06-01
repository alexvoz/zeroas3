package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	
	public class SeluPressButton
	extends BaseMenuBtn {
		
		public var txtLabel:TextField;
		protected var nColor:Number;
						
		override protected function initClip():void {
			//SeluSite.log( "SeluPressButton | initClip ");
			this.useHandCursor = true;
			this.buttonMode = true;
			txtLabel.mouseEnabled = false;
			
			nColor = 0x645b44;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.textColor = nColor;
			this.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			this.addEventListener( MouseEvent.ROLL_OUT, rollOut);
		}
		
		override public function rollOver( evnt:MouseEvent ):void {
			txtLabel.textColor = 0xfefff3;
			gotoAndStop(2);
		}
		
		override public function rollOut( evnt:MouseEvent ):void {
			if ( this.bActive )	return;
			txtLabel.textColor = nColor;
			gotoAndStop(1);
		}
		
		override protected function refreshData():void {
			//SeluSite.log( "SeluPressButton | refreshData=  "+data.label);
			txtLabel.text = data.label.toUpperCase();
		}
	}
	
}