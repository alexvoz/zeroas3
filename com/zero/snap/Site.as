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
	import fl.video.VideoEvent;
	import fl.video.*;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	
	
	public class Site
	extends WebSite {
		
		//custom event
		public static var HIGHLIGHT_SECTION:String = "snap_highlight_section_event";
		
		public static var HOME:String = "snap_home";
		
		public static var SPANISH:String = "SPANISH";
		public static var ENGLISH:String = "ENGLISH";
		
		//COCINA
		public static var ESPECIAS:String = "snap_especias";
		public static var CONSERVAS:String = "snap_conservas";
		public static var PRODUCTION:String = "snap_production";
		public static var BROCHURE:String = "snap_brochure";
		public static var CLIENTS:String = "snap_clients";
		
		//SHOWROOM
		public static var REEL:String = "snap_reel";
		public static var WORKS:String = "snap_works";
		public static var MARVISTA:String = "snap_marvista";
		
		//LIVING
		public static var HISTORY:String = "snap_history";
		public static var STAFF:String = "snap_staff";
		public static var PARTNERS:String = "snap_partners";
		public static var CONTACT:String = "snap_contact";
		
		//movieclips en pantalla
		public var mcPlaca:Board;
		public var mcSombra:MovieClip;
		public var mcScroll:ScrollBar;
		public var mcMask:MovieClip;
		public var mcFondo:MovieClip;
		public var worksBar:MovieClip;
		public var flvVideo:FLVPlayback;
		public var designBy:Sprite;
		
		private var t:Tween;
		private var sndController:SoundController;
		private var tooltip:SnapTooltip;
		private var tooltipTween:Tween;
		private var bZoomed:Boolean;
		private var placaTween:Tween;
		private var worksBarTween:Tween;
		private var flvVideoBack:Shape;
		private var flvVideoContainer:Sprite;
		
		private var music:Sound;
		private var musicChannel:SoundChannel;
		private var soundTween:Tween;
		private var soundController:Object;
		private var siteSound:SiteSound;
		private var timerMusic:Timer;
		
								
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
		
		public function getMusic():Sound { return music; }
		public function getMusicChannel():SoundChannel { return musicChannel; }
		
		override public function setSound(bSound:Boolean):void {
			super.setSound(bSound);
			if (!bSound) fadeOutMusic();
			else fadeInMusic();
		}
		
		public function fadeOutMusic():void {
			if ( soundController.volume == 0) return;
			if (soundTween) soundTween.stop();
			soundTween = new Tween(soundController, "volume", Regular.easeOut, soundController.volume, 0, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
			soundTween.addEventListener(TweenEvent.MOTION_FINISH, stop_music);
		}
			
		public function fadeInMusic():void {
			if ( !getSound() || getSection() == Site.WORKS || getSection() == Site.REEL || soundController.volume == 1) return;
			if (musicChannel) musicChannel.stop();
			musicChannel = music.play( soundController.position );
			musicChannel.addEventListener( Event.SOUND_COMPLETE, loop_music);
			if (soundTween) soundTween.stop();
			soundTween = new Tween(soundController, "volume", Regular.easeOut, soundController.volume, 1, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
		}
		
		private function refresh_fade(e:TweenEvent):void {
			var transform:SoundTransform = getMusicChannel().soundTransform;
			transform.volume = soundController.volume;
			getMusicChannel().soundTransform = transform;
		}
		
		private function stop_music(e:TweenEvent):void 	{
			soundController.position = getMusicChannel().position;
			getMusicChannel().stop();
		}
				
		override protected function initSite():void {
			this.sSection = Site.HOME;
			this.sLanguage = Site.SPANISH;
			
			super.initSite();
			
			designBy.addEventListener( MouseEvent.ROLL_OVER, designBy_event);
			designBy.addEventListener( MouseEvent.ROLL_OUT, designBy_event);
			designBy.addEventListener( MouseEvent.CLICK, designBy_event);
			designBy.buttonMode = true;
			if ( !this.getSWF_VAR("SHOW_FIRM") ) removeChild( designBy );
			
			mcPlaca = new Board();
			mcPlaca.y = -560;
			mcPlaca.mask = mcMask;
			addChild(mcPlaca);
			
			mcSombra.alpha = 0.2;
			mcSombra.mouseEnabled = false;
			mcScroll.addEventListener( Event.CHANGE, scroll_change);
			
			tooltip = new SnapTooltip();
			tooltip.mouseEnabled = false;
			tooltip.mouseChildren = false;
			tooltip.alpha = 0;
			var dropShadow:DropShadowFilter = new DropShadowFilter();
			dropShadow.strength = 0.5;
			dropShadow.quality = 5;
			tooltip.filters = new Array(dropShadow);
			
			addChild(tooltip);
			
			//flvVideoBack | armo el fondito negro por las dudas que el ratio del video no de
			flvVideoBack = new Shape();
			flvVideoBack.graphics.beginFill(0);
			flvVideoBack.graphics.drawRect(0, 0, 525, 301);
						
			//flvVideoContainer | hago un contenedor para el fondo y el video asi posiciono todo junto
			flvVideoContainer = new Sprite();
			flvVideoContainer.addChild(flvVideoBack);
			flvVideoContainer.x = 267;
			flvVideoContainer.y = 100;
			
			//flvVideoSettings | instancio el componente y lo seteo
			this.instanceFLVVideo();
			
			//SONIDO
			siteSound = new soundIcon();
			siteSound.x = 40;
			siteSound.y = 570;
			addChild( siteSound );
						
			var sndSrc:String = this.loaderInfo.parameters["music_src"];
			if (!sndSrc) sndSrc = "big_band.mp3";
			
			music = new Sound( new URLRequest( sndSrc ) );
			music.addEventListener( ProgressEvent.PROGRESS, snd_progress );
			soundController = new Object();
			soundController.volume = 1;
			soundController.position = 0;
			soundController.startDownload = getTimer();
			/*
			timerMusic = new Timer(7000);
			timerMusic.addEventListener( TimerEvent.TIMER, loop_music );
			*/
			
			//NAVEGACION SUPERIOR
			var nextRoom:TopNavigation = new TopNavigation();
			nextRoom.name = "nextRoom";
			addChild(nextRoom);
			nextRoom.x = mcPlaca.getBounds(this).right - nextRoom.width;
			nextRoom.setMessage("Distribucion");
			nextRoom.addEventListener( MouseEvent.CLICK, gotoNextRoom, false, 0, true);
			
			var prevRoom:TopNavigation = new TopNavigation(true);
			prevRoom.name = "prevRoom";
			prevRoom.x = mcPlaca.getBounds(this).left;
			addChild(prevRoom);
			prevRoom.setMessage("Producción");
			prevRoom.addEventListener( MouseEvent.CLICK, gotoPrevRoom, false, 0, true);
			
			init_scroll(undefined);
		}
		
		private function designBy_event(e:MouseEvent):void 
		{
			if ( e.type == MouseEvent.ROLL_OVER ) {
				showTooltip("Diseño Web | 76", (e.currentTarget as Sprite).getBounds(this));
			} else if ( e.type == MouseEvent.ROLL_OUT ) {
				hideTooltip();
			} else if ( e.type == MouseEvent.CLICK ) {
				navigateToURL( new URLRequest("http://www.seventysix.com.ar"), "_blank" );
			}
		}
		
		private function instanceFLVVideo():void {
			log("instanceFLVVideo()");
			
			if (flvVideo) {
				if (flvVideoContainer.contains( flvVideo ) ) flvVideoContainer.removeChild( flvVideo );
				flvVideo.getVideoPlayer(0).close();
				flvVideo = null;
			}
			
			flvVideo = new FLVPlayback();
			flvVideo.width = 525;
			flvVideo.height = 393;
			flvVideo.registrationHeight = 300;
			flvVideo.registrationY = 0;
			flvVideo.align = VideoAlign.CENTER;
			flvVideo.scaleMode = VideoScaleMode.MAINTAIN_ASPECT_RATIO;
			flvVideo.skinBackgroundColor = 0;
			flvVideo.skin = "SkinOverPlaySeekStop.swf";
			flvVideo.bufferTime = 2;
			flvVideo.autoPlay = true;
			flvVideo.autoRewind = false;
			flvVideo.skinAutoHide = true;
			flvVideo.addEventListener( VideoEvent.STATE_CHANGE, video_change, false, 0, true );
			flvVideoContainer.addChild(flvVideo);
			
		}
		
		private function gotoPrevRoom(e:MouseEvent):void 
		{
			var nPos:Number = mcScroll.getPos();
			if ( nPos > 40 && nPos < 80 ) { 
				mcScroll.setPosAnimated(0); 
				
			} else if ( nPos >= 80 ) {
				mcScroll.setPosAnimated(59); 
			}
		}
		
		private function gotoNextRoom(e:MouseEvent):void 
		{
			var nPos:Number = mcScroll.getPos();
			if ( nPos > 40 && nPos < 80 ) { 
				mcScroll.setPosAnimated(100); 
				
			} else if ( nPos <= 40 ) {
				mcScroll.setPosAnimated(59);
			}
		}
		
		private function snd_progress(e:ProgressEvent):void {
			var p:int = Math.round(e.bytesLoaded * 100 / e.bytesTotal );
			if (p > 35) {
				music.removeEventListener( ProgressEvent.PROGRESS, snd_progress);
				if (musicChannel) musicChannel.stop();
				musicChannel = music.play();
				musicChannel.addEventListener( Event.SOUND_COMPLETE, timer_music);
				setSound(true);
			}
		}
		
		private function timer_music(e:Event):void 
		{
			musicChannel.stop();
			soundController.position = 0;
			loop_music(e);
			/*
			timerMusic.reset();
			timerMusic.start();
			*/
		}
				
		private function loop_music(e:Event):void {
			//timerMusic.stop();
			if (musicChannel) musicChannel.stop();
			musicChannel = music.play( soundController.position );
			musicChannel.addEventListener( Event.SOUND_COMPLETE, timer_music);
		}
		
		private function video_change(e:VideoEvent):void 
		{
			log("Site video_change | "+e.state);
			switch( Site.getApp().getSection() ) {
				
				case Site.WORKS:
				case Site.REEL:
				break;
				
				default:
				try { 
					this.instanceFLVVideo();
					
				} catch (e) {
					log("Site video_change error "+e);
				}
				break;
			}
		}
		
		public function setVideo(src:String):void {
			log("Site | thumb_click -> setVideo "+src);
			if ( getSection() != Site.REEL && getSection() != Site.WORKS ) return;
			log("Site | thumb_click -> setVideo OK");
			instanceFLVVideo();
			flvVideo.play(src, 0);
		}
		
		public function showTooltip(sMessage:String, clipBounds:Rectangle):void {
			var point:Point = new Point();
			point.x = clipBounds.left + clipBounds.width / 2 + 14;
			point.y = clipBounds.top + clipBounds.height / 2 - 5;
						
			registerTween("tooltipTween", new Tween( tooltip, "alpha", Regular.easeOut, tooltip.alpha, 1, 0.5, true ) );
			tooltip.setText( sMessage, point, undefined, false );
		}
		public function hideTooltip():void {
			registerTween("tooltipTween", new Tween( tooltip, "alpha", Regular.easeOut, tooltip.alpha, 0, 0.5, true ) );
		}
		
		public function highlightSection(sSection:String):void {
			dispatchEvent( new SiteEvent( Site.HIGHLIGHT_SECTION, sSection ) );
		}
		
		private function init_scroll(e:Event):void 
		{
			//Site.log("Site | Scroll activate" );
			mcScroll.setPos(59);
			scroll_change(undefined);
			
		}
		
		override public function setSection(s:String):void {
			super.setSection(s);
			siteSound.visible = true;
						
			switch(s) {
				case HOME:
				zoomOut();
				sombraOut();
				fadeInMusic();
				break;
				
				case WORKS:
				case REEL:
				zoomIn();
				sombraIn();
				fadeOutMusic();
				siteSound.visible = false;
				break;
				
				case PRODUCTION:
				case ESPECIAS:
				case CONSERVAS:
				case CLIENTS:
				mcScroll.setPos( 0 );
				placaIn();
				fadeInMusic();
				break;
				
				case STAFF:
				case CONTACT:
				case HISTORY:
				mcScroll.setPos( 59 );
				placaIn();
				fadeInMusic();
				break;
				
				case PARTNERS:
				mcScroll.setPos( 100 );
				placaIn();
				fadeInMusic();
				break;
				
				case BROCHURE:
				navigateToURL( new URLRequest("snap_brochure.pdf"), "_blank" );
				break;
				
				case MARVISTA:
				navigateToURL( new URLRequest("http://www.marvista.net/programing-catalog.php"), "_blank" );
				break;
			}
		}
		
		public function placaIn(){
			registerTween("placaTween", new Tween(mcPlaca, "y", Strong.easeOut, mcPlaca.y, 0, 0.5, true) );
			this.getChildByName("prevRoom").visible = false;
			this.getChildByName("nextRoom").visible = false;
		}
		public function placaOut(){
			registerTween("placaTween", new Tween(mcPlaca, "y", Strong.easeOut, mcPlaca.y, -560, 0.5, true) );
			setPos( mcScroll.getPos() );
		}


		public function zoomIn(){
			if ( bZoomed ) return;
			bZoomed = true;
			var clip = mcFondo;
			registerTween("fondoScaleY", new Tween(clip, "scaleY", Strong.easeOut, clip.scaleY, 1.5, 0.5, true) );
			registerTween("fondoScaleX", new Tween(clip, "scaleX", Strong.easeOut, clip.scaleX, 1.5, 0.5, true) );
			registerTween("fondoMoveX", new Tween(clip, "x", Strong.easeOut, clip.x, -1650, 0.5, true) );
			registerTween("fondoMoveY", new Tween(clip, "y", Strong.easeOut, clip.y, -80, 0.5, true) );
			this.getChildByName("prevRoom").visible = false;
			this.getChildByName("nextRoom").visible = false;
			try{
				
				mcFondo.removeChild( mcFondo.loader ); //ver index.fla | mcFondo
				this.addChild( flvVideoContainer );
			} catch (e) {
				Site.log("Site.as | 404 | error de play "+e);
			}
		}
		public function zoomOut(){
			if ( !bZoomed ) return;
			bZoomed = false;
			var clip = mcFondo;
			registerTween("fondoScaleY", new Tween(clip, "scaleY", Strong.easeOut, clip.scaleY, 1, 0.5, true));
			registerTween("fondoScaleX", new Tween(clip, "scaleX", Strong.easeOut, clip.scaleX, 1, 0.5, true));
			registerTween("fondoMoveX", new Tween(clip, "x", Strong.easeOut, clip.x, -900, 0.5, true));
			registerTween("fondoMoveY", new Tween(clip, "y", Strong.easeOut, clip.y, 0, 0.5, true));
			this.getChildByName("prevRoom").visible = true;
			this.getChildByName("nextRoom").visible = true;
			try{
				this.instanceFLVVideo();
				mcFondo.addChild( mcFondo.loader ); //ver index.fla | mcFondo
				this.removeChild( flvVideoContainer );
			} catch (e) {
				Site.log("Site.as | 215 | error de stop "+e);
			}
		}
		public function sombraIn(){
			registerTween("sombraIn", new Tween(mcSombra, "alpha", Regular.easeOut, mcSombra.alpha, 1, 0.5, true));
		}
		public function sombraOut(){
			registerTween("sombraOut", new Tween(mcSombra, "alpha", Regular.easeOut, mcSombra.alpha, 0.2, 0.5, true));
		}

		private function scroll_change(e:Event):void {
			setPos( mcScroll.getPos() );
		}

		public function getPos():Number {
			return Math.round( mcFondo.x * 100 /(this.width - mcFondo.width) );
		}

		public function setPos(n):void {
			if ( n < 10 ) n = 10;
			else if ( n > 90 ) n = 90;
			var nX:Number = -(n * (mcFondo.width - 1112) / 100);
			mcFondo.x = nX;
			
			if ( n < 40 ) {
				this.getChildByName("prevRoom").visible = false;
				this.getChildByName("nextRoom").visible = true;
				(this.getChildByName("prevRoom") as TopNavigation).setMessage("");
				(this.getChildByName("nextRoom") as TopNavigation).setMessage("Showroom");
			} else if ( n > 40 && n < 80 ) {
				this.getChildByName("prevRoom").visible = true;
				this.getChildByName("nextRoom").visible = true;
				(this.getChildByName("prevRoom") as TopNavigation).setMessage("Produccion");
				(this.getChildByName("nextRoom") as TopNavigation).setMessage("Distribucion");
				
			} else if ( n > 80 ){
				this.getChildByName("prevRoom").visible = true;
				this.getChildByName("nextRoom").visible = false;
				(this.getChildByName("nextRoom") as TopNavigation).setMessage("");
				this.getChildByName("prevRoom").visible = true;
				(this.getChildByName("prevRoom") as TopNavigation).setMessage("Showroom");
			}
		}

	}
	
}