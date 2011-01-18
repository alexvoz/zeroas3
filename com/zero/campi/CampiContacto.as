package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.zero.campi.form.CampiForm;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiContacto extends CampiTramaContent 
	{
		
		public var mcTitle:Sprite;
		public var mcDatos:Sprite;
		
		private var form:CampiForm;
		
		private var t:TweenLite;
		private var t2:TweenLite;
		private var t3:TweenLite;
		
		public function CampiContacto() 
		{
			animationClass = TramaTransition;
			
			super();
			removeChild( mcTitle );
			removeChild( mcDatos );
			
			form = new CampiForm();
			form.x = 520;
			form.y = 127;
		}
		override public function hide():void {
			t2.reverse();
		}
		private function hide_title():void
		{
			t.reverse();
			t3.reverse();
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
			
			addChild( form );
			t2 = TweenLite.from( form, 0.8, { alpha: 0, x: form.x - 10, ease: Strong.easeInOut, onReverseComplete: hide_title, delay: 0.5 } );
			
			addChild( mcDatos );
			t3 = TweenLite.from( mcDatos, 0.8, { alpha: 0, y: mcDatos.x - 10, ease: Strong.easeInOut, delay: 0.5 } );
			
		}
		
	}

}