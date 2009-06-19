package com.dmotiko.opositor {
	
	import com.general.BaseMenu;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class OPPuntosVentaSection
	extends BaseClip {
		
		public var mcInfo:OPPuntosVentaInfo;
		public var mcButton:BaseClip;
		
		protected var mcMenu:OPPuntosVentaMenu;
						
		override protected function initClip():void {
			super.initClip();
			//OPSite.log( "OPPuntosVentaSection | initClip= " + mcButton);
			mcButton.addEventListener( MouseEvent.CLICK, set_section);
			
			//inicializo los clips
			mcMenu = new OPPuntosVentaMenu();
			mcMenu.x = 21;
			mcMenu.y = 143;
			mcMenu.rotation = -2.5;
			mcMenu.setView( OPPuntosVentaButton );
			this.addChild( mcMenu );
			
			mcMenu.addEventListener( Event.CHANGE, menu_changed);
			mcMenu.setData( new XML( "<root>" + OPSite.getApp().getStoresData().toXMLString() + "</root>" ) );
			
			OPSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
		}
		
		private function section_changed(e:Event):void 
		{
			if ( OPSite.getApp().getSection() == OPSite.PUNTOVENTA) {
				mcMenu.dispatchEvent( new Event( Event.COMPLETE ) );
			}
		}
			
		private function menu_changed(e:Event):void {
			var list:XMLList = OPSite.getApp().getStoresData();
			var stores:XML = new XML( "<root>" + list.toXMLString() + "</root>" );
			var theNode:XML;
			for each(var nodo:XML in stores.elements()){
				if(nodo.@id == (e.currentTarget as BaseMenu).getActiveButton().getData().data ) theNode = nodo;
			}
			mcInfo.setData( theNode );			
		}
		
		private function set_section(e:MouseEvent):void {
			//OPSite.log( "OPPuntosVentaSection | set_section= " + OPSite.getApp().getSection());
			if ( OPSite.getApp().getSection() != OPSite.PUNTOVENTA ) {
				OPSite.getApp().setSection( OPSite.PUNTOVENTA );
			}
		}
		
	}
	
}