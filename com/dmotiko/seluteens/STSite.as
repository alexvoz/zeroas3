package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.*;
	import flash.utils.getTimer;
		
	public class STSite
	extends WebSite {
		
		public static const HOME:String = "SELUTEENS_HOME";
		public static const COLECCION:String = "SELUTEENS_COLECCION";
		public static const PUNTOVENTA:String = "SELUTEENS_PUNTOVENTA";
		public static const NOVEDADES:String = "SELUTEENS_NOVEDADES";
		public static const PRENSA:String = "SELUTEENS_PRENSA";
		public static const CONTACTO:String = "SELUTEENS_CONTACTO";
		public static const NOCASTING:String = "SELUTEENS_NOCASTING";
		
		private var mainContent:Sprite;
		private var topClip:Sprite;
		private var seluLoader:STLoader;
		
		private var xmlContent:STXMLContent;
		private var sndController:STSoundController;
								
		//para evitar imports innecesarios
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():STSite {
			return STSite(app);
		}
						
		public function STSite() {
			super();
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
			this.sSection = STSite.HOME;
			super.initSite();
			
		}
		
		override protected function loadExternalContent():void {
			
			//sndController = new STSoundController();
			xmlContent = new STXMLContent();
			xmlContent.addEventListener( Event.COMPLETE, externalContentLoaded);
			
		}
		
		public function getTopClip():Sprite { return topClip; }
		
		public function getCollectionData():XMLList { return xmlContent.getCollectionData();	}
		public function getStoresData():XMLList { return xmlContent.getStoresData(); }
		public function getPressData():XMLList { return xmlContent.getPressData(); }		
		public function getNewsData():XMLList { return xmlContent.getNewsData(); }		
		
		public function getMusic():Sound { return sndController.getMusic(); }
		public function getMusicChannel():SoundChannel { return sndController.getMusicChannel(); }
		
		override public function setSound(bSound:Boolean):void {
			super.setSound(bSound);
			if (!bSound) sndController.fadeOutMusic();
			else sndController.fadeInMusic();
		}
				
			
		// TODO esto vuela más tarde
		override public function setSection( s:String ):void {
			if ( s == STSite.CONTACTO || s == STSite.PUNTOVENTA || s == STSite.NOVEDADES || s == STSite.PRENSA ) return;
			super.setSection( s );
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			//getChildByName("mcSTLoader").addEventListener( Event.CHANGE, hideLoader);
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest("mainContent.swf"+getNoCache()); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			//mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			mLoader.load(mRequest);
			
		}
		
		private function hideLoader(e:Event):void {
			removeChild( getChildByName("mcSTLoader") );
		}
		
		private function onProgressHandler(evnt:ProgressEvent) {         
			var nP:Number = Math.round( evnt.bytesLoaded * 100 / evnt.bytesTotal );
			(getChildByName("mcSTLoader") as STLoader).setPos( nP );
		}
		
		private function onCompleteHandler(loadEvent:Event) {         
			mainContent.addChild(loadEvent.currentTarget.content);
		}
		
	}
	
}