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
		public var txtLabel:TextField;
		public var mcResalte:MovieClip;
		public var mcRect:MovieClip;
						
		override protected function initClip():void {
			
			//inicializo los clips
			this.mouseEnabled = false;
			mcRect.buttonMode = true;
			mcRect.alpha = 0;
			mcResalte.alpha = 10;
			mcResalte.mouseEnabled = mcResalte.mouseChildren = false;
			txtLabel.mouseEnabled = false;
			txtLabel.embedFonts = true;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			mcRect.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			mcRect.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			
		}
		
		override protected function refreshData():void {
			if (data.special == "yes") txtLabel.textColor = 0x3b4b67;
			else txtLabel.textColor = 0x3b4b67;
			txtLabel.text = data.label/*.toUpperCase()*/;
			mcRect.width = txtLabel.width;
			mcResalte.x = txtLabel.x-14;
			mcResalte.y = txtLabel.y - 1;
			//mcResalte.height = mcRect.height-2;
			mcResalte.width = txtLabel.width + 25;
			mcResalte.alpha=0;
		}
		
		override public function rollOut( e:MouseEvent ):void {
			if ( bActive ) return;
			/*var _mask:MovieClip = mcResalte.getChildByName("mcMask") as MovieClip;
			_mask.removeEventListener(Event.ENTER_FRAME, foward);
			_mask.addEventListener( Event.ENTER_FRAME, rewind);*/
			mcResalte.alpha=0;
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
			/*var _mask:MovieClip = mcResalte.getChildByName("mcMask") as MovieClip;
			_mask.removeEventListener(Event.ENTER_FRAME, rewind);
			_mask.addEventListener( Event.ENTER_FRAME, foward);*/
			mcResalte.alpha=20;
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