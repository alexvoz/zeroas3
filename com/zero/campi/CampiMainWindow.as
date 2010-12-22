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
		
		public function CampiMainWindow(stage) 
		{
			req = new URLRequest();
			
			progressBar = new Shape();
			progressBar.graphics.beginFill(0x666666);
			progressBar.graphics.drawRect(0, 0, 2.5, stage.stageHeight );
			progressBar.scaleY = 0;
			progressBar.y = stage.stageHeight;
			addChild(progressBar);
						
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, show_progress);
			//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, content_loaded );
		}
		
		private function content_loaded(e:Event=null):void 
		{
			//this.dispatchEvent( e );
			if ( content && contains( content ) ) removeChild(content);
			
			content = loader.content;
			addChild(content);
			
			progressBar.height = content.height;
						
			content.addEventListener( CampiContent.HIDE_END, load_next );
			if( content is CampiTramaContent ) (content as CampiTramaContent).show();
		}
		
		private function show_progress(e:ProgressEvent):void 
		{
			var p:Number = (e.bytesLoaded / e.bytesTotal);
			TweenMax.to( progressBar, 0.4, { scaleY: p, onUpdate: layout_bar, onComplete: (p == 1) ? content_loaded : null  } );
		}
		
		private function layout_bar():void
		{
			progressBar.y = stage.stageHeight - progressBar.height;
		}
		
		public function refreshSize():void {
			if ( content && contains(content) && content.mask ) {
				content.mask.width = content.width;
				content.mask.height = content.height;
			}
		}
		
		public function load( url:String ):void {
			req.url = url;
			if ( content && content is CampiTramaContent ) {
				//trace("CampiMainWindow load", "antes de hacer load_next disparo el hide");				
				(content as CampiTramaContent).hide();
				
			} else {
				//trace("CampiMainWindow load", content, content is DisplayObjectContainer );		
				load_next();
			}
			
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
				this.load("home.swf");
				break;
				
				default:
				//trace( "CampiMainWindow | section_changed | ", CampiSite.getApp().getSection() );
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