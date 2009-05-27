package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class SeluTeensPuntosVentaSection
	extends BaseClip {
		private var btnBar:SeluTeensPuntosVentaMenu;
		public var mcInfo:SeluTeensPuntosVentaInfo;
						
		override protected function initClip():void {
			super.initClip();
					
			SeluTeensSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//inicializo los clips
			btnBar = new SeluTeensPuntosVentaMenu();
			addChild(btnBar);
			btnBar.x = 515;
			btnBar.y = 75;
			btnBar.setView( SeluTeensButtonResalte );
			btnBar.addEventListener( Event.CHANGE, menu_changed);
						
			btnBar.setData( new XML( "<root>" + SeluTeensSite.getApp().getStoresData().toXMLString() + "</root>" ) );
		}
		
		private function menu_changed(e:Event):void {
			var list:XMLList = SeluTeensSite.getApp().getStoresData();
			var stores:XML = new XML( "<root>" + list.toXMLString() + "</root>" );
			var theNode:XML;
			for each(var nodo:XML in stores.elements()){
				if(nodo.@id == btnBar.getActiveButton().getData().data ) theNode = nodo;
			}
			mcInfo.setData( theNode );			
		}
		
		private function section_changed(e:Event):void {
			if ( SeluTeensSite.getApp().getSection() == SeluTeensSite.PUNTOVENTA ) {
				btnBar.getButtons()[0].rollOver(undefined);
				btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			}
		}
		
	}
	
}