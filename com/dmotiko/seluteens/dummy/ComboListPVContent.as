package com.dmotiko.seluteens.dummy {
	import com.dmotiko.seluteens.STSite;
	import com.general.*;
	import com.gui.ScrollerMovie;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class ComboListPVContent
	extends BaseClip {
				
		public var mcProximamente:ComboItemPV;
		public var mcExclusivos:ComboItemPV;
		public var mcCapitalFederal:ComboItemPV;
		public var mcGbaNorte:ComboItemPV;
		public var mcGbaSur:ComboItemPV;
		public var mcGbaOeste:ComboItemPV;
		public var mcBuenosAires:ComboItemPV;
		public var mcEntreRios:ComboItemPV;
		public var mcCorrientes:ComboItemPV;
		public var mcMisiones:ComboItemPV;
		public var mcFormosa:ComboItemPV;
		public var mcChaco:ComboItemPV;
		public var mcSantaFe:ComboItemPV;
		public var mcCordoba:ComboItemPV;
		public var mcSanLuis:ComboItemPV;
		public var mcMendoza:ComboItemPV;
		public var mcSanJuan:ComboItemPV;
		public var mcLaRioja:ComboItemPV;
		public var mcTucuman:ComboItemPV;
		public var mcSalta:ComboItemPV;
		public var mcJujuy:ComboItemPV;
				
		override public function childLoaded( e:Event ):void {
			if ( e.currentTarget is ComboItemPV ) {
				var child:ComboItemPV = e.currentTarget as ComboItemPV;
				child.alpha = 1;
				
				switch(child) {
					case mcProximamente:
					child.setData( { label: "Proximamente", id: "PROXIMAMENTE" } );
					break;
					
					case mcExclusivos:
					child.setData( { label: "Locales Exclusivos", id: "EXCLUSIVOS" } );
					break;
					
					case mcCapitalFederal:
					child.setData( { label: "Capital Federal", id: "CAPITAL FEDERAL" } );
					break;
					
					case mcGbaNorte:
					child.setData( { label: "Gba Norte", id: "GBA NORTE" } );
					break;
					
					case mcGbaSur:
					child.setData( { label: "Gba Sur", id: "GBA SUR" } );
					break;
					
					case mcGbaOeste:
					child.setData( { label: "Gba Oeste", id: "GBA OESTE" } );
					break;
					
					case mcBuenosAires:
					child.setData( { label: "Buenos Aires", id: "BUENOS AIRES" } );
					break;
					
					case mcEntreRios:
					child.setData( { label: "Entre Ríos", id: "ENTRE RIOS" } );
					break;
					
					case mcCorrientes:
					child.setData( { label: "Corrientes", id: "CORRIENTES" } );
					break;
					
					case mcMisiones:
					child.setData( { label: "Misiones", id: "MISIONES" } );
					break;
					
					case mcFormosa:
					child.setData( { label: "Formosa", id: "FORMOSA" } );
					break;
					
					case mcChaco:
					child.setData( { label: "Chaco", id: "CHACO" } );
					break;
					
					case mcSantaFe:
					child.setData( { label: "Santa Fe", id: "SANTA FE" } );
					break;
					
					case mcCordoba:
					child.setData( { label: "Cordoba", id: "CORDOBA" } );
					break;
					
					case mcSanLuis:
					child.setData( { label: "San Luis", id: "SAN LUIS" } );
					break;
					
					case mcMendoza:
					child.setData( { label: "Mendoza", id: "MENDOZA" } );
					break;
					
					case mcSanJuan:
					child.setData( { label: "San Juan", id: "SAN JUAN" } );
					break;
					
					case mcLaRioja:
					child.setData( { label: "La Rioja", id: "LA RIOJA" } );
					break;
					
					case mcTucuman:
					child.setData( { label: "Tucumán", id: "TUCUMAN" } );
					break;
					
					case mcSalta:
					child.setData( { label: "Salta", id: "SALTA" } );
					break;
					
					case mcJujuy:
					child.setData( { label: "Jujuy", id: "JUJUY" } );
					break;
				}
				
				child.addEventListener( MouseEvent.CLICK, child_changed );
			}
		}
		
		protected function child_changed(e:MouseEvent):void {
			this.setData( (e.currentTarget as ComboItemPV).getData() );
			dispatchEvent( new Event( Event.CHANGE ) ); 
		}
		
		
		
	}
	
}