package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
		
	public class SectionBtnImg
	extends BaseClip {
		
		public var mcImg:MovieClip;
		protected var mcRotulo:MovieClip;
		private var tCheck:Timer;
		
		override protected function initClip():void {
			super.initClip();
			tCheck = new Timer(50, 1);
			tCheck.addEventListener( TimerEvent.TIMER, check_rotulo);
		}
		
		private function check_rotulo(e:Event):void 
		{
			var _rotulo = mcImg.getChildByName("mcRotulo") as MovieClip;
			if ( !_rotulo || _rotulo == mcRotulo  ) return;
			else mcImg.removeEventListener( Event.ENTER_FRAME, check_rotulo);
			
			mcRotulo = _rotulo;
			mcRotulo.addEventListener( Event.REMOVED_FROM_STAGE, rotulo_removed);
			
			if ( bShowed && mcRotulo.alpha < 1 ) {
				mcRotulo.alpha = 1;
			} else if ( !bShowed && mcRotulo.alpha > 0) {
				mcRotulo.alpha = 0;
			}
		}
				
		override protected function refreshData():void {
			mcImg = new data.img();
			mcImg.x = data.initX;
			mcImg.addEventListener( Event.ENTER_FRAME, check_rotulo);
			this.addChild( mcImg );
		}
		
		private function rotulo_removed(e:Event):void 
		{
			mcImg.addEventListener( Event.ENTER_FRAME, check_rotulo);
		}
				
		override public function show():void {
			registerTween( "moveX", new Tween( mcImg, "x", Regular.easeOut, mcImg.x, data.endX, 9));
			if (mcRotulo) registerTween( "fadeLabel", new Tween( mcRotulo, "alpha", Regular.easeOut, mcRotulo.alpha, 1, 0.5, true), false, true);
			else this.showEnd();
		}
		
		override public function hide():void {
			registerTween( "moveX", new Tween( mcImg, "x", Regular.easeOut, mcImg.x, data.initX, 9));
			if (mcRotulo) registerTween( "fadeLabel", new Tween( mcRotulo, "alpha", Regular.easeOut, mcRotulo.alpha, 0, 0.5, true), false, true);
			else this.hideEnd();
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			if ( (tween.obj as DisplayObject).alpha == 0 ) {
				this.hideEnd();
			} else if( (tween.obj as DisplayObject).alpha == 1){
				this.showEnd();
			}
		}
	}
	
}