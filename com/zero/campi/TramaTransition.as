package com.zero.campi 
{
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
	public class TramaTransition extends EventDispatcher
	{
		public static const SHOW_END:String = "show_end";
		public static const HIDE_END:String = "hide_end";
		
		protected var tweens:Vector.<TweenLite>;
		protected var trama:CampiBitmapTrama;
		protected var nHidden:uint;
		protected var nShow:uint;
		
		public function TramaTransition( trama:CampiBitmapTrama, autoplay:Boolean=true ) 
		{
			tweens = new Vector.<TweenLite>(trama.numChildren);
			this.trama = trama;
			if ( autoplay ) {
				this.show();	
			}
		}
		
		public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				var nX:int = modulo.x;
				modulo.x = 0;
				modulo.alpha = 0;
				modulo.rotationY = 0;
				modulo.scaleX = modulo.scaleY = 1.5;
				var t = TweenLite.to( modulo, Math.random(), { rotationY: 360, x: nX, alpha: 1, scaleX: 1, scaleY: 1, delay: Math.random(), ease: Strong.easeOut } );
				tweens[i] = t;
			}
			bindTweens();
		}
		
		protected function bindTweens():void
		{
			nShow = 0;
			tweens = tweens.sort( sortOnDelay ).reverse();
			tweens.forEach( function( item:TweenLite, index:int, vector  ) { 
				item.vars.onComplete = show_end; 
				item.vars.onReverseComplete = hide_end;  } 
			);
		}
		
		public function hide():void {
			nHidden = 0;
			tweens.forEach( function( item:TweenLite, index:int, vector  ) { 
				TweenLite.delayedCall( item.vars.delay, function() { item.reverse(); } ) 
			});
		}
		
		public function getTrama():CampiBitmapTrama {
			return this.trama;
		}
		
		protected function sortOnDelay(a, b):Number {
			if(a.vars.delay > a.vars.delay ) {
				return 1;
			} else if(a.vars.delay < b.vars.delay) {
				return -1;
			} else  {
				return 0;
			}
		}
		
		protected function show_end():void {
			nShow++;
			if ( nShow == tweens.length ) {
				this.dispatchEvent( new Event( SHOW_END ) );
			}
			
		}
		
		protected function hide_end():void {
			nHidden++;
			if ( nHidden == tweens.length ) {
				this.dispatchEvent( new Event( HIDE_END ) );
			}
		}
		
	}

}