package com.general 
{
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class Image extends Sprite 
	{
		
		private var size:Point;
		private var crop:Boolean;
		private var loader:Loader;
		private var content:DisplayObject;
		private var loaderMask:Shape;
		
		public function Image( src:String, size:Point, crop:Boolean=false ) 
		{
			this.size = size;
			this.crop = crop;
			
			this.graphics.beginFill( 0, 0 );
			this.graphics.drawRect(0, 0, size.x, size.y );
			
			loader = new Loader();
			loader.load( new URLRequest( src ) );
			
			loader.contentLoaderInfo.addEventListener(Event.INIT, image_loaded );
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, image_progress );
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, handle_error );
		}
		
		private function handle_error(e:IOErrorEvent):void 
		{
			trace("Image.as", "handle_error", e.text );
		}
		
		private function image_progress(e:ProgressEvent):void 
		{
			dispatchEvent(e);
		}
		
		private function image_loaded(e:Event):void 
		{
			
			this.content = loader.content;
			addChild(this.content);
			
			if ( crop ) {
				loaderMask = new Shape();
				loaderMask.graphics.beginFill(0xFFFF00);
				loaderMask.graphics.drawRect(0, 0, size.x, size.y );
				addChild(loaderMask);
				content.mask = loaderMask;
				
			} else {
				
				if ( this.content is Bitmap ) {
					(this.content as Bitmap).smoothing = true;
				}
				content.width = size.x;
				content.height = size.y;
				
			}
			dispatchEvent(e);
		}
		
	}

}