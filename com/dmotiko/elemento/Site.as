package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
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
		private var bar:NavBar;
		private var medias:MediasSelector;
		private var ropa:RopaSelector;
		
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
			mediasTemplate = new Loader(); 
			mediasTemplate.y = 75;
			mediasTemplate.x = 15;
			var mRequest:URLRequest = new URLRequest( getResource("mediasTemplate.swf") );
			addChild(mediasTemplate);
			mediasTemplate.load(mRequest);
			
			bar = new NavBar();
			bar.setView( NavBarBtn );
			this.addChild(bar);
			
			var aData:Array = new Array();
			aData.push( { label: "Nosotros", value: Site.NOSOTROS } );
			aData.push( { label: "Medias", value: Site.MEDIAS } );
			aData.push( { label: "Ropa", value: Site.ROPA } );
			aData.push( { label: "Carrito", value: Site.CARRITO } );
			aData.push( { label: "Contacto", value: Site.CONTACTO } );
			
			bar.setData( aData );
			bar.addEventListener( Event.CHANGE, bar_changed);
			
		}
		
		private function bar_changed(e):void {
				if( bar.getActiveButton().getData().value == Site.MEDIAS ){
					try {
						removeChild( ropa );
					} catch(e) { }
					medias = new MediasSelector();
					medias.y = 80;
					medias.x = 15;
					this.addChild(medias);
					
				}  else if ( bar.getActiveButton().getData().value == Site.ROPA){
					try {
						removeChild( medias );
					} catch(e) { }
					ropa = new RopaSelector();
					ropa.y = 80;
					ropa.x = 15;
					this.addChild(ropa);
					
				}
			}
		
	}
	
}