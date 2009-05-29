package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
		
	public class STButtonResalte
	extends BaseMenuBtn {
		public var txtLabel:TextField;
		public var mcResalte:MovieClip;
		public var mcRect:MovieClip;
						
		override protected function initClip():void {
			super.initClip();
								
			//inicializo los clips
			this.mouseEnabled = false;
			mcRect.buttonMode = true;
			mcRect.alpha = 0;
			mcResalte.mouseEnabled = mcResalte.mouseChildren = false;
			txtLabel.mouseEnabled = false;
			txtLabel.embedFonts = true;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			mcRect.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			mcRect.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			
		}
		
		override protected function refreshData():void {
			/*
			if (data.special == "yes") txtLabel.textColor = 0;
			else txtLabel.textColor = 0x333333;
			*/
			txtLabel.text = data.label;
			mcRect.width = txtLabel.width;
			mcResalte.x = txtLabel.x - 3;
			mcResalte.y = txtLabel.y + 5;
			mcResalte.height = mcRect.height + 10;
			mcResalte.width = txtLabel.width + 25;
		}
		
		override public function rollOut( e:MouseEvent ):void {
			//STSite.log( "STButtonResalte rollOut" );
			if ( bActive ) return;
			var _mask:MovieClip = mcResalte.getChildByName("mcMask") as MovieClip;
			_mask.removeEventListener(Event.ENTER_FRAME, foward);
			_mask.addEventListener( Event.ENTER_FRAME, rewind);
		}
				
		override public function rollOver( e:MouseEvent ):void {
			//STSite.log( "STButtonResalte rollOver" );
			var _mask:MovieClip = mcResalte.getChildByName("mcMask") as MovieClip;
			_mask.removeEventListener(Event.ENTER_FRAME, rewind);
			_mask.addEventListener( Event.ENTER_FRAME, foward);
		}
		private function rewind(e:Event):void {
			var _mask:MovieClip = e.currentTarget as MovieClip;
			if ( _mask.currentFrame == 1) {
				_mask.removeEventListener(Event.ENTER_FRAME, rewind);
			} else {
				_mask.prevFrame();
			}
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