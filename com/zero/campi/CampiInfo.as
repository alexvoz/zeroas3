package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.zero.campi.distribucion.ZonasList;
	import com.zero.campi.info.InfoList;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiInfo extends CampiTramaContent
	{
		public var mcTitle:Sprite;
		public var mcEncolado:Sprite;
		public var mcExpoColor:Sprite;
		public var mcEntrega:Sprite;
		public var mcDescargas:Sprite;
		public var mcTexto:Sprite;
				
		private var t:TweenLite;
		private var t2:TweenLite;
		private var t3:TweenLite;
		private var t4:TweenLite;
		private var t5:TweenLite;
		private var t6:TweenLite;
		
		public function CampiInfo() 
		{
			animationClass = TramaTransition;
			
			super();
					
			DisplayUtil.massiveRemove( [ mcTitle, mcEncolado, mcEntrega, mcExpoColor, mcTexto ] );
			
			mcDescargas = new InfoList();
			mcDescargas.x = 480;
			mcDescargas.y = 250;
		}
		override public function hide():void {
			t2.reverse();
			t3.reverse();
			t4.reverse();
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
			
			DisplayUtil.addChildren( this, [ mcTitle, mcEncolado, mcEntrega, mcExpoColor, mcTexto, mcDescargas ] );
			
			t = TweenLite.from( mcTitle, 0.8, { alpha: 0, y: mcTitle.y + 30, ease: Strong.easeInOut, onReverseComplete: hide_trama } );
			t2 = TweenLite.from( mcEncolado, 0.8, { alpha: 0, x: mcEncolado.x - 10, ease: Strong.easeInOut, onReverseComplete: hide_title, delay: 0.5 } );
			t3 = TweenLite.from( mcExpoColor, 0.8, { alpha: 0, x: mcExpoColor.x - 10, ease: Strong.easeInOut, delay: 0.8 } );
			t4 = TweenLite.from( mcEntrega, 0.8, { alpha: 0, x: mcEntrega.x - 10, ease: Strong.easeInOut, delay: 1 } );
			t5 = TweenLite.from( mcTexto, 0.8, { alpha: 0, x: mcTexto.x - 10, ease: Strong.easeInOut, delay: 1.2 } );
			t6 = TweenLite.from( mcDescargas, 0.8, { alpha: 0, x: mcDescargas.x - 10, ease: Strong.easeInOut, delay: 1.4 } );
			
		}
	}

}