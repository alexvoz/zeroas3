package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class SeluPuntosVentaSection
	extends BaseClip {
		private var btnBar:SeluPuntosVentaMenu;
		private var info:SeluPuntosVentaInfo;
						
		override protected function initClip():void {
			super.initClip();
			trace("SeluPuntosVentaSection initClip "+this);
			
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//recolecto los movieclips que están en el fla
			info = getChildByName("mcInfo") as SeluPuntosVentaInfo;
			
			//inicializo los clips
			btnBar = new SeluPuntosVentaMenu();
			addChild(btnBar);
			btnBar.x = 515;
			btnBar.y = 75;
			btnBar.setView( SeluButtonResalte );
			btnBar.addEventListener( Event.CHANGE, menu_changed);
						
			btnBar.setData( new XML( "<root>" + SeluSite.getApp().getStoresData().toXMLString() + "</root>" ) );
		}
		
		private function menu_changed(e:Event):void {
			var list:XMLList = SeluSite.getApp().getStoresData();
			var stores:XML = new XML( "<root>" + list.toXMLString() + "</root>" );
			var theNode:XML;
			for each(var nodo:XML in stores.elements()){
				if(nodo.@id == btnBar.getActiveButton().getData().data ) theNode = nodo;
			}
			info.setData( theNode );			
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.PUNTOVENTA ) {
				btnBar.getButtons()[0].rollOver(undefined);
				btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			}
		}
		
	}
	
}