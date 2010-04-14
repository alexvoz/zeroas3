package com.zero.snap {
	
	import fl.transitions.*
	import fl.transitions.easing.*
	import flash.display.*
	import flash.events.*
	import flash.geom.*
	
	public class ScrollBar
	extends MovieClip {
		
		public var btnTrigger:MovieClip;
		public var btn:MovieClip;
		public var back:MovieClip;
		public var mcBotonera:MovieClip;
		
		private var pOffset:Point;
		private var tBotonera:Tween;
		private var tBtn:Tween;
		
		function ScrollBar(){
		
			//mcGlobito.alpha = 0;
			
			btnTrigger.addEventListener( MouseEvent.MOUSE_OVER, btn_over );
			btnTrigger.addEventListener( MouseEvent.MOUSE_OUT, btn_out );
			btnTrigger.addEventListener( MouseEvent.MOUSE_DOWN, btn_down );
			btnTrigger.addEventListener( MouseEvent.MOUSE_UP, btn_up );
			btnTrigger.buttonMode = true;
			
			pOffset = new Point( btnTrigger.getBounds( btn ).left, btnTrigger.getBounds( btn ).top );
			//pOffsetGlobito = new Point( mcGlobito.getBounds( btn ).left, mcGlobito.getBounds( btn ).top );
		
		}
		
		private function btn_over(e):void {
		}
		
		private function btn_out(e):void {
		}
		
		private function btn_down(e):void {
			btnTrigger.stage.addEventListener( MouseEvent.MOUSE_UP, btn_up );
			btn.startDrag( true, new Rectangle(0, 0, back.width - btn.width, 0) );
			addEventListener( Event.ENTER_FRAME, btn_move );
		}
		
		private function btn_up(e):void {
			btn.stopDrag();
			dispatchEvent( new Event( Event.CHANGE ) );
			btnTrigger.stage.removeEventListener( MouseEvent.MOUSE_UP, btn_up );
			removeEventListener( Event.ENTER_FRAME, btn_move );
			
		}
		private function btn_move(e):void {
			btnTrigger.x = btn.x + pOffset.x;
			//mcGlobito.x = btn.x + pOffsetGlobito.x;
			refreshBotonera();
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		public function getPos():Number {
			return Math.round( btn.x * 100 /(back.width - btn.width) );
		}
		public function setPosAnimated(n):void {
			addEventListener( Event.ENTER_FRAME, btn_move );
			tBtn = new Tween( btn, "x", Regular.easeInOut, btn.x, n * (back.width - btn.width) / 100, 1, true);
			tBtn.addEventListener( TweenEvent.MOTION_FINISH, btn_up);
		}
		public function setPos(n):void {
			
			btn.x = n * (back.width - btn.width) / 100;
			btnTrigger.x = btn.x + pOffset.x;
			dispatchEvent( new Event( Event.CHANGE ) );
			refreshBotonera();
		}
						
		private function refreshBotonera(){
			var n:Number = getPos();
			if( n < 25 ){
				if( mcBotonera.currentFrame == 1 ) return;
			} else if ( n > 25 && n < 80 ){
				if( mcBotonera.currentFrame == 2 ) return;
			} else if ( n > 80) {
				if(mcBotonera.currentFrame == 3) return;
			}
			if ( tBotonera ) return;
			tBotonera = new Tween(mcBotonera, "y", Strong.easeIn, mcBotonera.y, mcBotonera.y + 50, 0.5, true);
			tBotonera.addEventListener( TweenEvent.MOTION_FINISH, botoneraMoveFinish );
			new Tween(mcBotonera, "alpha", Strong.easeIn, 1, 0, 0.5, true);
		}
		
		private function botoneraMoveFinish(e:Event):void 
		{
			var n:Number = getPos();
			if( n < 25 ){
				mcBotonera.gotoAndStop(1);
				
			} else if ( n > 25 && n < 80 ){
				mcBotonera.gotoAndStop(2);
				
			} else if ( n > 80 ){
				mcBotonera.gotoAndStop(3);
			}
			if ( tBotonera ) {
				tBotonera.stop();
				tBotonera.removeEventListener( TweenEvent.MOTION_FINISH, botoneraMoveFinish );
			}
			tBotonera = new Tween(mcBotonera, "y", Strong.easeOut, mcBotonera.y, 0, 0.5, true);
			tBotonera.addEventListener( TweenEvent.MOTION_FINISH, removeBotoneraTween );
			new Tween(mcBotonera, "alpha", Strong.easeOut, 0, 1, 1, true);
		}
		
		private function removeBotoneraTween(e:Event):void 
		{
			tBotonera = null;
		}
		
	}
	
}