package com.dmotiko.opositor {
	
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
						
		override protected function initClip():void {
			super.initClip();
			OPSite.log( "OPPuntosVentaSection | initClip= " + mcButton);
			mcButton.addEventListener( MouseEvent.CLICK, set_section);
			//inicializo los clips
		}
		
		private function menu_changed(e:Event):void {
			var list:XMLList = OPSite.getApp().getStoresData();
			var stores:XML = new XML( "<root>" + list.toXMLString() + "</root>" );
			var theNode:XML;
			for each(var nodo:XML in stores.elements()){
				if(nodo.@id == e.currentTarget.getData().id ) theNode = nodo;
			}
			mcInfo.setData( theNode );			
		}
		
		private function set_section(e:MouseEvent):void {
			OPSite.log( "OPPuntosVentaSection | set_section= " + OPSite.getApp().getSection());
			if ( OPSite.getApp().getSection() != OPSite.PUNTOVENTA ) {
				OPSite.getApp().setSection( OPSite.PUNTOVENTA );
			}
		}
		
	}
	
}