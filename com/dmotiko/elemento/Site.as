package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	
	public class Site
	extends WebSite {
		
		public static var HOME:String = "ELEMENTO_HOME";
		public static var NOSOTROS:String = "ELEMENTO_NOSOTROS";
		public static var MEDIAS:String = "ELEMENTO_MEDIAS";
		public static var ROPA:String = "ELEMENTO_ROPA";
		public static var CARRITO:String = "ELEMENTO_CARRITO";
		public static var CONTACTO:String = "ELEMENTO_CONTACTO";
		
		public static var SPANISH:String = "ELEMENTO_SPANISH";
		public static var ENGLISH:String = "ELEMENTO_ENGLISH";
		
		private var buttonBar:Sprite;
		private var langBar:Sprite;
		
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():Site {
			return Site(app);
		}
		
		public function Site() {
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
			buttonBar = this.addChild( new Sprite() ) as Sprite;
			langBar = this.addChild( new Sprite() ) as Sprite;
			this.sSection = Site.HOME;
			super.initSite();
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			Site.log( "Site | externalContentLoaded!" );
		}
		
	}
	
}