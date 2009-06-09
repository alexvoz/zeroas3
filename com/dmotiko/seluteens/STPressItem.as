package com.dmotiko.seluteens {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class STPressItem
	extends BaseClip {
		
		public var txtLabel:TextField;
		
		override protected function initClip():void {
			buttonMode = true;
			txtLabel.mouseEnabled = false;
			addEventListener( MouseEvent.CLICK, item_press);
		}
		
		private function item_press(e:MouseEvent):void {
			dispatchEvent( new Event( Event.CHANGE) );
		}
		
		override protected function refreshData():void {
			txtLabel.text = data.label;
		}
		
	}
	
}