package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
		
	public class SeluPuntosVentaSection
	extends BaseClip {
						
		override protected function initClip():void {
			super.initClip();
			trace("SeluPuntosVentaSection initClip "+this);
			
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//recolecto los movieclips que están en el fla
						
			//inicializo los clips
			var btnBar:SeluPuntosVentaMenu = new SeluPuntosVentaMenu();
			addChild(btnBar);
			btnBar.x = 515;
			btnBar.y = 75;
			btnBar.setView( SeluButtonResalte );
			
			var aData:Array = new Array();
			aData.push( { label: "Exclusivos", data: "EXCLUSIVOS" } );
			aData.push( { space: true } );
			aData.push( { label: "Capital Federal", data: "EXCLUSIVOS" } );
			aData.push( { label: "Zona Sur", data: "EXCLUSIVOS" } );
			
			btnBar.setData( aData );
			//var btn:SeluButtonResalte = new SeluButtonResalte();
			//btn.setData( { label: "Pedazo de puto", data: "silvio" } );
			//btnBar.addChild( btn );
			
		}
		
		private function section_changed(e:Event):void {
			
		}
		
	}
	
}