package com.dmotiko.opositor {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.*;
	import flash.utils.getTimer;
		
	public class OPSite
	extends WebSite {
		
		public static const HOME:String = "OPOSITOR_HOME";
		public static const BACKSTAGE:String = "OPOSITOR_BACKSTAGE";
		public static const COLECCION:String = "OPOSITOR_COLECCION";
		public static const PUNTOVENTA:String = "OPOSITOR_PUNTOVENTA";
		public static const CONTACTO:String = "OPOSITOR_CONTACTO";
				
		private var mainContent:Sprite;
		private var topClip:Sprite;
		private var seluLoader:OPLoader;
		
		private var xmlContent:OPXMLContent;
		private var sndController:OPSoundController;
		
		public var mcLoader:OPPhotoLoader;
		private var mLoader:Loader;
								
		//para evitar imports innecesarios
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():OPSite {
			return OPSite(app);
		}
						
		public function OPSite() {
			super();
			
			//this.loaderInfo.parameters["URL_HEADER"] = "http://www.d-motiko.com.ar/clients/opositor/production/";
			
			//creo el clip que centra el contenido
			var sCenterClip:Sprite = new Sprite();
			sCenterClip.graphics.beginFill(0xFF0000);
			sCenterClip.graphics.drawRect(0, 0, 1005, 600);
			sCenterClip.graphics.endFill();
			sCenterClip.visible = false;
			//lo agrego al displayList
			this.addChild( sCenterClip );
			//lo seteo como referencia para WebSite
			setCenterClip( sCenterClip );
			
			isFullFlash();
		}
				
		override protected function initSite():void {
			mainContent = this.addChild( new Sprite() ) as Sprite;
			topClip = this.addChild( new Sprite() ) as Sprite;
			this.sSection = OPSite.HOME;
			super.initSite();
			
		}
		
		override protected function loadExternalContent():void {
			
			sndController = new OPSoundController();
			xmlContent = new OPXMLContent();
			xmlContent.addEventListener( Event.COMPLETE, externalContentLoaded);
			
		}
		
		public function getTopClip():Sprite { return topClip; }
		
		public function getCollectionData():XMLList { return xmlContent.getCollectionData();	}
		public function getStoresData():XMLList { return xmlContent.getStoresData(); }
				
		public function getMusic():Sound { return sndController.getMusic(); }
		public function getMusicChannel():SoundChannel { return sndController.getMusicChannel(); }
		
		override public function setSound(bSound:Boolean):void {
			super.setSound(bSound);
			if (!bSound) sndController.fadeOutMusic();
			else sndController.fadeInMusic();
		}
		
		public function fadeOutMusic():void {
			sndController.fadeOutMusic();
		}
		public function fadeInMusic():void {
			sndController.fadeInMusic();
		}
				
			
		// TODO esto vuela más tarde
		override public function setSection( s:String ):void {
			super.setSection( s );
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			mLoader = new Loader(); 
			var mRequest:URLRequest = new URLRequest( getResource("mainContent.swf") ); 
			mcLoader.addEventListener( Event.COMPLETE, loader_complete);
			mLoader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, mcLoader.setData);
			mLoader.contentLoaderInfo.addEventListener( Event.INIT, mainContent_init);
			mcLoader.setData( { dummy: true } );
			//mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.load(mRequest);
			
		}
		
		private function mainContent_init(e:Event):void 
		{
			mcLoader.setData( e );
		}
		
		private function loader_complete(e:Event):void 	{
			mainContent.addChild( mLoader );
		}
				
		private function onCompleteHandler(loadEvent:Event) {         
			mainContent.addChild(loadEvent.currentTarget.content);
		}
		
	}
	
}