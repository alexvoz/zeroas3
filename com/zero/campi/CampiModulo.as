package com.zero.campi 
{
	//import com.eclecticdesignstudio.motion.Actuate;
	import com.greensock.*; 
	import com.greensock.easing.*;
	
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiModulo extends Sprite
	{
		private var loader:Loader;
		private var fondo:Shape;
							
		public function CampiModulo(color:uint, alpha:Number, image:String=null) 
		{
			fondo = new Shape();
			fondo.graphics.beginFill( color, 1);
			fondo.graphics.drawRect(0, 0, 82, 120 );
			fondo.alpha = alpha;
			addChild(fondo);
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, image_loaded );
			addChild(loader);
								
			if (image) {
				loader.load( new URLRequest(image) );
			}
			
		}		
		
		private function image_loaded(e:Event):void 
		{
			loader.alpha = 0;
			//Actuate.tween( loader, 0.5, { alpha: 1 } ).delay( Math.random()*1.5 );
			TweenMax.to( loader, 0.5, { alpha: 1, delay: Math.random() * 1.5 } );
		}
		
		private function setData( color:uint = undefined, alpha:Number = undefined, image:String = null ):void
		{
			if ( color ) {
				//Actuate.transform( fondo, 0.5).color( color, 1, alpha ? alpha : fondo.alpha);
				TweenMax.to(this, 0.5, { colorTransform:{tint: color }, alpha: (alpha) ? alpha : fondo.alpha } );
			}
			if (alpha) {
				//Actuate.tween( fondo, 0.5, { alpha: alpha } );
				TweenMax.to(fondo, 0.5, { alpha: alpha } );
			}
			if (image) {
				loader.load( new URLRequest(image) );
			} else {
				loader.unload();
			}
		}
		
	}

}