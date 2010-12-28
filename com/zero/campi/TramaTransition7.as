package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
		
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition7 extends TramaTransition
	{
		public function TramaTransition7( trama:CampiBitmapTrama, autoplay:Boolean=true ) 
		{
			super( trama, autoplay );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				modulo.alpha = 0;
				modulo.visible = false;
				var t = TweenLite.to( modulo, 0.5, { alpha: 1, delay: Math.random(), ease: Strong.easeOut, onStart: init_modulo, onStartParams: [ modulo ] } );
				tweens[i] = t;
			}
			bindTweens();
		}
		
		private function init_modulo(modulo):void
		{
			modulo.visible = true;
		}
		
		
	}

}