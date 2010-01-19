package com.zero.snap {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.filters.DropShadowFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.*;
	import flash.net.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	
	public class Site
	extends WebSite {
		
		public static var HOME:String = "snap_home";
		public static var PRODUCTION:String = "snap_production";
		public static var HISTORY:String = "snap_history";
		public static var VISION:String = "snap_vision";
		public static var WORK_IN_PROGRESS:String = "snap_work";
		public static var REEL:String = "snap_reel";
		public static var WORKS:String = "snap_works";
		public static var STAFF:String = "snap_staff";
		public static var PARTNERS:String = "snap_partners";
		public static var BROCHURE:String = "snap_brochure";
		public static var CLIENTS:String = "snap_clients";
		public static var CONTACT:String = "snap_contact";
		
		public static var SPANISH:String = "SPANISH";
		public static var ENGLISH:String = "ENGLISH";
		
		public static var HIGHLIGHT_SECTION:String = "snap_highlight_section_event";
		
		public var mcPlaca:MovieClip;
		public var mcSombra:MovieClip;
		public var mcScroll:ScrollBar;
		public var mcMask:MovieClip;
		public var mcFondo:MovieClip;
		public var worksBar:MovieClip;
		
		private var t:Tween;
		private var sndController:SoundController;
		private var tooltip:SnapTooltip;
		private var tooltipTween:Tween;
		private var bZoomed:Boolean;
		
						
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():Site {
			return Site(app);
		}
		
		public function Site() {
			super();
			stage.align = "TC";
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
		}
				
		override protected function initSite():void {
			this.sSection = Site.HOME;
			this.sLanguage = Site.SPANISH;
			
			super.initSite();
			
			mcPlaca.mask = mcMask;
			mcSombra.alpha = 0.6;
			mcSombra.mouseEnabled = false;
			mcScroll.addEventListener( Event.CHANGE, scroll_change);
			mcScroll.addEventListener( Event.ACTIVATE, init_scroll );
			
			tooltip = new SnapTooltip();
			tooltip.mouseEnabled = false;
			tooltip.mouseChildren = false;
			tooltip.alpha = 0;
			var dropShadow:DropShadowFilter = new DropShadowFilter();
			dropShadow.strength = 0.5;
			dropShadow.quality = 5;
			tooltip.filters = new Array(dropShadow);

			addChild(tooltip);
		}
		
		public function showTooltip(sMessage:String, clipBounds:Rectangle):void {
			if ( tooltipTween ) tooltipTween.stop();
			
			var point:Point = new Point();
			point.x = clipBounds.left + clipBounds.width / 2;
			point.y = clipBounds.top + clipBounds.height / 2;
						
			tooltipTween = new Tween( tooltip, "alpha", Regular.easeOut, tooltip.alpha, 1, 0.5, true );
			tooltip.setText( sMessage, point, undefined, false );
		}
		public function hideTooltip():void {
			if ( tooltipTween ) tooltipTween.stop();
			tooltipTween = new Tween( tooltip, "alpha", Regular.easeOut, tooltip.alpha, 0, 0.5, true );
		}
		
		public function highlightSection(sSection:String):void {
			dispatchEvent( new SiteEvent( Site.HIGHLIGHT_SECTION, sSection ) );
		}
		
		private function init_scroll(e:Event):void 
		{
			//log("init_scroll settingPos 59");
			mcScroll.setPos(59);
			scroll_change(undefined);
			
		}
		
		override public function setSection(s:String):void {
			super.setSection(s);
			switch(s) {
				case HOME:
				zoomOut();
				sombraOut();
				new Tween( worksBar, "y", Regular.easeOut, worksBar.y, 645, 0.5, true);
				break;
				
				case WORKS:
				case REEL:
				zoomIn();
				sombraIn();
				mcScroll.setPos( 59 );
				new Tween( worksBar, "y", Regular.easeOut, worksBar.y, 360, 0.5, true);
				break;
				
				case PRODUCTION:
				case HISTORY:
				case VISION:
				case WORK_IN_PROGRESS:
				mcScroll.setPos( 0 );
				placaIn();
				break;
				
				case STAFF:
				case PARTNERS:
				case CONTACT:
				case CLIENTS:
				case BROCHURE:
				mcScroll.setPos( 100 );
				placaIn();
				break;
			}
		}
		
		public function placaIn(){
			new Tween(mcPlaca, "y", Strong.easeOut, mcPlaca.y, 0, 0.5, true);
		}
		public function placaOut(){
			new Tween(mcPlaca, "y", Strong.easeOut, mcPlaca.y, -560, 0.5, true);
		}


		public function zoomIn(){
			if ( bZoomed ) return;
			bZoomed = true;
			new Tween(this, "scaleY", Strong.easeOut, this.scaleY, 1.5, 0.5, true);
			new Tween(this, "scaleX", Strong.easeOut, this.scaleX, 1.5, 0.5, true);
			new Tween(this, "x", Strong.easeOut, this.x, this.x - 300, 0.5, true);
			new Tween(this, "y", Strong.easeOut, this.y, this.y - 80, 0.5, true);
		}
		public function zoomOut(){
			if ( !bZoomed ) return;
			bZoomed = false;
			new Tween(this, "scaleY", Strong.easeOut, this.scaleY, 1, 0.5, true);
			new Tween(this, "scaleX", Strong.easeOut, this.scaleX, 1, 0.5, true);
			new Tween(this, "x", Strong.easeOut, this.x, 0, 0.5, true);
			new Tween(this, "y", Strong.easeOut, this.y, 0, 0.5, true);
		}
		public function sombraIn(){
			new Tween(mcSombra, "alpha", Regular.easeOut, mcSombra.alpha, 1, 0.5, true);
		}
		public function sombraOut(){
			new Tween(mcSombra, "alpha", Regular.easeOut, mcSombra.alpha, 0.6, 0.5, true);
		}

		private function scroll_change(e:Event):void {
			//log("scroll_change= " + mcScroll.getPos());
			setPos( mcScroll.getPos() );
		}

		public function getPos():Number {
			return Math.round( mcFondo.x * 100 /(this.width - mcFondo.width) );
		}

		public function setPos(n):void {
			var nX:Number = -(n * (mcFondo.width - 1000) / 100);
			mcFondo.x = nX;
			
		}


		
		public function getMusic():Sound { return sndController.getMusic(); }
		public function getMusicChannel():SoundChannel { return sndController.getMusicChannel(); }
				
		override public function setSound(bSound:Boolean):void {
			super.setSound(bSound);
			if (!bSound) sndController.fadeOutMusic();
			else sndController.fadeInMusic();
		}
		
	}
	
}