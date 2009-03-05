package com.dmotiko.selu {
	import com.general.*;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class SeluSite
	extends WebSite {
		
		public static const HOME:String = "SELU_HOME";
		public static const COLECCION:String = "SELU_COLECCION";
		public static const BACKSTAGE:String = "SELU_BACKSTAGE";
		public static const PUNTOVENTA:String = "SELU_PUNTOVENTA";
		public static const NOVEDADES:String = "SELU_NOVEDADES";
		public static const SEXIES:String = "SELU_SEXIES";
		public static const PRENSA:String = "SELU_PRENSA";
		public static const CONTACTO:String = "SELU_CONTACTO";
		public static const NOCASTING:String = "SELU_NOCASTING";
		private var botonera:Sprite;
		private var topClip:Sprite;
		private var middleClip:Sprite;
		
		public static function getApp():SeluSite {
			return SeluSite(app);
		}
						
		public function SeluSite() {
			super();
			isFullFlash();
		}
		
		override protected function initSite():void {
			botonera = this.addChild( new Sprite() ) as Sprite;
			middleClip = this.addChild( new Sprite() ) as Sprite;
			topClip = this.addChild( new Sprite() ) as Sprite;
			
			super.initSite();
			
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest("botonera.swf"+getNoCache()); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.load(mRequest);
			function onCompleteHandler(loadEvent:Event) {         
				botonera.addChild(loadEvent.currentTarget.content);
			}
			
			var mLoader2:Loader = new Loader(); 
			var mRequest2:URLRequest = new URLRequest("prensa.swf"+getNoCache()); 
			mLoader2.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler2); 
			mLoader2.load(mRequest2);
			function onCompleteHandler2(loadEvent:Event) {         
				middleClip.addChild(loadEvent.currentTarget.content);
			}
			
		}
		
		public function getTopClip():Sprite { return topClip; }
		
	}
	
}