package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class SiteSound
	extends BaseClip {
		
		public var mcPlay:BaseMenuBtnNormal;
		public var mcStop:BaseMenuBtnNormal;
		public var mcBuffer:MovieClip;
		
		override protected function initClip():void {
			mcBuffer.stop();
			mcPlay.addEventListener( MouseEvent.CLICK, play_music);
			mcStop.addEventListener( MouseEvent.CLICK, stop_music);
		}
		
		private function stop_music(e:MouseEvent):void {
			
		}
		
		private function play_music(e:MouseEvent):void {
			
		}
		
	}
	
}