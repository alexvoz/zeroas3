package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
		
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiHome extends CampiTramaContent
	{
		
		public var mcBanner:MovieClip;
		
		public var mcFoto2:Sprite;
		public var mcFoto3:Sprite;
		private var tramaDerecha:CampiBitmapTrama;
		private var tramaDerecha2:CampiBitmapTrama;
		private var lastTrama:CampiBitmapTrama;
		protected var animationDerecha:TramaTransition;
		protected var animationDerecha2:TramaTransition;
		
		public function CampiHome() 
		{
			
			animationClass = TramaTransition7;
						
			super();
			
			removeChild(mcFoto2);
			removeChild(mcFoto3);
			tramaDerecha = new CampiBitmapTrama( mcFoto2, 5, 4 );
			tramaDerecha2 = new CampiBitmapTrama( mcFoto3, 5, 4 );
			
			animationDerecha = new animationClass( tramaDerecha );
			animationDerecha2 = new animationClass( tramaDerecha2, false );
			
			tramaDerecha.x = mcFoto2.x;
			tramaDerecha2.x = mcFoto3.x;
			addChild(tramaDerecha);
			
			lastTrama = tramaDerecha;
			
			mcBanner.y = -mcBanner.height - 30;
			removeChild(mcBanner);
			mcBanner.stop();
			
			var timerChange:Timer = new Timer( 10000 );
			timerChange.start();
			timerChange.addEventListener(TimerEvent.TIMER, do_change );
		}
		
		private function do_change(e:TimerEvent):void 
		{
			if ( lastTrama == tramaDerecha ) {
				lastTrama = tramaDerecha2;
				addChild(tramaDerecha2);
				addChild(mcBanner);
				animationDerecha2.show();
				animationDerecha.hide();
				mcBanner.gotoAndPlay("toB");
								
			} else {
				lastTrama = tramaDerecha;
				addChild(tramaDerecha);
				addChild(mcBanner);
				animationDerecha.show();
				animationDerecha2.hide();
				mcBanner.gotoAndPlay("toA");
				
			}
		}
		
		override public function hide():void {
			TweenLite.to( mcBanner, 0.8, { y: -mcBanner.height - 30, ease: Strong.easeInOut, onComplete: hide_trama } );
		}
		
		private function hide_trama():void
		{
			super.hide();
		}
		
		override protected function animation_hide_end(e:Event):void 
		{
			super.hide_end();
		}
		
		override protected function animation_show_end(e:Event):void 
		{
			super.animation_show_end(e);
			removeChild( trama );
			addChild( mcFoto );
			addChild(mcBanner);
			TweenLite.to( mcBanner, 0.8, { y: tramaDerecha.getChildByName("r2c1").y, delay: 0.2, ease: Strong.easeInOut } );
		}
		
	}

}