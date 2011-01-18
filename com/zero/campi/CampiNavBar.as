package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiNavBar extends Sprite
	{
		
		private var last:CampiButton;
		
		public function CampiNavBar() 
		{
			var aLabels:Array = [ "Nuestra Empresa", "Productos", "Distribucion", "Contacto" ];
			var aLinks:Array = [ CampiSite.NOSOTROS, CampiSite.CATALOGO, CampiSite.DISTRIBUCION, CampiSite.CONTACTO ];
			var nY:int = 0;
			var nSpace:int = 10;
			for (var i:int = 0; i < aLabels.length; i++) 
			{
				var btn:CampiButton = new CampiButton(aLabels[i], aLinks[i]);
				btn.alpha = 0;
				btn.y = nY;
				addChild(btn);
				TweenMax.to( btn, 1, { alpha: 1, delay: i * 0.3, ease: Linear.easeNone } );
				nY += btn.height + nSpace;
			}
			this.addEventListener(MouseEvent.CLICK, active_button );
			
		}
		
		private function active_button(e:MouseEvent):void 
		{
			if ( last ) last.active = false;
			last = e.target as CampiButton;
			last.active = true;
		}
				
	}

}