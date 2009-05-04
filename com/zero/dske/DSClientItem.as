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
		public var txtLabel:TextField;
		
		override protected function initClip():void {
			mcStar.stop();
		}
						
		override protected function refreshData():void {
			txtLabel.text = data.title;
			txtLabel.mouseEnabled = false;
			if ( data.successHREF ) {
				mcStar.gotoAndStop(2);
				this.addEventListener( MouseEvent.ROLL_OVER, star_over);
				this.addEventListener( MouseEvent.ROLL_OUT, star_out);
				this.addEventListener( MouseEvent.CLICK, star_selected);
				this.buttonMode = true;
			}
		}
		
		private function star_selected(e:MouseEvent):void {
			navigateToURL( new URLRequest(data.successHREF), "_self" );
		}
				
		private function star_out(e:MouseEvent):void {
			mcStar.gotoAndStop(2);
		}
		
		private function star_over(e:MouseEvent):void {
			mcStar.gotoAndStop(3);
		}
		
	}
	
}