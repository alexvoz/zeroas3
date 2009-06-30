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
			aSections.push( { img: caratulaMediasNinos, initX: -80, endX: 0, value: Site.MEDIAS_NENES } );
			aSections.push( { img: caratulaMediasBebes, initX: -12, endX: 0, value: Site.MEDIAS_BEBES } );
			aSections.push( { img: caratulaMediasJuveniles, initX: -163, endX: 0, value: Site.MEDIAS_JUVENILES } );
			aSections.push( { img: caratulaMediasBucaneras, initX: -26, endX: 0, value: Site.MEDIAS_BUCANERAS } );
			aSections.push( { img: caratulaMediasCancan, initX: -93, endX: 0, value: Site.MEDIAS_CANCAN } );
			aSections.push( { img: caratulaMediasColegial, initX: -83, endX: 0, value: Site.MEDIAS_COLEGIAL } );
			aSections.push( { img: caratulaMediasHombre, initX: -75, endX: 0, value: Site.MEDIAS_HOMBRE} );
			aSections.push( { img: caratulaMediasMujer, initX: -32, endX: 0, value: Site.MEDIAS_MUJER } );
			setData( aSections );
		}		
		
	}
	
}