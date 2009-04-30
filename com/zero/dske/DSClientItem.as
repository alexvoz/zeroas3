package com.zero.dske {
	
	import com.general.*;
	import flash.events.*;
	import flash.display.*;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.text.*;
	
	public class DSClientItem
	extends BaseClip {
		
		public var mcStar:MovieClip;
		private var txtLabel:TextField;
		
		override protected function initClip():void {
			mcStar.stop();
		}
		
		override protected function refreshData():void {
			txtLabel.text = data.title;
			if ( data.success ) {
				mcStar.gotoAndStop(2);
				mcStar.addEventListener( MouseEvent.ROLL_OVER, star_over);
				mcStar.addEventListener( MouseEvent.ROLL_OUT, star_out);
				mcStar.addEventListener( MouseEvent.CLICK, star_selected);
				mcStar.buttonMode = true;
			}
		}
		
		private function star_selected(e:MouseEvent):void {
			navigateToURL( new URLRequest(data.successHREF) );
		}
				
		private function star_out(e:Event):void {
			mcStar.gotoAndStop(2);
		}
		
		private function star_over(e:Event):void {
			mcStar.gotoAndStop(3);
		}
		
	}
	
}