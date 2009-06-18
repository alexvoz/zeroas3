package com.dmotiko.opositor {
	
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
		
	public class OPPuntosVentaButton
	extends BaseMenuBtn {
		public var txtLabel:TextField;
		public var mcTrigger:Sprite;
								
		override protected function initClip():void {
			super.initClip();
								
			//inicializo los clips
			this.mouseEnabled = false;
			mcTrigger.buttonMode = true;
			mcTrigger.alpha = 0;
			txtLabel.mouseEnabled = false;
			//txtLabel.embedFonts = true;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			mcTrigger.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			mcTrigger.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			
		}
		
		override protected function refreshData():void {
			txtLabel.text = (data.label as String).toUpperCase();
			mcTrigger.width = txtLabel.width;
		}
		
		override public function rollOut( e:MouseEvent ):void {
			if ( bActive ) return;
			txtLabel.textColor = 0x666666;
		}
				
		override public function rollOver( e:MouseEvent ):void {
			txtLabel.textColor = 0xCE0000;
		}
		
	}
	
}