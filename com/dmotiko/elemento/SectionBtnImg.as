package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
		
	public class SectionBtnImg
	extends BaseClip {
		
		public var mcImg:MovieClip;
		protected var mcRotulo:MovieClip;
						
		override protected function refreshData():void {
			mcImg = new data.img();
			mcImg.x = data.initX;
			mcRotulo = mcImg.getChildByName("mcRotulo") as MovieClip;
			mcRotulo.alpha = 0;
			this.addChild( mcImg );
		}
		
		override public function show():void {
			registerTween( "moveX", new Tween( mcImg, "x", Regular.easeOut, mcImg.x, data.endX, 9));
			registerTween( "fadeLabel", new Tween( mcRotulo, "alpha", Regular.easeOut, mcRotulo.alpha, 1, 0.5, true));
		}
		
		override public function hide():void {
			registerTween( "moveX", new Tween( mcImg, "x", Regular.easeOut, mcImg.x, data.initX, 9));
			registerTween( "fadeLabel", new Tween( mcRotulo, "alpha", Regular.easeOut, mcRotulo.alpha, 0, 0.5, true));
		}
			
	}
	
}