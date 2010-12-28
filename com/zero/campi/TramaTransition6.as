package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
		
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition6 extends TramaTransition
	{
		public function TramaTransition6( trama:CampiBitmapTrama ) 
		{
			super( trama );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				modulo.rotationY = 0;
				modulo.rotationZ = 0;
				modulo.visible = false;
				var t = TweenLite.to( modulo, Math.random(), { rotationY: 360, rotationZ: 360, delay: Math.random(), ease: Strong.easeOut, onStart: init_modulo, onStartParams: [ modulo ] } );
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