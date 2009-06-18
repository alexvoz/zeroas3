package com.dmotiko.opositor {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	
	public class OPHomeLogo
	extends BaseClip {
		
		override protected function initClip():void {
			bShowed = true;
			this.buttonMode = true;
			addEventListener(MouseEvent.CLICK, back_home);
		}
		
		private function back_home(e:MouseEvent):void {
			if ( OPSite.getApp().getSection() != OPSite.HOME) {
				OPSite.getApp().setSection( OPSite.HOME );
			}
		}
		
		override public function show():void {
			if ( bShowed ) return;
			this.mouseEnabled = true;
			registerTween("fade", new Tween( this, "alpha", Regular.easeOut, this.alpha, 1, 0.5, true), false, true);
		}
		override public function hide():void {
			if ( !bShowed ) return;
			this.mouseEnabled = false;
			registerTween("fade", new Tween( this, "alpha", Regular.easeOut, this.alpha, 0, 0.5, true), false, true);
		}
		
		override protected function tweenFinished(key:String, tween:Tween):void {
			if ( this.alpha == 0 ) hideEnd();
			else showEnd();
		}
		
	}
	
}