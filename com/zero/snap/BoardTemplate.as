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
		public const BTN_NEXT:String = "btn_next";
		public const BTN_PREV:String = "btn_prev";
		
		private var imgMask:Sprite;
		private var nContador:Number;
		private var timer:Timer;
		
		public var mcImg:DisplayObject;
		public var aBtns:Array;
		public var aLinks:Array;
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
		
		private function getLink(btn:*):String {
			for (var i:uint = 0; i < aBtns.length; i++ ) {
				if ( aBtns[i] == btn ) return aLinks[i];
			}
			return undefined;
		}
		
		private function bindBtns(aBtns:Array, aLinks:Array):void {
			this.aBtns = aBtns;
			this.aLinks = aLinks;
			
			for (var i:uint = 0; i < aBtns.length; i++ ) {
				
				var btn:Sprite = aBtns[i];
				
				if ( btn.hasEventListener( MouseEvent.CLICK ) ) continue;
				
				btn.buttonMode = true;
				btn.addEventListener( MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
					registerTween( e.currentTarget.name + "alpha", new Tween( e.currentTarget, "alpha", Regular.easeOut, e.currentTarget.alpha, 0.5, 0.5, true) );
				});
				btn.addEventListener( MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
					registerTween( e.currentTarget.name + "alpha", new Tween( e.currentTarget, "alpha", Regular.easeOut, e.currentTarget.alpha, 1, 0.5, true) );
				});
				btn.addEventListener( MouseEvent.CLICK, function(e:MouseEvent) {
					var link = getLink( e.currentTarget );
					var timeline = e.currentTarget.parent;
					if ( link == BTN_NEXT) {
						if ( timeline.currentFrame < timeline.totalFrames ) timeline.nextFrame();
						else timeline.gotoAndStop( 1 );
					} else if (link == BTN_PREV) {
						if ( timeline.currentFrame > 1 ) timeline.prevFrame();
						else timeline.gotoAndStop( timeline.totalFrames );
						
					} else {
						timeline.gotoAndStop( link );
					}
					registerTween( "alphaGlobal", new Tween(timeline, "alpha", Regular.easeOut, 0, 1, 0.5, true) );
				});
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
		
		private function show_item(e:TimerEvent):void {
			var clip:DisplayObject =  aItems[nContador];
			registerTween("item"+nContador, new Tween( clip, "alpha", Strong.easeOut, clip.alpha, 1, 1.5, true) );
			nContador++;
			if( !aItems[nContador] ) timer.stop();
		}
		
	}
	
}