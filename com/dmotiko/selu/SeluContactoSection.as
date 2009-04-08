package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;	
	import flash.text.*;	
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class SeluContactoSection
	extends BaseClip {
		private var btnBar:BaseMenu;
		private var sArea:String;
								
		override protected function initClip():void {
			super.initClip();
			trace("SeluContactoSection initClip "+this);
			
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//recolecto los movieclips que están en el fla
						
			//inicializo los clips
			btnBar = new BaseMenu();
			addChild(btnBar);
			btnBar.x = 66;
			btnBar.y = 285;
			btnBar.rotation = -3;
			btnBar.setView( SeluButtonResalte );
			btnBar.addEventListener( Event.CHANGE, menu_changed);
			btnBar.setSpace( -10 );
			
			var aData:Array = new Array();
			aData.push( { label: "Administracion", data: "administracion" } );
			aData.push( { label: "Ventas", data: "ventas" } );
			aData.push( { label: "Clientes", data: "clientes" } );
			aData.push( { label: "Exportaciones", data: "exportaciones" } );
			aData.push( { label: "Publicidad", data: "publicidad" } );
			
			btnBar.setData( aData );
		}
		
		private function menu_changed(e:Event):void {
			sArea = btnBar.getActiveButton().getData().data;
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.CONTACTO ) {
				btnBar.getButtons()[0].rollOver(undefined);
				btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			}
		}
		
	}
	
}