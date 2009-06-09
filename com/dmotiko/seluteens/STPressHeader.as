package com.dmotiko.seluteens {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class STPressHeader
	extends BaseClip {
		
		public var txtLabel:TextField;
		
		override protected function refreshData():void {
			txtLabel.text = data as String;
		}
		
	}
	
}