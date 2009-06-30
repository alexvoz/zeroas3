package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.text.*;
	
	public class SectionBtnBack
	extends BaseClip {
		
		private var oController:Object;
		
		override protected function initClip():void {
			this.stop();
			oController = new Object();
			oController.pos = 1;
		}
		
		override public function show():void {
			registerTween( "scale", new Tween( oController, "pos", Regular.easeOut, oController.pos, totalFrames, totalFrames - oController.pos), false, true, true);
		}
		
		override public function hide():void {
			registerTween( "scale", new Tween( oController, "pos", Regular.easeOut, oController.pos, 1, oController.pos - 1), false, false, true);
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			showEnd();
		}
		
		override protected function tweenChanged( key:String, tween:Tween):void {
			gotoAndStop( Math.round(oController.pos) );
			setSize( new Point( this.width, this.height ) );			
		}
		
		
	}
	
}