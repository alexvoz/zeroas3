package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class NavBarBtn
	extends BaseMenuBtn {
		
		public var mcBack:Sprite;
		public var mcOver:Sprite;
		public var mcShadow:Sprite;
		public var txtLabel:TextField;
		private var nColor:int;
		
		override protected function initClip():void {
			super.initClip();			
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.mouseEnabled = false;
			mcOver.visible = false;
			mcShadow.mouseEnabled = false;
			nColor = txtLabel.textColor;
		}
		
		override public function rollOver(e:MouseEvent):void {
			mcOver.visible = true;
			txtLabel.textColor = 0xFFFFFF;
		}
		override public function rollOut(e:MouseEvent):void {
			mcOver.visible = false;
			txtLabel.textColor = nColor;
		}
		
		override protected function refreshData():void {
			txtLabel.text = (data.label as String).toUpperCase();
			mcOver.width = mcBack.width = txtLabel.width + 15;
			mcShadow.x = mcBack.getBounds(this).right;
		}
		
		
	}
	
}