package com.zero.campi 
{
	import com.general.WebSite;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiSite extends WebSite
	{
		
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
			
			//mcNav.init();
			addChild(mcNav);
			//isFullFlash();
			stage.align = StageAlign.TOP;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.setSection( CampiSite.HOME );
		}
				
		private function nav_bar_clicked(e:MouseEvent):void 
		{
			
			if( e.target is CampiButton ){
				this.setSection( e.target.data );
			}
			
		}
		
		override protected function resizeBrowser( evnt:Event ):void {
			super.resizeBrowser( evnt );
			//CampiSite.log(this.width +" | "+stage.stageWidth );
			//mcNav.refreshSize();
			//mcMainWindow.refreshSize();
			
		}
		
	}

}