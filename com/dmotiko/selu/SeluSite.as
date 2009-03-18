package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
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
		private var mainContent:Sprite;
		private var topClip:Sprite;
				
		public static function getApp():SeluSite {
			return SeluSite(app);
		}
						
		public function SeluSite() {
			super();
			getChildByName("mcCenter").visible = false;
			setCenterClip(getChildByName("mcCenter"));
			isFullFlash();
		}
				
		override protected function initSite():void {
			mainContent = this.addChild( new Sprite() ) as Sprite;
			topClip = this.addChild( new Sprite() ) as Sprite;
			
			super.initSite();
			
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest("mainContent.swf"+getNoCache()); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.load(mRequest);
			function onCompleteHandler(loadEvent:Event) {         
				mainContent.addChild(loadEvent.currentTarget.content);
			}
			
			
		}
		
		public function getTopClip():Sprite { return topClip; }
		
	}
	
}