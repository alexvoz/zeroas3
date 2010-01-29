package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
		
	public class MediasSelector
	extends SectionSelector {
			
		override protected function initClip():void {
			super.initClip();
			nSpace = 10;
			setView( SectionBtn );
			var aSections:Array = new Array();
			aSections.push( { img: caratulaMediasBebes, initX: -110, endX: 0, value: Site.MEDIAS_BEBES } );
			aSections.push( { img: caratulaMediasNinos, initX: -100, endX: 0, value: Site.MEDIAS_NENES } );
			aSections.push( { img: caratulaMediasJuveniles, initX: -83, endX: 0, value: Site.MEDIAS_JUVENILES } );
			aSections.push( { img: caratulaMediasInBlack, initX: -112, endX: 0, value: Site.MEDIAS_INBLACK } );
			aSections.push( { img: caratulaMediasHombre, initX: -157, endX: 0, value: Site.MEDIAS_HOMBRE} );
			aSections.push( { img: caratulaMediasMujer, initX: -104, endX: 0, value: Site.MEDIAS_MUJER } );
			aSections.push( { img: caratulaMediasBucaneras, initX: -104, endX: 0, value: Site.MEDIAS_BUCANERAS } );
			aSections.push( { img: caratulaMediasCancan, initX: -104, endX: 0, value: Site.MEDIAS_CANCAN } );
			aSections.push( { img: caratulaMediasColegial, initX: -104, endX: 0, value: Site.MEDIAS_COLEGIAL } );
			
			
			setData( aSections );
		}		
		
	}
	
}