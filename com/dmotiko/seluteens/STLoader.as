package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
	
	public class STLoader
	extends BaseClip {
		
		private var nPos:Number;
		private var aTimerClip:Array;
		private var lastClip:MovieClip;
		
		override protected function initClip():void {
			aTimerClip = new Array();
			nPos = 0;
			(getChildByName("mcAvion") as MovieClip).addEventListener( Event.ENTER_FRAME, clip_enter_frame );
		}
		
		public function getPos():Number {
			return this.nPos;
		}
		
		public function setPos(p):void {
			nPos = p;
						
			var target:MovieClip;
			if ( nPos > 100 ) nPos = 100;
			if ( nPos == 100) {
				target = getChildByName("mc100") as MovieClip;
			} else if ( nPos >= 80 ) {
				target = getChildByName("mc80") as MovieClip;
			} else if ( nPos >= 60 ) {
				target = getChildByName("mc60") as MovieClip;
			} else if ( nPos >= 40 ) {
				target = getChildByName("mc40") as MovieClip;
			} else if ( nPos >= 20 ) {
				target = getChildByName("mc20") as MovieClip;
			}
			if ( target && target != lastClip) {
				target.alpha = 1;
				if ( lastClip ) {
					registerTween( "fadeOut" + lastClip.name, new Tween(lastClip, "alpha", Regular.easeOut, lastClip.alpha, 0, 0.5, true));
				}
				lastClip = target;
			}
		}
					
		private function clip_enter_frame(e:Event):void {
			var avion:MovieClip = (getChildByName("mcAvion") as MovieClip);
			var nFrame:Number = nPos * avion.totalFrames / 100;
			nFrame = Math.round(nFrame) + 1;
			if ( nFrame > avion.currentFrame ) avion.nextFrame();
			if ( avion.currentFrame == avion.totalFrames && getChildByName("mc100").alpha == 1 ) {
				avion.removeEventListener( Event.ENTER_FRAME, clip_enter_frame ); 
				var timer:Timer = new Timer( 500, 1 );
				timer.addEventListener( TimerEvent.TIMER_COMPLETE, timer_complete);
				timer.start();
			}
		}
		
		private function timer_complete(e:TimerEvent):void {
			 this.dispatchEvent( new Event(Event.CHANGE) );
		}
		
	}
	
}