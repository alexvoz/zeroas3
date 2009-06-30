package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	
	public class MediasTemplate
	extends BaseClip {
		
		public var mcNinos:SimpleButton;
		public var mcBebe:SimpleButton;
		public var mcBucanera:SimpleButton;
		public var mcJuvenil:SimpleButton;
		public var mcCanCan:SimpleButton;
		public var mcColegial:SimpleButton;
		public var mcHombre:SimpleButton;
		public var mcDama:SimpleButton;
		
		override protected function initClip():void {
			//Site.log( "MediasTemplate | initClip | "+Site.getApp());
					
			if (!Site.getApp()) return;
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed );
		}
		
		private function section_changed(e:Event):void {
			var sSection:String = Site.getApp().getSection();
			
			Site.log( "MediasTemplate | section_changed= " + sSection);
			var nFrame:int = 1;
			if ( sSection.indexOf(Site.MEDIAS) > -1 && sSection != Site.MEDIAS) {
				switch( sSection ) {
					case Site.MEDIAS_NENES:
					nFrame = 2;
					break;
					
					case Site.MEDIAS_BEBES:
					nFrame = 3;
					break;
					
					case Site.MEDIAS_JUVENILES:
					nFrame = 4;
					break;
					
					case Site.MEDIAS_BUCANERAS:
					nFrame = 5;
					break;
					
					case Site.MEDIAS_CANCAN:
					nFrame = 6;
					break;
					
					case Site.MEDIAS_COLEGIAL:
					nFrame = 7;
					break;
					
					case Site.MEDIAS_HOMBRE:
					nFrame = 8;
					break;
					
					case Site.MEDIAS_MUJER:
					nFrame = 9;
					break;
				}
				
				parent.setChildIndex( this, parent.numChildren -1);
				
			} else {
				nFrame = 1;
			}
			gotoAndStop(1);
			gotoAndStop(nFrame);
			bindListeners();
		}
		
		private function bindListeners():void {
			if (mcNinos) mcNinos.addEventListener( MouseEvent.CLICK, set_section);
			if (mcBebe) mcBebe.addEventListener( MouseEvent.CLICK, set_section);
			if (mcBucanera) mcBucanera.addEventListener( MouseEvent.CLICK, set_section);
			if (mcJuvenil) mcJuvenil.addEventListener( MouseEvent.CLICK, set_section);
			if (mcCanCan) mcCanCan.addEventListener( MouseEvent.CLICK, set_section);
			if (mcColegial) mcColegial.addEventListener( MouseEvent.CLICK, set_section);
			if (mcHombre) mcHombre.addEventListener( MouseEvent.CLICK, set_section);
			if (mcDama) mcDama.addEventListener( MouseEvent.CLICK, set_section);
		}
		
		private function set_section(e:MouseEvent):void {
			var sSection:String;
			switch( e.currentTarget ) {
				case mcNinos:
				sSection = Site.MEDIAS_NENES;
				break;
				
				case mcBebe:
				sSection = Site.MEDIAS_BEBES;
				break;
				
				case mcBucanera:
				sSection = Site.MEDIAS_BUCANERAS;
				break;
				
				case mcJuvenil:
				sSection = Site.MEDIAS_JUVENILES;
				break;
				
				case mcCanCan:
				sSection = Site.MEDIAS_CANCAN;
				break;
				
				case mcColegial:
				sSection = Site.MEDIAS_COLEGIAL;
				break;
				
				case mcHombre:
				sSection = Site.MEDIAS_HOMBRE;
				break;
				
				case mcDama:
				sSection = Site.MEDIAS_MUJER;
				break;
			}
			Site.getApp().setSection( sSection );
		}
		
	}
	
}