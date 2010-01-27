package com.zero.snap 
{
	import com.general.BaseClip;
	import com.general.WebSite;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class Board
	extends BaseClip
	{
		
		public var mcClose:Sprite;
		private var loader:Loader;
		private var mcLoaderClip:MovieClip;
		
		override protected function initClip():void {
			stop();

			mcClose.addEventListener( MouseEvent.CLICK, click_close);
			mcClose.buttonMode = true;
			
			loader = new Loader();
			addChild(loader);
			
			mcLoaderClip = new loaderClip();
			mcLoaderClip.x = (this.width - mcLoaderClip.width) / 2;
			mcLoaderClip.y = (this.height - mcLoaderClip.height) / 2;
						
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
		}
		
		private function section_changed(e:Event):void {
			var path:String;
			switch(Site.getApp().getSection()){
				case Site.STAFF:
				path = "staff.swf";
				break;
				
				case Site.CLIENTS:
				path = "clients.swf";
				break;
				
				case Site.CONSERVAS:
				path = "conservas.swf";
				break;
				
				case Site.ESPECIAS:
				path = "especias.swf";
				break;
				
				case Site.PRODUCTION:
				path = "produccion.swf";
				break;
				
				case Site.HISTORY:
				path = "history.swf";
				break;
								
				case Site.PARTNERS:
				path = "partners.swf";
				break;
				
				case Site.CONTACT:
				path = "contacto.swf";
				break;
				
			}
			if ( path ) {
				loader.load(new URLRequest(path));
				this.addChild( mcLoaderClip );
				loader.contentLoaderInfo.addEventListener( Event.INIT, remove_loader );
			}
		}
		
		private function remove_loader(e:Event):void 
		{
			removeChild(mcLoaderClip);
		}

		private function click_close(e:MouseEvent):void {
			Site.getApp().placaOut();
		}
		
	}
	
}