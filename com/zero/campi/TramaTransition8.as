package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
		
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition8 extends TramaTransition
	{
		public function TramaTransition8( trama:CampiBitmapTrama ) 
		{
			super( trama );
			trace( "new TramaTransition8" );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				var nX:int = modulo.x;
				var nY:int = modulo.y;
				modulo.x = trama.getChildAt( Math.floor( Math.random() * trama.numChildren ) ).x;
				modulo.y = trama.getChildAt( Math.floor( Math.random() * trama.numChildren ) ).y;
				modulo.alpha = 0;
				modulo.visible = false;
				var t = TweenLite.to( modulo, 0.5, { x: nX, y: nY, alpha: 1, delay: Math.random(), ease: Strong.easeIn, onStart: init_modulo, onStartParams: [ modulo ] } );
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