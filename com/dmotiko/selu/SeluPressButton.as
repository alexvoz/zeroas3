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
			super.initClip();
			
			txtLabel.mouseEnabled = false;
			
			nColor = 0x000000;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.textColor = nColor;
		}
		
		override public function rollOver( evnt:MouseEvent ):void {
			txtLabel.textColor = /*0xfefff3;*/0x000000;
			gotoAndStop(2);
		}
		
		override public function rollOut( evnt:MouseEvent ):void {
			if ( this.bActive )	return;
			txtLabel.textColor = nColor;
			gotoAndStop(1);
		}
		
		override protected function refreshData():void {
			//SeluSite.log( "SeluPressButton | refreshData=  "+data.label);
			txtLabel.text = data.label/*.toUpperCase()*/;
		}
	}
	
}