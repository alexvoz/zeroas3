package com.dmotiko.luisbelgrano {
	import com.general.BaseClip;
	import flash.events.Event;
	
	public class LBPortfolioTitle
	extends BaseClip {
		
		public function LBPortfolioTitle() {
			super();
		}
		
		override public function show():void {
			function checkEnd(evnt):void {
				if ( currentFrame == totalFrames ) {
					removeEventListener( Event.ENTER_FRAME, checkEnd);
					showEnd();
				} else {
					nextFrame();
				}
			}
			addEventListener( Event.ENTER_FRAME, checkEnd );
		}
		override public function hide():void {
			function hideClip(evnt):void {
				if ( currentFrame == 1 ) {
					removeEventListener( Event.ENTER_FRAME, hideClip);
					hideEnd();
				} else {
					prevFrame();
				}
			}
			addEventListener( Event.ENTER_FRAME, hideClip );
		}
		
	}
	
}