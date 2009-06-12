package com.dmotiko.opositor {
	
	import com.dmotiko.opositor.dummy.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class OPPuntosVentaSection
	extends BaseClip {
		
		public var mcInfo:OPPuntosVentaInfo;
		public var mcCombo:ComboPV;
						
		override protected function initClip():void {
			super.initClip();
			OPSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//inicializo los clips
			mcCombo.addEventListener( Event.CHANGE, menu_changed );
			mcCombo.setData( { label: "Locales Exclusivos", id: "EXCLUSIVOS" } );
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
		
		private function section_changed(e:Event):void {
			if ( OPSite.getApp().getSection() == OPSite.PUNTOVENTA ) {
				
			}
		}
		
	}
	
}