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
			aSections.push( { img: caratulaPijamaNene, initX: -12, endX: 0, value: Site.ROPA_PIJAMA_NENE } );
			aSections.push( { img: caratulaPijamaNena, initX: -111, endX: 0, value: Site.ROPA_PIJAMA_NENA } );
			aSections.push( { img: caratulaPijamaTeens, initX: -79, endX: 0, value: Site.ROPA_PIJAMA_TEENS } );
			aSections.push( { img: caratulaRopIntNene, initX: -127, endX: 0, value: Site.ROPA_INT_NENE } );
			aSections.push( { img: caratulaRopIntNena, initX: -8, endX: 0, value: Site.ROPA_INT_NENA } );
			aSections.push( { img: caratulaRopIntTeens, initX: -108, endX: 0, value: Site.ROPA_INT_TEENS } );
			aSections.push( { img: caratulaRemeraNena, initX: -100, endX: 0, value: Site.ROPA_REMERA_NENE } );
			aSections.push( { img: caratulaRemeraNene, initX: -78, endX: 0, value: Site.ROPA_REMERA_NENA } );
			setData( aSections );
		}		
		
	}
	
}