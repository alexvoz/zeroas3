package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class MediasTemplate
	extends BaseClip {
		
		public var mcBebe:SimpleButton;
		public var mcNinos:SimpleButton;
		public var mcJuvenil:SimpleButton;
		public var mcHombre:SimpleButton;
		public var mcDama:SimpleButton;
		public var mcInblack:SimpleButton;
		public var mcCanCan:SimpleButton;
		public var mcBucanera:SimpleButton;
		public var mcColegial:SimpleButton;
				
		public var mcLoader:MovieClip;
		
		private var contentLoader:Loader;
		
		override protected function initClip():void {
			//Site.log( "MediasTemplate | initClip | "+Site.getApp());
			
			contentLoader = new Loader();
						
			if (!Site.getApp()) return;
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed );
			Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, section_changed );
		}
		
		private function section_changed(e:Event):void {
			var sSection:String = Site.getApp().getSection();
						
			var nFrame:int = 1;
			var sContent:String;
						
			if ( sSection.indexOf(Site.MEDIAS) > -1 && sSection != Site.MEDIAS) {
				switch( sSection ) {
										
					case Site.MEDIAS_BEBES:
					sContent = "medias_bebe";
					nFrame = 2;
					break;
					
					case Site.MEDIAS_NENES:
					sContent = "medias_nene";
					nFrame = 3;
					break;
					
					case Site.MEDIAS_JUVENILES:
					sContent = "medias_juvenil";
					nFrame = 4;
					break;
					
					case Site.MEDIAS_INBLACK:
					sContent = "medias_inblack";
					nFrame = 5;
					break;
					
					case Site.MEDIAS_HOMBRE:
					sContent = "medias_hombre";
					nFrame = 6;
					break;
					
					case Site.MEDIAS_MUJER:
					sContent = "medias_mujer";
					nFrame = 7;
					break;
					
					case Site.MEDIAS_CANCAN:
					sContent = "medias_cancan";
					nFrame = 7;
					break;

					case Site.MEDIAS_BUCANERAS:
					sContent = "medias_bucaneras";
					nFrame = 7;
					break;

					case Site.MEDIAS_COLEGIAL:
					sContent = "medias_colegial";
					nFrame = 7;
					break;
									
				}
				
				parent.parent.setChildIndex( parent, parent.parent.numChildren -1);
				
				gotoAndStop(1);
				var bL:Boolean = Site.getApp().getLanguage() == Site.SPANISH;
				if (!bL) {
					sContent += "_eng";
					nFrame += 7;
				}
				sContent += ".swf";
				
				gotoAndStop(nFrame);
								
				if (sContent) {
					mcLoader.gotoAndPlay(2);
					contentLoader.contentLoaderInfo.addEventListener( Event.INIT, content_loaded );
					//Site.log( "MediasTemplate | load= " + sContent );
					contentLoader.load( new URLRequest( sContent ) );
					if(!contains(contentLoader) ) addChild(contentLoader);
				}			
				
			} else {
				//Site.log("MediasTemplate | yendo al frame 1");
				if( contains(contentLoader) ) removeChild(contentLoader);
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
			//Site.log("MediasTemplate | set_section " + e.currentTarget);
			
			var sSection:String;
			switch( e.currentTarget ) {
				case mcNinos:
				sSection = Site.MEDIAS_NENES;
				break;
				
				case mcBebe:
				sSection = Site.MEDIAS_BEBES;
				break;
								
				case mcJuvenil:
				sSection = Site.MEDIAS_JUVENILES;
				break;
				
				case mcHombre:
				sSection = Site.MEDIAS_HOMBRE;
				break;
				
				case mcDama:
				sSection = Site.MEDIAS_MUJER;
				break;
				
				case mcInblack:
				sSection = Site.MEDIAS_INBLACK;
				break;
				
				case mcBucanera:
				sSection = Site.MEDIAS_BUCANERAS;
				break;
				
				case mcCanCan:
				sSection = Site.MEDIAS_CANCAN;
				break;
				
				case mcColegial:
				sSection = Site.MEDIAS_COLEGIAL;
				break;
			}
			Site.getApp().setSection( sSection );
		}
		
	}
	
}