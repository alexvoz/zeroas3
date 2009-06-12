package com.dmotiko.opositor {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	
	public class OPButtonSpecial
	extends OPButton {
			
		override protected function initClip():void {
			this.useHandCursor = true;
			this.buttonMode = true;
			txtLabel.mouseEnabled = false;
			
			nColor = 0xc66d41;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.textColor = nColor;
			this.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			this.addEventListener( MouseEvent.ROLL_OUT, rollOut);
		}
		
	}
	
}