package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
		
	public class RopaSelector
	extends SectionSelector {
			
		override protected function initClip():void {
			super.initClip();
			nSpace = 10;
			setView( SectionBtn );
			var aSections:Array = new Array();
			aSections.push( { img: caratulaPijamaNene, initX: -54, endX: 0, value: Site.ROPA_PIJAMA_NENE } );
			aSections.push( { img: caratulaPijamaNena, initX: -173, endX: 0, value: Site.ROPA_PIJAMA_NENA } );
			aSections.push( { img: caratulaPijamaTeens, initX: -65, endX: 0, value: Site.ROPA_PIJAMA_TEENS } );
			aSections.push( { img: caratulaRopIntNene, initX: -65, endX: 0, value: Site.ROPA_INT_NENE } );
			aSections.push( { img: caratulaRopIntNena, initX: -44, endX: 0, value: Site.ROPA_INT_NENA } );
			aSections.push( { img: caratulaRopIntTeens, initX: -75, endX: 0, value: Site.ROPA_INT_TEENS } );
			setData( aSections );
		}		
		
	}
	
}