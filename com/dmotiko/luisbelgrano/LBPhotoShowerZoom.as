package com.dmotiko.luisbelgrano {
	
	import com.general.*;
	import fl.motion.Tweenables;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.media.Video;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	public class LBPhotoShowerZoom
	extends BaseClip {
			
		private var loader:Loader;
		private var clipAlpha:Tween;
		private var tweens:Array;
		
		public function LBPhotoShowerZoom() {
			super();
		}
		
		override protected function initClip():void {
			mcLoader.visible = false;
			mcPhoto.mask = mcMask;
			btnLeft.mouseEnabled = btnRight.mouseEnabled = btnTop.mouseEnabled = btnBottom.mouseEnabled = false;
			bShowed = true;
		}
		
		private function btnClick( evnt:MouseEvent ):void {
			
		}
		
		override public function show():void {
			if ( bShowed ) return;
			if ( !tweens ) tweens = new Array();
			this.visible = true;
			var tween:Tween = new Tween( this, "alpha", Regular.easeOut, this.alpha, 1, 1, true);
			tween.addEventListener( TweenEvent.MOTION_FINISH, showEnd);
			tweens.push( tween );			
		}
		
		override protected function showEnd( evnt = undefined ):void {
			super.showEnd();
		}
		
		override public function hide():void {
			if ( !bShowed ) return;
			if ( !tweens ) tweens = new Array();
			var tween:Tween = new Tween( this, "alpha", Regular.easeOut, this.alpha, 0, 1, true);
			tween.addEventListener( TweenEvent.MOTION_FINISH, hideEnd);
			tweens.push( tween );
		}
		override protected function hideEnd( evnt = undefined ):void {
			this.visible = false;
			super.hideEnd();
		}
		
		override protected function refreshData():void {
			var photo:LBPortfolioPhoto = getData() as LBPortfolioPhoto;
			var sNoCache:String = ( LBSite.getApp() ) ? LBSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( photo.getZoomSrc() + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, photoInit);
			this.loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, photoProgress);
		}
		
		private function photoProgress( evnt:ProgressEvent ):void {
			var nPercent:int = evnt.bytesLoaded * 100 / evnt.bytesTotal;
			mcLoader.visible = true;
			mcLoader.bar["tween"] = new Tween(mcLoader.bar, "x", Regular.easeOut, mcLoader.bar.x, nPercent-mcLoader.bar.width, 0.3, true);
		}
		
		private function photoInit( evnt:Event ):void {
			removeChild(mcLoader);
			mcPhoto.addChild( evnt.currentTarget.content);
			mcPhoto.alpha = 0;
			if (clipAlpha) {  clipAlpha.stop(); clipAlpha = null; }
			clipAlpha = new Tween( mcPhoto, "alpha", Regular.easeOut, mcPhoto.alpha, 1, 1, true);
			if(mcPhoto.width > mcMask.width){
				btnLeft.mouseEnabled = true;
				btnLeft.addEventListener( MouseEvent.ROLL_OVER, scrollImg );
				btnRight.mouseEnabled = true;
				btnRight.addEventListener( MouseEvent.ROLL_OVER, scrollImg );
			} else {
				mcPhoto.x = ( mcMask.width - mcPhoto.width ) / 2;
			}
			if(mcPhoto.height > mcMask.height){
				btnTop.mouseEnabled = true;
				btnTop.addEventListener( MouseEvent.ROLL_OVER, scrollImg );
				btnBottom.mouseEnabled = true;
				btnBottom.addEventListener( MouseEvent.ROLL_OVER, scrollImg );
			} else {
				mcPhoto.y = ( mcMask.height - mcPhoto.height ) / 2;
			}
						
		}
		
		private function scrollImg( evnt:MouseEvent ):void {
			tweens = new Array();
			var sProp:String;
			var nEnd:Number;
			if ( evnt.currentTarget == btnLeft || evnt.currentTarget == btnRight) sProp = "x";
			else sProp = "y";
			
			if ( evnt.currentTarget == btnLeft) {
				nEnd = mcPhoto.x + mcMask.width / 2;
				if (nEnd > 0) nEnd = 0; 
			}
			if ( evnt.currentTarget == btnRight) {
				nEnd = mcPhoto.x - mcMask.width / 2;
				if (nEnd < 0 - mcPhoto.width + mcMask.width) nEnd = 0 - mcPhoto.width + mcMask.width; 
			}
			if ( evnt.currentTarget == btnTop) {
				nEnd = mcPhoto.y + mcMask.height / 2;
				if (nEnd > 0) nEnd = 0; 
			}
			if ( evnt.currentTarget == btnBottom) {
				nEnd = mcPhoto.y - mcMask.height / 2;
				if (nEnd < 0 - mcPhoto.height + mcMask.height) nEnd = 0 - mcPhoto.height + mcMask.height; 
			}
			
			var tween:Tween = new Tween( mcPhoto, sProp, Regular.easeOut, mcPhoto[sProp], nEnd, 1, true);
			tweens.push(tween);
			
		}
		
	}
	
}