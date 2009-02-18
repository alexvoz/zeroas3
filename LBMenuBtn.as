package com.dmotiko.luisbelgrano {
	
	import com.general.BaseClip;
	import com.general.BaseMenuBtn;
	import flash.display.*
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	import fl.transitions.*
	import fl.transitions.easing.*
	
	public class LBMenuBtn
	extends BaseMenuBtn {
		
		private var nFrames:uint = 15;
		private var nInitBtnAlpha:Number = 0.75;
		private var nEndBtnAlpha:Number = 1;
		private var nInitArrowX:Number = -10;
		private var nEndArrowX:Number = -5;
		
		private var arrowInterpolator:Tween;
		private var arrowInterpolator2:Tween;
		private var btnInterpolator:Tween;
						
		public function LBMenuBtn() {
			super();
		}
		
		override protected function initClip():void {
			mcLabel.txt.autoSize = TextFieldAutoSize.LEFT;
			mcLabel.alpha = nInitBtnAlpha;
			if(mcArrow) mcArrow.alpha = 0;
			if(mcArrow) mcArrow.x = nInitArrowX;
			this.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			this.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			this.buttonMode = true;
			this.useHandCursor = true;
			mcLabel.txt.mouseEnabled = false;
		}
		
		override protected function refreshData():void {
			mcLabel.txt.text = data.getLabel().toUpperCase();
		}
		
		override public function rollOver(evnt:MouseEvent):void {
			btnInterpolator = new Tween(mcLabel, "alpha", Regular.easeOut, mcLabel.alpha, nEndBtnAlpha, nFrames);
			if(mcArrow) arrowInterpolator = new Tween(mcArrow, "alpha", Regular.easeOut, mcArrow.alpha, 1, nFrames);
			if(mcArrow) arrowInterpolator2 = new Tween(mcArrow, "x", Regular.easeOut, mcArrow.x, nEndArrowX, nFrames);
		}
		
		override public function rollOut(evnt:MouseEvent):void {
			if ( bActive ) return;
			btnInterpolator = new Tween(mcLabel, "alpha", Regular.easeOut, mcLabel.alpha, nInitBtnAlpha, nFrames);
			if(mcArrow) arrowInterpolator = new Tween(mcArrow, "alpha", Regular.easeOut, mcArrow.alpha, 0, nFrames);
			if(mcArrow) arrowInterpolator2 = new Tween(mcArrow, "x", Regular.easeOut, mcArrow.x, nInitArrowX, nFrames);
		}
				
	}
	
}