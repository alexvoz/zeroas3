package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class SectionThumbs
	extends BaseClip {
				
				
		override protected function initClip():void {
			
			if (!Site.getApp()) return;
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed );
		}
		
		private function section_changed(e:Event):void {
			var sSection:String = Site.getApp().getSection();
					
			var nFrame:int = 1;
			var sContent:String;
			if ( sSection.indexOf(Site.MEDIAS) > -1 && sSection != Site.MEDIAS) {
				switch( sSection ) {
					case Site.MEDIAS_NENES:
					nFrame = 2;
					break;
					
				}
				
				parent.parent.setChildIndex( parent, parent.parent.numChildren -1);
				
				gotoAndStop(1);
				gotoAndStop(nFrame);
				addEventListener( Event.ENTER_FRAME, find_btns);
				
				if (sContent) {
					mcLoader.gotoAndPlay(2);
					contentLoader.contentLoaderInfo.addEventListener( Event.INIT, content_loaded );
					contentLoader.load( new URLRequest( sContent ) );
				}			
				
			} else {
				Site.log("MediasTemplate | yendo al frame 1");
				gotoAndStop(1);
			}
			
			
		}
		
		private function content_loaded(e:Event):void 
		{
			mcLoader.gotoAndStop(1);
		}
		
		private function find_btns(e:Event):void {
			Site.log("MediasTemplate | findBtns= ");
			Site.log("MediasTemplate | mcNinos= "+mcNinos+" / "+mcNinos.hasEventListener(MouseEvent.CLICK));
			if ( (mcNinos || mcBebe) && ( !mcNinos.hasEventListener(MouseEvent.CLICK) || !mcBebe.hasEventListener(MouseEvent.CLICK)) ) {
				removeEventListener( Event.ENTER_FRAME, find_btns);
				bindListeners();
			}
		}
		
		private function bindListeners():void {
			Site.log("MediasTemplate | bindListeners= "+mcNinos);
			
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
			Site.log("MediasTemplate | set_section");
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