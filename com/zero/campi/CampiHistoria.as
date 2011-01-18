package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiHistoria extends CampiTramaContent
	{
		
		public var texto:TextField;
		public var mcTitle:Sprite;
		private var t:TweenLite;
		private var t2:TweenLite;
		
		public function CampiHistoria() 
		{
			animationClass = TramaTransition7;
			
			super();
			removeChild( texto );
			removeChild( mcTitle );
			//trace(this);
		}		
		
		override public function hide():void {
			t.reverse();
			//trace(this);
		}
		
		private function hide_trama():void
		{
			//trace("CampiHistoria hide_trama");
			super.hide()
		}
	
		override protected function animation_show_end(e:Event):void 
		{
			super.animation_show_end(e);
			addChild(texto);
			addChild(mcTitle);
			t = TweenLite.from( texto, 0.8, { alpha: 0, y: texto.y + 30, ease: Strong.easeInOut, onReverseComplete: hide_trama } );
			t = TweenLite.from( mcTitle, 0.8, { alpha: 0, x: mcTitle.x - 10, ease: Strong.easeInOut, delay: 0.5 } );
		}
		
	}

}