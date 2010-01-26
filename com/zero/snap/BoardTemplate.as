package com.zero.snap 
{
	import com.general.BaseClip;
	import flash.display.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.utils.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class BoardTemplate 
	extends BaseClip
	{
		private var imgMask:Sprite;
		public var mcImg:DisplayObject;
		private var nContador:Number;
		private var timer:Timer;
		
		public var aItems:Array;
		
		override protected function initClip():void  {
			
			stop();
			
			if( mcImg ){
			
				imgMask = new Sprite();
				imgMask.x = mcImg.x;
				imgMask.y = mcImg.y;
				imgMask.graphics.beginFill(0);
				imgMask.graphics.drawRect( 0, 0, mcImg.width, mcImg.height );
				addChild(imgMask);

				mcImg.mask = imgMask;

				registerTween("imgAlpha", new Tween( mcImg, "alpha", Strong.easeOut, mcImg.alpha, 1, 1, true) );
				registerTween("imgX", new Tween( mcImg, "x", Strong.easeOut, mcImg.x + mcImg.width, mcImg.x, 1, true) );
			
			}
						
		}
		
		private function showItems():void {
			if ( aItems ) {
				for each ( var clip:DisplayObject in  aItems  ) {
					clip.alpha = 0;
				}

				nContador = 0;
				timer = new Timer(100);
				timer.addEventListener( TimerEvent.TIMER, show_item );
				timer.start();
				
			}
		}
		
		function show_item(e:TimerEvent):void {
			var clip:DisplayObject =  aItems[nContador];
			registerTween("item"+nContador, new Tween( clip, "alpha", Strong.easeOut, clip.alpha, 1, 1.5, true) );
			nContador++;
			if( !aItems[nContador] ) timer.stop();
		}
		
	}
	
}