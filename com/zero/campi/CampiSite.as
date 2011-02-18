package com.zero.campi 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.general.WebSite;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.system.Security;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiSite extends WebSite
	{
		
		public static const PROYECTOR:Boolean = false;
		
		public static const HOME:String = "campi_home";
		public static const NOSOTROS:String = "campi_nosotros";
		public static const CATALOGO:String = "campi_catalogo";
		public static const DISTRIBUCION:String = "campi_distribucion";
		public static const CONTACTO:String = "campi_contacto";
		public static const MAPA:String = "campi_mapa";
		public static const FAQ:String = "campi_faq";
		
		public var mcNav:CampiNav;
		public var mcFondo:Sprite;
		public var mcSombra:Sprite;
		private var mcMainWindow:CampiMainWindow;
				
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():CampiSite {
			return app as CampiSite;
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
						
			this.mcMainWindow = new CampiMainWindow(stage);
			this.mcMainWindow.x = this.mcNav.getBounds(this).right;
			this.mcMainWindow.y = this.mcNav.getBounds(this).top;
			this.addChild(mcMainWindow);
			
			this.mcMainWindow.mask = mcWindowMask;
			
			this.addEventListener( WebSite.SECTION_CHANGED, mcMainWindow.section_changed );
			mcNav.addEventListener(MouseEvent.CLICK, nav_bar_clicked );
			
			addChild(mcNav);
			
			if ( PROYECTOR ) {
				stage.displayState = StageDisplayState.FULL_SCREEN;
				stage.scaleMode = StageScaleMode.SHOW_ALL;
				var intro = mcMainWindow.addChild( new IntroCatalogo() );
				intro.x = (720 - intro.width) / 2;
				intro.y = (mcMainWindow.height - intro.height) / 2;
				
			} else {
				stage.align = StageAlign.TOP;
				stage.scaleMode = StageScaleMode.NO_SCALE;	
				SWFAddress.addEventListener(SWFAddressEvent.INIT, check_address);
			}
								
			stage.addEventListener(Event.RESIZE, resizeBrowser );
			resizeBrowser();
		}
		
		private function check_address(e:SWFAddressEvent):void 
		{
			if ( SWFAddress.getValue().split("/")[1] ) {
				this.setSection( SWFAddress.getValue().split("/")[1] );
			} else {
				this.setSection( CampiSite.HOME );
			}
		}
				
		private function nav_bar_clicked(e:MouseEvent):void 
		{
			
			if( e.target is CampiButton ){
				this.setSection( e.target.data );
			}
			
		}
		
		override protected function resizeBrowser( evnt:Event=null ):void {
			var dif:int = mcSombra.getBounds(this).bottom - stage.stageHeight;
			//ExternalInterface.call( "console.log", dif );
			if ( dif > 0 ) {
				var ratio:Number = stage.stageHeight / mcSombra.getBounds(this).bottom;
				if ( ratio > 1 ) ratio = 1;
				this.scaleX = this.scaleY = ratio;
				if ( dif > 20 ) dif = 20;
				this.y = -dif; //esto es para que quede clavado arriba
				this.x = +30; //¿de donde goma sale este 30? lo probé a ojo
			} else {
				this.y = this.x = 0;
				this.scaleX = this.scaleY = 1;
			}
		}
		
	}

}