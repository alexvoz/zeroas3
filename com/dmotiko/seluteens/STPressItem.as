package com.dmotiko.seluteens {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class STPressItem
	extends BaseClip {
		
		public var txtLabel:TextField;
		private var bActive:Boolean;
		
		override protected function initClip():void {
			buttonMode = true;
			txtLabel.mouseEnabled = false;
			addEventListener( MouseEvent.CLICK, item_press);
			addEventListener( MouseEvent.ROLL_OVER, item_over);
			addEventListener( MouseEvent.ROLL_OUT, item_out);
		}
		
		private function item_out(e:MouseEvent):void {
			if (bActive) return;
			txtLabel.text = data.label;
		}
		
		private function item_over(e:MouseEvent):void {
			txtLabel.text = "> "+data.label;
		}
		
		private function item_press(e:MouseEvent):void {
			dispatchEvent( new Event( Event.CHANGE) );
		}
		
		override protected function refreshData():void {
			txtLabel.text = data.label;
			
		}
		
		public function getActive():Boolean { return bActive; }
		
		public function setActive(value:Boolean):void {
			if(!bActive && value) dispatchEvent( new MouseEvent( MouseEvent.ROLL_OVER ) );
			bActive = value;
			dispatchEvent( new MouseEvent( MouseEvent.ROLL_OUT ) );
		}
		
	}
	
}