package com.zero.campi 
{
import com.greensock.easing.Back;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
		
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition2 extends TramaTransition
	{
		public function TramaTransition2( trama:CampiBitmapTrama, autoplay:Boolean=true ) 
		{
			super( trama, autoplay );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				var nX:int = modulo.x;
				//modulo.x -= modulo.width;
				modulo.rotation = -15;
				//modulo.rotationZ = 0;
				modulo.visible = false;
				var t = TweenLite.to( modulo, Math.random(), { rotation: 0, x: nX, delay: Math.random(), ease: Strong.easeOut, onStart: init_modulo, onStartParams: [ modulo ] } );
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