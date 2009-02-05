package com.dmotiko.luisbelgrano {
	
	import FLA.*;
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	
	public class LBPortfolioPhotoShower
	extends BaseClip {
		
		public static var SLIDER_NEXT:String = "photoslider_next";
		public static var SLIDER_PREV:String = "photoslider_prev";
		public static var SLIDER_CLOSE:String = "photoslider_close";
		
		private var loader:Loader;
		private var shadowAlpha:Tween;
		private var clipAlpha:Tween;
		private var clip:*;
		
		public function LBPortfolioPhotoShower() {
			super();
		}
		override protected function initClip():void {
			
		}
		
		override protected function refreshData():void {
			var photo:LBPortfolioPhoto = getData() as LBPortfolioPhoto;
			var sType:String = photo.getType();
			var showerClass:Class;
			
			switch(sType) {
				
				case LBPortfolioPhoto.PHOTO_WIDE:
				showerClass = photoShowerA;
				break;
				
				case LBPortfolioPhoto.PHOTO_SQUARE:
				showerClass = photoShowerB;
				break;
				
				case LBPortfolioPhoto.PHOTO_VERTICAL:
				showerClass = photoShowerC;
				break;
				
				case LBPortfolioPhoto.PHOTO_TRANSPARENT:
				showerClass = photoShowerD;
				break;
			}
			removePhotoShower(undefined);
			clip = new showerClass();
			this.addChild(clip);
			clip.alpha = 0;
			clip.setData( photo );
			clip.addEventListener( SLIDER_NEXT, nextPhoto);
			clip.addEventListener( SLIDER_PREV, prevPhoto);
			clip.addEventListener( BaseClip.CLIP_HIDDEN, removePhotoShower);
			if ( clipAlpha ) { clipAlpha.stop(); clipAlpha = null };
			clipAlpha = new Tween( clip, "alpha", Regular.easeOut, 0, 1, 1.5, true);
			clipAlpha.addEventListener( TweenEvent.MOTION_FINISH, function(evnt) {
				clip.showButtons();
			});
		}
		
		private function nextPhoto( evnt:Event ):void {
			dispatchEvent( new Event( SLIDER_NEXT ) );
		}
		private function prevPhoto( evnt:Event ):void {
			dispatchEvent( new Event( SLIDER_PREV ) );
		}
		private function removePhotoShower( evnt:Event ):void {
			if (clip) {
				this.removeChild(clip);
				clip = null;
			}
		}
		
	}
	
}