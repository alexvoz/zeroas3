package com.zero.snap 
{
	import com.general.BaseClip;
	import fl.video.FLVPlayback;
	import flash.display.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.filters.DropShadowFilter;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class BoardEspecias extends BoardTemplate
	{
		public const BTN_TRAILER:String = "btn_trailer";
		public const BTN_VOLVER:String = "btn_volver";
		
		public var timer:Timer;
		public var reproductor:FLVPlayback;
				
		override protected function bindBtns(aBtns:Array, aLinks:Array):void {
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
					var link:String = getLink( e.currentTarget );
					var timeline = e.currentTarget.parent;
					
					if ( link.indexOf("http://") == 0 ) {
						navigateToURL( new URLRequest( link ), "_blank" );
						return;
					}
					if ( link.indexOf("mailto:") == 0){
						navigateToURL( new URLRequest( link ) );
						return;
					}
					
					if ( link == BTN_NEXT) {
						if ( timeline.currentFrame < timeline.totalFrames ) timeline.nextFrame();
						else timeline.gotoAndStop( 1 );
					} else if (link == BTN_PREV) {
						if ( timeline.currentFrame > 1 ) timeline.prevFrame();
						else timeline.gotoAndStop( timeline.totalFrames );
						
					} else if ( link == BTN_TRAILER) {
						e.currentTarget.video.visible = true;
						(e.currentTarget.video.trailerFLV as FLVPlayback).bufferTime = 0.5;
						(e.currentTarget.video.trailerFLV as FLVPlayback).play( e.currentTarget.src );
						e.currentTarget.volver.visible = true;
						e.currentTarget.visible = false;
						if ( timer ) timer.stop();
						timer = new Timer(500, 1);
						timer.start();
						reproductor = e.currentTarget.video.trailerFLV ;
						
						timer.addEventListener( TimerEvent.TIMER, function(e2) {
									if( ! reproductor.playing ){
										Site.log( "BoardEspecias | no estaba playing" );
										reproductor.pause();
										reproductor.play();
									} else {
										Site.log( "BoardEspecias | ya estaba playing" );
									}
								}
							);
						
						
						Site.getApp().setSound(false);
												
					} else if ( link == BTN_VOLVER) {
						
						if ( timer ) timer.stop();
						e.currentTarget.visible = false;
						e.currentTarget.trailer.visible = true;
						e.currentTarget.video.visible = false;
						(e.currentTarget.video.trailerFLV as FLVPlayback).seek(0);
						(e.currentTarget.video.trailerFLV as FLVPlayback).stop();
						e.currentTarget.video.trailerFLV.getVideoPlayer(e.currentTarget.video.trailerFLV.activeVideoPlayerIndex).close()
						Site.getApp().setSound(true);
						
					} else {
						timeline.gotoAndStop( link );
					
					}
					registerTween( "alphaGlobal", new Tween(timeline, "alpha", Regular.easeOut, 0, 1, 0.5, true) );
				});
			}
		}
		
		
	}

}