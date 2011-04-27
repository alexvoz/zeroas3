package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.filters.DropShadowFilter;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiMainWindow extends Sprite
	{
		
		private var progressBar:Shape;
		private var loader:Loader;
		private var content:DisplayObject;
		private var req:URLRequest;
		private var lastcontent:DisplayObject;
		
		public function CampiMainWindow(stage) 
		{
			req = new URLRequest();
			
			progressBar = new Shape();
			progressBar.graphics.beginFill(0x666666);
			progressBar.graphics.drawRect(0, 0, 2.5, 600 );
			progressBar.scaleY = 0;
			progressBar.y = 600;
			addChild(progressBar);
						
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, show_progress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, content_loaded );
		}
		
		private function content_loaded(e:Event=null):void 
		{
			//this.dispatchEvent( e );
			if ( content && contains( content ) ) {
				lastcontent = content;
			}
			
			content = loader.content;
			if( content ){
				addChild(content);
			}
			
			progressBar.height = 600;
						
			content.addEventListener( CampiContent.SHOW_END, remove_last_content );
			if( content is CampiTramaContent ) (content as CampiTramaContent).show();
		}
		
		private function remove_last_content(e:Event):void 
		{
			if ( lastcontent && contains( lastcontent ) ) removeChild( lastcontent ); 
		}
		
		private function show_progress(e:ProgressEvent):void 
		{
			var p:Number = (e.bytesLoaded / e.bytesTotal);
			//TweenMax.to( progressBar, 0.4, { scaleY: p, onUpdate: layout_bar, onComplete: (p == 1) ? content_loaded : null  } );
		}
		
		private function layout_bar():void
		{
			progressBar.y = 600 - progressBar.height;
		}
		
		public function refreshSize():void {
			if ( content && contains(content) && content.mask ) {
				content.mask.width = content.width;
				content.mask.height = content.height;
			}
		}
		
		public function load( url:String ):void {
			if ( req.url == url ) return;
			
			req.url = url;
			load_next();
			
		}
		
		public function section_changed(e:Event):void 
		{
			switch( CampiSite.getApp().getSection() ){
				
				case CampiSite.HOME:
				this.load("home.swf");
				break;
				
				case CampiSite.NOSOTROS:
				this.load("historia.swf");
				break;
				
				case CampiSite.CATALOGO:
				this.load("productos.swf");
				break;
				
				case CampiSite.DISTRIBUCION:
				this.load("distribucion.swf");
				break;
				
				case CampiSite.CONTACTO:
				this.load("contacto.swf");
				break;
				
				default:
				trace( "CampiMainWindow | section_changed | ", CampiSite.getApp().getSection() );
				break;
			}
		}
		
		private function load_next(e:Event = null):void
		{
			//trace("CampiWindow", "load_next", req.url);
			progressBar.width = 2.5;
			progressBar.scaleY = 0;
			loader.load( req );
		}
		
	}

}