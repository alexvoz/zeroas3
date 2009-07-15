package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class Site
	extends WebSite {
		
		public static var HOME:String = "ELEMENTO_HOME";
		public static var NOSOTROS:String = "ELEMENTO_NOSOTROS";
		
		public static var MEDIAS:String = "ELEMENTO_MEDIAS";
		public static var MEDIAS_NENES:String = "ELEMENTO_MEDIAS_NENES";
		public static var MEDIAS_BEBES:String = "ELEMENTO_MEDIAS_BEBES";
		public static var MEDIAS_JUVENILES:String = "ELEMENTO_MEDIAS_JUVENILES";
		public static var MEDIAS_BUCANERAS:String = "ELEMENTO_MEDIAS_BUCANERAS";
		public static var MEDIAS_CANCAN:String = "ELEMENTO_MEDIAS_CANCAN";
		public static var MEDIAS_COLEGIAL:String = "ELEMENTO_MEDIAS_COLEGIAL";
		public static var MEDIAS_HOMBRE:String = "ELEMENTO_MEDIAS_HOMBRE";
		public static var MEDIAS_MUJER:String = "ELEMENTO_MEDIAS_MUJER";
		
		public static var ROPA:String = "ELEMENTO_ROPA";		
		public static var ROPA_PIJAMA_NENE:String = "ELEMENTO_ROPA_PIJAMA_NENE";
		public static var ROPA_PIJAMA_NENA:String = "ELEMENTO_ROPA_PIJAMA_NENA";
		public static var ROPA_PIJAMA_TEENS:String = "ELEMENTO_ROPA_PIJAMA_TEENS";
		public static var ROPA_INT_NENE:String = "ELEMENTO_ROPA_INT_NENE";
		public static var ROPA_INT_NENA:String = "ELEMENTO_ROPA_INT_NENA";
		public static var ROPA_INT_TEENS:String = "ELEMENTO_ROPA_INT_TEENS";
		public static var ROPA_REMERA_NENE:String = "ELEMENTO_ROPA_REMERA_NENE";
		public static var ROPA_REMERA_NENA:String = "ELEMENTO_ROPA_REMERA_NENA";
		
		public static var CARRITO:String = "ELEMENTO_CARRITO";
		public static var CONTACTO:String = "ELEMENTO_CONTACTO";
		
		public static var SPANISH:String = "ELEMENTO_SPANISH";
		public static var ENGLISH:String = "ELEMENTO_ENGLISH";
		
		private var buttonBar:Sprite;
		private var langBar:Sprite;
		private var mediasTemplate:Loader;
		private var ropaTemplate:Loader;
		private var sndController:SoundController;
		private var contacto:Loader;
				
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():Site {
			return Site(app);
		}
		
		public function Site() {
			super();
			stage.align = "TC";
			stage.scaleMode = StageScaleMode.NO_SCALE;		
		}
				
		override protected function initSite():void {
			buttonBar = this.addChild( new Sprite() ) as Sprite;
			langBar = this.addChild( new Sprite() ) as Sprite;
			this.sSection = Site.HOME;
			super.initSite();
		}
		
		public function getMusic():Sound { return sndController.getMusic(); }
		public function getMusicChannel():SoundChannel { return sndController.getMusicChannel(); }
		
		override public function setSound(bSound:Boolean):void {
			super.setSound(bSound);
			if (!bSound) sndController.fadeOutMusic();
			else sndController.fadeInMusic();
		}
				
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			sndController = new SoundController( getApp(), Site.log );
			
			mediasTemplate = new Loader(); 
			mediasTemplate.y = 75;
			mediasTemplate.x = 15;
			var mRequest:URLRequest = new URLRequest( getResource("mediasTemplate.swf") );
			addChild(mediasTemplate);
			mediasTemplate.load(mRequest);
			
			ropaTemplate = new Loader(); 
			ropaTemplate.y = 75;
			ropaTemplate.x = 15;
			var mRequest2:URLRequest = new URLRequest( getResource("ropaTemplate.swf") );
			addChild(ropaTemplate);
			ropaTemplate.load(mRequest2);
			
			contacto = new Loader(); 
			contacto.y = 0;
			contacto.x = 15;
			var mRequest3:URLRequest = new URLRequest( getResource("contacto.swf") );
			addChild(contacto);
			contacto.load(mRequest3);
			
		}
		
	}
	
}