package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.zero.campi.distribucion.ZonasList;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiDistribucion extends CampiTramaContent
	{
		public var mcTitle:Sprite;
		public var mcTexto:Sprite;
		
		private var t:TweenLite;
		private var t2:TweenLite;
		
		public function CampiDistribucion() 
		{
			animationClass = TramaTransition;
			
			super();
					
			removeChild( mcTitle );
			//removeChild( mcTexto );
			mcTexto = new ZonasList();
			mcTexto.x = 480;
			mcTexto.y = 66;
		}
		override public function hide():void {
			t2.reverse();
		}
		
		private function hide_title():void
		{
			t.reverse();
		}
		private function hide_trama():void
		{
			super.hide();
		}
		override protected function animation_show_end(e:Event):void 
		{
			super.animation_show_end(e);
			
			addChild( mcTitle );
			t = TweenLite.from( mcTitle, 0.8, { alpha: 0, y: mcTitle.y + 30, ease: Strong.easeInOut, onReverseComplete: hide_trama } );
			
			addChild( mcTexto );
			t2 = TweenLite.from( mcTexto, 0.8, { alpha: 0, x: mcTexto.x - 10, ease: Strong.easeInOut, onReverseComplete: hide_title, delay: 0.5 } );
			
		}
	}

}