package com.dmotiko.seluteens.dummy {
	import com.general.*;
	import com.util.MathUtil;
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class ComboItem
	extends BaseClip {
		
		public var txtLabel:TextField;
		public var mcResalte:MovieClip;
		
		override protected function initClip():void {
			txtLabel.mouseEnabled = false;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			alpha = 0;
			addEventListener( MouseEvent.ROLL_OVER, btn_over);
			addEventListener( MouseEvent.ROLL_OUT, btn_out);
			txtLabel.textColor = 0x3D5389;
			mcResalte.scaleX = 0.8;
			this.buttonMode = true;
		}
		
		private function btn_out( e:MouseEvent):void {
			mcResalte.gotoAndPlay("hide");
		}
		
		private function btn_over( e:MouseEvent ):void {
			mcResalte.rotation = MathUtil.random( -1, 1);
			//mcResalte.x += MathUtil.random( -1, 1);
			mcResalte.gotoAndPlay("show");
		}
		
		override protected function refreshData():void {
			txtLabel.text = data.label;
		}
		
	}
	
}