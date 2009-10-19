package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class RopaTemplate
	extends BaseClip {
		
		public var btnPijamaNene:SimpleButton;
		public var btnPijamaNena:SimpleButton;
		public var mcPijamaTeen:SimpleButton;
		public var mcRINene:SimpleButton;
		public var btnRINena:SimpleButton;
		public var btnRITeen:SimpleButton;
		
		public var mcLoader:MovieClip;
		
		private var contentLoader:Loader;
		
		override protected function initClip():void {
			
			contentLoader = new Loader();
			addChild(contentLoader);
			
			if (!Site.getApp()) return;
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed );
			Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, section_changed );
		}
		
		private function section_changed(e:Event):void {
			var sSection:String = Site.getApp().getSection();
						
			var nFrame:int = 1;
			var sContent:String;
			if ( sSection.indexOf(Site.ROPA) > -1 && sSection != Site.ROPA) {
				switch( sSection ) {
					case Site.ROPA_PIJAMA_NENE:
					nFrame = 2;
					sContent = "ropa_pijamaNene";
					break;
					
					case Site.ROPA_PIJAMA_NENA:
					sContent = "ropa_pijamaNena";
					nFrame = 3;
					break;
					
					case Site.ROPA_PIJAMA_TEENS:
					sContent = "ropa_pijamaTeen";
					nFrame = 4;
					break;
					
					case Site.ROPA_INT_NENE:
					sContent = "ropa_intNene";
					nFrame = 5;
					break;
					
					case Site.ROPA_INT_NENA:
					sContent = "ropa_intNena";
					nFrame = 6;
					break;
					
					case Site.ROPA_INT_TEENS:
					sContent = "ropa_intTeens";
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
					contentLoader.load( new URLRequest( sContent ) );
					if(!contains(contentLoader) ) addChild(contentLoader);
				}			
				
			} else {
				//Site.log("RopaTemplate | yendo al frame 1");
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
			Site.log("RopaTemplate | set_section");
			var sSection:String;
			switch( e.currentTarget ) {
				case btnPijamaNene:
				sSection = Site.ROPA_PIJAMA_NENE;
				break;
				
				case btnPijamaNena:
				sSection = Site.ROPA_PIJAMA_NENA;
				break;
				
				case mcPijamaTeen:
				sSection = Site.ROPA_PIJAMA_TEENS;
				break;
				
				case mcRINene:
				sSection = Site.ROPA_INT_NENE;
				break;
				
				case btnRINena:
				sSection = Site.ROPA_INT_NENA;
				break;
				
				case btnRITeen:
				sSection = Site.ROPA_INT_TEENS;
				break;
				
			}
			Site.getApp().setSection( sSection );
		}
		
	}
	
}