package com.zero.campi 
{
	//import com.eclecticdesignstudio.motion.Actuate;
	//import com.eclecticdesignstudio.motion.easing.Cubic;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import com.zero.campi.CampiContent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiHome extends CampiContent
	{
		
		public var mcPhoto:Sprite;
		public var mcBanner:MovieClip;
		
		public function CampiHome() 
		{
			super();
			var trama:CampiTrama = new CampiTrama();
			trama.x = mcPhoto.getBounds(this).right;
			addChild(trama);
			
			removeChild(mcBanner);
			mcBanner.stop();
			
		}
		
		override protected function init(e:Event):void 
		{
			super.init(e);
			
			if( !contains(mcBanner) ){
				var nY:int = mcBanner.y;
				mcBanner.y = -mcBanner.height;
				//var blur:BlurFilter = new BlurFilter(0, 50 );
				//var newFilters:Array = mcBanner.filters;
				//newFilters.push(blur);
				//mcBanner.filters = newFilters;
				//Actuate.tween( mcBanner, 0.6, { y: nY } ).ease( Cubic.easeInOut ).delay(0.8);
				//Actuate.effects(mcBanner, 1.5).filter( BlurFilter, { blurX:0, blurY: 0 } );
				TweenMax.to(mcBanner, 0.6, { y: nY, ease: Cubic.easeInOut, delay: 0.8 } );
				addChild(mcBanner);
			}
		}
		
	}

}