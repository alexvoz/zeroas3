﻿package com.dmotiko.luisbelgrano {
	
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Video;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	public class LBPhotoShowerTemplate
	extends BaseClip {
			
		private var loader:Loader;
		private var shadowAlpha:Tween;
		private var clipAlpha:Tween;
		private var _tweens:Array;
		
		public function LBPhotoShowerTemplate() {
			super();
		}
		override protected function initClip():void {
			function btnCloseClick( evnt ) {
				hide();
			}
			mcPhoto.mask = mcMask;
			btnZoom.visible = false;
			if(btnClose) btnClose.addEventListener( MouseEvent.CLICK, btnCloseClick);
			btnPrev.addEventListener( MouseEvent.CLICK, btnClick);
			btnNext.addEventListener( MouseEvent.CLICK, btnClick);
			
			if (btnClose) btnClose.alpha = 0;
			btnPrev.alpha = btnNext.alpha = btnZoom.alpha = 0;
			
		}
		
		private function btnClick( evnt:MouseEvent ):void {
			var sType:String;
			if ( evnt.currentTarget == btnPrev) sType = LBPortfolioPhotoShower.SLIDER_PREV;
			else if ( evnt.currentTarget == btnNext) sType = LBPortfolioPhotoShower.SLIDER_NEXT;
			dispatchEvent( new Event( sType ) );
		}
		
		override public function hide():void {
			shadowAlpha = new Tween( this, "alpha", Regular.easeOut, this.alpha, 0, 1, true);
			shadowAlpha.addEventListener( TweenEvent.MOTION_FINISH, function(evn) { 
				hideEnd();
				}
			);
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
			_tweens = new Array();
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
			_tweens.push( alphaTween, offsetTween);
			
			btn = btnNext;
			prop = "x";
			offset = -10;
			alphaTween = new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 1, true);
			offsetTween = new Tween( btn, prop, Elastic.easeOut, btn[prop] + offset, btn[prop], 1, true);
			_tweens.push( alphaTween, offsetTween);
			
			if( btnClose ){
				btn = btnClose;
				prop = "y";
				offset = 20;
				alphaTween = new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 0.5, true);
				offsetTween = new Tween( btn, prop, Elastic.easeOut, btn[prop] + offset, btn[prop], 1, true);
				_tweens.push( alphaTween, offsetTween);
			}
			
			btn = btnZoom;
			prop = "y";
			offset = 20;
			alphaTween = new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 0.5, true);
			offsetTween = new Tween( btn, prop, Elastic.easeOut, btn[prop] + offset, btn[prop], 1, true);
			_tweens.push( alphaTween, offsetTween);
		}
		
		
	}
	
}