package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
		
	public class SeluButtonResalte
	extends BaseMenuBtn {
		private var txt:TextField;
		private var overAnimation:MovieClip;
		private var rect:MovieClip;
						
		override protected function initClip():void {
			super.initClip();
			//recolecto los movieclips que están en el fla
			txt = getChildByName("txtLabel") as TextField;
			overAnimation = getChildByName("mcResalte") as MovieClip;
			rect = getChildByName("mcRect") as MovieClip;
						
			//inicializo los clips
			this.mouseEnabled = false;
			rect.buttonMode = true;
			rect.alpha = 0;
			overAnimation.mouseEnabled = overAnimation.mouseChildren = false;
			txt.mouseEnabled = false;
			txt.embedFonts = true;
			txt.autoSize = TextFieldAutoSize.LEFT;
			rect.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			rect.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			
		}
		
		override protected function refreshData():void {
			txt.text = data.label.toUpperCase();
			rect.width = txt.width;
			overAnimation.x = txt.x;
			overAnimation.y = txt.y + 0;
			overAnimation.height = rect.height + 10;
			overAnimation.width = txt.width + 25;
		}
		
		override public function rollOut( e:MouseEvent ):void {
			if ( bActive ) return;
			var _mask:MovieClip = overAnimation.getChildByName("mcMask") as MovieClip;
			_mask.removeEventListener(Event.ENTER_FRAME, foward);
			_mask.addEventListener( Event.ENTER_FRAME, rewind);
		}
		
		private function rewind(e:Event):void {
			var _mask:MovieClip = e.currentTarget as MovieClip;
			if ( _mask.currentFrame == 1) {
				_mask.removeEventListener(Event.ENTER_FRAME, rewind);
			} else {
				_mask.prevFrame();
			}
		}
		override public function rollOver( e:MouseEvent ):void {
			var _mask:MovieClip = overAnimation.getChildByName("mcMask") as MovieClip;
			_mask.removeEventListener(Event.ENTER_FRAME, rewind);
			_mask.addEventListener( Event.ENTER_FRAME, foward);
		}
		
		private function foward(e:Event):void {
			var _mask:MovieClip = e.currentTarget as MovieClip;
			if ( _mask.currentFrame == _mask.totalFrames) {
				_mask.removeEventListener(Event.ENTER_FRAME, foward);
			} else {
				_mask.nextFrame();
			}
		}
		
	}
	
}