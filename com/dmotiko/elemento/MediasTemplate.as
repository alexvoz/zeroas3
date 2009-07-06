package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
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
		
		public var mcLoader:MovieClip;
		
		private var contentLoader:Loader;
		
		override protected function initClip():void {
			Site.log( "MediasTemplate | initClip | "+Site.getApp());
			
			contentLoader = new Loader();
			addChild(contentLoader);
			
			if (!Site.getApp()) return;
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed );
		}
		
		private function section_changed(e:Event):void {
			var sSection:String = Site.getApp().getSection();
			Site.log( "MediasTemplate | section_changed= " + sSection);
			
			var nFrame:int = 1;
			var sContent:String;
			if ( sSection.indexOf(Site.MEDIAS) > -1 && sSection != Site.MEDIAS) {
				switch( sSection ) {
					case Site.MEDIAS_NENES:
					nFrame = 2;
					sContent = "medias_nene.swf";
					break;
					
					case Site.MEDIAS_BEBES:
					sContent = "construct.swf";
					nFrame = 3;
					break;
					
					case Site.MEDIAS_JUVENILES:
					sContent = "construct.swf";
					nFrame = 4;
					break;
					
					case Site.MEDIAS_BUCANERAS:
					sContent = "construct.swf";
					nFrame = 5;
					break;
					
					case Site.MEDIAS_CANCAN:
					sContent = "construct.swf";
					nFrame = 6;
					break;
					
					case Site.MEDIAS_COLEGIAL:
					sContent = "construct.swf";
					nFrame = 7;
					break;
					
					case Site.MEDIAS_HOMBRE:
					sContent = "construct.swf";
					nFrame = 8;
					break;
					
					case Site.MEDIAS_MUJER:
					sContent = "construct.swf";
					nFrame = 9;
					break;
				}
				
				parent.parent.setChildIndex( parent, parent.parent.numChildren -1);
				
				gotoAndStop(1);
				gotoAndStop(nFrame);
								
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
		
		override public function childLoaded(e:Event):void {
			if ( e.currentTarget is SimpleButton ) {
				(e.currentTarget as SimpleButton).addEventListener( MouseEvent.CLICK, set_section);
			}
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