package com.zero.campi 
{
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition5 extends TramaTransition
	{
		public function TramaTransition5( trama:CampiBitmapTrama, autoplay:Boolean=true ) 
		{
			super( trama, autoplay );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				var nY:int = modulo.y;
				modulo.y -= 15;
				modulo.alpha = 0;
				modulo.visible = false;
				var t = TweenLite.to( modulo, 0.6, { y: nY, alpha: 1, delay: Math.random(), ease: Elastic.easeOut, onStart: init_modulo, onStartParams: [ modulo ] } );
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