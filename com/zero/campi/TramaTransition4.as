package com.zero.campi 
{
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition4 extends TramaTransition
	{
		public function TramaTransition4( trama:CampiBitmapTrama, autoplay:Boolean ) 
		{
			super( trama, autoplay );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				modulo.scaleX = 0.8;
				modulo.scaleY = 0.8;
				modulo.visible = false;
				var t = TweenLite.to( modulo, Math.random(), { scaleX: 1, scaleY: 1, delay: Math.random(), ease: Elastic.easeOut, onStart: init_modulo, onStartParams: [ modulo ] } );
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