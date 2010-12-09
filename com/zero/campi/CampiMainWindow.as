package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
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
		private var content:CampiContent;
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
			
			content = loader.content as CampiContent;
			addChild(content);
			
			content.mask = progressBar;
			
			progressBar.height = content.height;
			TweenMax.to( progressBar, 0.8, { width: content.width , ease: Quint.easeOut } );
			TweenMax.from( content, 0.3, { alpha: 0 } );
		
			var sombra:DropShadowFilter = new DropShadowFilter();
			sombra.alpha = 0.55;
			sombra.angle = 0;
			sombra.distance = 10;
			sombra.blurX = sombra.blurY = 15;
			content.filters = [ sombra ];
			
			content.addEventListener( CampiContent.HIDE_END, load_next );
			content.show();
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
			if ( content ) {
				content.hide();
			} else {
				load_next();
			}
			
		}
		
		public function section_changed(e:Event):void 
		{
			switch( CampiSite.getApp().getSection() ){
				case CampiSite.NOSOTROS:
				this.load("home.swf");
				break;
				
				case CampiSite.DISTRIBUCION:
				this.load("distribucion.swf");
				break;
				
				default:
				trace( "CampiMainWindow | section_changed | ", CampiSite.getApp().getSection() );
				break;
			}
		}
		
		private function load_next(e:Event = null):void
		{
			progressBar.width = 2.5;
			progressBar.scaleY = 0;
			loader.load( req );
		}
		
	}

}