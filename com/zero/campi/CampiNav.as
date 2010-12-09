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
		public var mcToolBar:Sprite;
		
		private var navBar:CampiNavBar;
		
		public function CampiNav() 
		{
			fondo = getChildAt(0) as Shape;
			navBar = new CampiNavBar();
			navBar.x = 25;
			navBar.y = mcLogo.getBounds(this).bottom + 60;
			addChild(navBar);
			
			//loguito.visible = false;
			
			mcToolBar.x = 15;
			loguito.x = 15;
			
			refreshSize();
		}
		
		public function refreshSize():void {
			fondo.height = stage.stageHeight;
			loguito.y = fondo.height - loguito.height - 10;
			mcToolBar.y =  loguito.getBounds(this).top - mcToolBar.height - 10;
		}
		
		public function init():void {
			(navBar.getChildAt(0) as CampiButton).dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		
	}

}