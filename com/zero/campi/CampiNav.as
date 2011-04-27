package com.zero.campi 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiNav extends Sprite
	{
		
		public var mcLogo:Sprite;
		public var fondo:Shape;
		public var loguito:Sprite;
				
		private var navBar:CampiNavBar;
		private var subNavBar:CampiSubNavBar;
		
		public function CampiNav() 
		{
			fondo = getChildAt(0) as Shape;
			navBar = new CampiNavBar();
			navBar.x = 8;
			navBar.y = mcLogo.getBounds(this).bottom + 17;
			addChild(navBar);
			
			subNavBar = new CampiSubNavBar();
			subNavBar.x = 8;
			subNavBar.y = loguito.getBounds(this).top - subNavBar.height - 10;
			addChild(subNavBar);
						
			loguito.x = 8;
			
			mcLogo.buttonMode = true;
			mcLogo.mouseChildren = false;
			mcLogo.addEventListener(MouseEvent.CLICK, btn_click );
			
			if( CampiSite.PROYECTOR ){
				removeChild(navBar);
			}
			
		}
		
		private function btn_click(e:MouseEvent):void 
		{
			switch( e.target ) {
				case mcLogo:
				CampiSite.getApp().setSection( CampiSite.HOME );
				break;
			}
		}
		
		public function refreshSize():void {
			fondo.height = stage.stageHeight;
			loguito.y = fondo.height - loguito.height - 10;
			subNavBar.y = loguito.getBounds(this).top - subNavBar.height - 10;
		}
		
		public function init():void {
			(navBar.getChildAt(0) as CampiButton).dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		
	}

}