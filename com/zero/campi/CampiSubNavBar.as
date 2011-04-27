package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiSubNavBar extends Sprite
	{
		
		private var last:CampiButton;
		
		public function CampiSubNavBar() 
		{
			var aLabels:Array = [ "características técnicas", "preguntas frecuentes", "distribución", "contacto", "área reservada" ];
			var aLinks:Array = [ CampiSite.CARACTERISTICAS, CampiSite.FAQ, CampiSite.DISTRIBUCION, CampiSite.CONTACTO, CampiSite.RESERVADO ];
						
			var nY:int = 0;
			var nSpace:int = 2;
			for (var i:int = 0; i < aLabels.length; i++) 
			{
				var btn:CampiButton = new CampiSubButton(aLabels[i], aLinks[i]);
				btn.alpha = 0;
				btn.y = nY;
				addChild(btn);
				TweenMax.to( btn, 1, { alpha: 1, delay: i * 0.3, ease: Linear.easeNone } );
				nY += btn.height + nSpace;
			}
		}
		
	}

}