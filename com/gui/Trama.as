package com.gui
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class Trama extends Shape 
	{
		private var bd:BitmapData;
		private var loader:Loader;
		
		public function Trama() 
		{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, back_loaded );
			blendMode = BlendMode.MULTIPLY;
			addEventListener( Event.ADDED_TO_STAGE, init_stage );
		}
		
		private function init_stage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init_stage);
			
			stage.align = StageAlign.TOP_LEFT;
			loader.load( new URLRequest("app_img/fondo_fotos.png") );
		}
		
		function back_loaded(e:Event){
			var back:Bitmap = (e.currentTarget as LoaderInfo).content as Bitmap;
			bd = new BitmapData( back.width, back.height );
			bd.draw( back );
			graphics.beginBitmapFill( bd );
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
			stage.addEventListener(Event.RESIZE, update_shape );
		}
		
		private function update_shape(e:Event):void 
		{
			graphics.clear();
			graphics.beginBitmapFill( bd );
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
			graphics.endFill();
		}
		
	}

}