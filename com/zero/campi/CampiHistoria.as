package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.text.TextField;
	
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiHistoria extends CampiTramaContent
	{
		
		public var texto:TextField;
		private var t:TweenLite;
		
		public function CampiHistoria() 
		{
			animationClass = TramaTransition7;
			
			super();
			removeChild( texto );
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
			t = TweenLite.from( texto, 0.8, { alpha: 0, y: texto.y + 30, ease: Strong.easeInOut, onReverseComplete: hide_trama } );
			
		}
		
	}

}