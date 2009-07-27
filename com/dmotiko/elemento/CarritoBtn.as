package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.text.*;
	
	public class CarritoBtn
	extends BaseClip {
		
		public var brilloTop:Sprite;
		public var brilloBottom:Sprite;
		
		private var originalBounds:Rectangle;
						
		override protected function initClip():void {
			super.initClip();			
			buttonMode = true;
			addEventListener( MouseEvent.CLICK, change_section);
			addEventListener( MouseEvent.ROLL_OVER, roll_over);
			
		}
		
		private function roll_over(e:MouseEvent):void {
			if( !originalBounds ) originalBounds = this.getBounds(parent);
			registerTween("scaleY", new Tween( this, "scaleY", Regular.easeOut, 1, 0.85, 0.3, true), false, true, true );
			registerTween("brilloFade", new Tween( brilloTop, "alpha", Regular.easeOut, brilloTop.alpha, 0.85, 0.3, true), false, true, true);
		}
		
		private function change_section(e:MouseEvent):void {
			//Site.getApp().setSection( Site.CARRITO );
			var btns:Array = Site.getApp().getBar().getButtons();
			for each( var btn:NavBarBtn in btns) {
				if ( btn.getData().value == Site.CARRITO ) {
					btn.rollOver(undefined);
					Site.getApp().getBar().setActiveButton( btn );
					Site.getApp().setSection( Site.CARRITO );
					break;
				}
			}
		}
		
		override protected function tweenChanged( key:String, tween:Tween ):void {
			switch(key) {
				case "scaleY":
				this.scaleX = this.scaleY;
				this.x = originalBounds.left + (originalBounds.width - this.width) / 2;
				this.y = originalBounds.top + (originalBounds.height - this.height) / 2;
				break;
				
				case "brilloFade":
				brilloBottom.alpha = brilloTop.alpha;				
				break;
			}		
			
		}
		override protected function tweenFinished( key:String, tween:Tween ):void {
			tween.yoyo();
			//tween.addEventListener( TweenEvent.MOTION_FINISH, normal_state);			
		}
		
		private function normal_state(e:TweenEvent):void {
			mouseEnabled = true;
		}
		
	}
	
}