package com.dmotiko.luisbelgrano {
	
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Video;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	public class LBPhotoShowerTransparent
	extends BaseClip {
			
		private var loader:Loader;
		private var clipAlpha:Tween;
		private var tweens:Array;
		
		public function LBPhotoShowerTransparent() {
			super();
		}
		override protected function initClip():void {
			btnPrev.addEventListener( MouseEvent.CLICK, btnClick);
			btnNext.addEventListener( MouseEvent.CLICK, btnClick);
			btnClose.addEventListener( MouseEvent.CLICK, btnClick);
			btnZoom.addEventListener( MouseEvent.CLICK, btnClick);
			btnPrev.mouseEnabled = btnNext.mouseEnabled = btnZoom.mouseEnabled = btnClose.mouseEnabled = false;
			btnPrev.alpha = btnNext.alpha = btnZoom.alpha = btnClose.alpha = mcZoomStroke.alpha = 0;
		}
		
		private function btnClick( evnt:MouseEvent ):void {
			var sType:String;
			var clip = this;
			if ( evnt.currentTarget == btnPrev) {
				sType = LBPortfolioPhotoShower.SLIDER_PREV;
			} else if ( evnt.currentTarget == btnNext) {
				sType = LBPortfolioPhotoShower.SLIDER_NEXT;
			} else if ( evnt.currentTarget == btnZoom) {
				var photo:LBPortfolioPhoto = getData() as LBPortfolioPhoto;
				if( mcPhotoZoom.getData() != photo ){
					mcPhotoZoom.setData( photo );
				} else {
					mcPhotoZoom.show();
				}
				tweens.push( new Tween( clip.mcPhoto, "alpha", Regular.easeOut, clip.mcPhoto.alpha, 0, 1, true) );
				tweens.push( new Tween( clip.btnZoom, "alpha", Regular.easeOut, clip.btnZoom.alpha, 0, 1, true) );
				tweens.push( new Tween( clip.btnClose, "alpha", Regular.easeOut, clip.btnClose.alpha, 1, 1, true) );
				clip.btnZoom.mouseEnabled = false;
				clip.btnClose.mouseEnabled = true;
				return;
			} else if ( evnt.currentTarget == btnClose) {
				tweens.push( new Tween( clip.mcPhoto, "alpha", Regular.easeOut, clip.mcPhoto.alpha, 1, 1, true) );
				tweens.push( new Tween( clip.btnZoom, "alpha", Regular.easeOut, clip.btnZoom.alpha, 1, 1, true) );
				tweens.push( new Tween( clip.btnClose, "alpha", Regular.easeOut, clip.btnClose.alpha, 0, 1, true) );
				clip.btnZoom.mouseEnabled = true;
				clip.btnClose.mouseEnabled = false;
				mcPhotoZoom.hide();
				return;
			}
			dispatchEvent( new Event( sType ) );
		}
		
		override public function hide():void {
			
		}
		
		override protected function refreshData():void {
			var photo:LBPortfolioPhoto = getData() as LBPortfolioPhoto;
			var sNoCache:String = ( LBSite.getApp() ) ? LBSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( photo.getSrc() + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, photoInit);
			this.loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, photoProgress);
		}
		
		private function photoProgress( evnt:ProgressEvent ):void {
			var nPercent:int = evnt.bytesLoaded * 100 / evnt.bytesTotal;
			mcLoader.bar["tween"] = new Tween(mcLoader.bar, "x", Regular.easeOut, mcLoader.bar.x, nPercent-mcLoader.bar.width, 0.3, true);
		}
		
		private function photoInit( evnt:Event ):void {
			removeChild(mcLoader);
			mcPhoto.addChild( evnt.currentTarget.content);
			mcPhoto.alpha = 0;
			if (clipAlpha) {  clipAlpha.stop(); clipAlpha = null; }
			clipAlpha = new Tween( mcPhoto, "alpha", Regular.easeOut, mcPhoto.alpha, 1, 1, true);
		}
		
		public function showButtons():void {
			tweens = new Array();
			var btn:SimpleButton;
			var alphaTween:Tween;
			var offsetTween:Tween;
			var offset:Number;
			var prop:String;
			
			btn = btnPrev;
			prop = "x";
			offset = 10;
			alphaTween = new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 1, true);
			offsetTween = new Tween( btn, prop, Elastic.easeOut, btn[prop] + offset, btn[prop], 1, true);
			tweens.push( alphaTween, offsetTween);
			btn.mouseEnabled = true;
			
			btn = btnNext;
			prop = "x";
			offset = -10;
			alphaTween = new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 1, true);
			offsetTween = new Tween( btn, prop, Elastic.easeOut, btn[prop] + offset, btn[prop], 1, true);
			tweens.push( alphaTween, offsetTween);
			btn.mouseEnabled = true;
			
			var sZoom:String = (getData() as LBPortfolioPhoto).getZoomSrc();
			if(  sZoom && sZoom != ""){
				btn = btnZoom;
				prop = "x";
				offset = -10;
				alphaTween = new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 1, true);
				offsetTween = new Tween( btn, prop, Elastic.easeOut, btn[prop] + offset, btn[prop], 1, true);
				tweens.push( alphaTween, offsetTween);
				btn.mouseEnabled = true;
				
				alphaTween = new Tween( mcZoomStroke, "alpha", Regular.easeOut, mcZoomStroke.alpha, 1, 1, true);
			}
			
		}
		
		
	}
	
}