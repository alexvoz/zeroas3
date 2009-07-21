package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.*;
	import flash.utils.getTimer;
		
	public class SeluSite
	extends WebSite {
		
		public static const HOME:String = "SELU_HOME";
		public static const COLECCION:String = "SELU_COLECCION";
		public static const BACKSTAGE:String = "SELU_BACKSTAGE";
		public static const PUNTOVENTA:String = "SELU_PUNTOVENTA";
		public static const NOVEDADES:String = "SELU_NOVEDADES";
		public static const SEXIES:String = "SELU_SEXIES";
		public static const PRENSA:String = "SELU_PRENSA";
		public static const CONTACTO:String = "SELU_CONTACTO";
		public static const NOCASTING:String = "SELU_NOCASTING";
		private var mainContent:Sprite;
		private var topClip:Sprite;
		private var seluLoader:SeluLoader;
		private var music:Sound;
		private var musicChannel:SoundChannel;
		private var soundTween:Tween;
		private var soundController:Object;
		
		/* data XML */
		private var xmlContent:SeluXMLContent;
		/* end data XML*/
						
		
		//para evitar imports innecesarios
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():SeluSite {
			return SeluSite(app);
		}
						
		public function SeluSite() {
			super();
			getChildByName("mcCenter").visible = false;
			setCenterClip(getChildByName("mcCenter"));
			isFullFlash();
		}
				
		override protected function initSite():void {
			mainContent = this.addChild( new Sprite() ) as Sprite;
			topClip = this.addChild( new Sprite() ) as Sprite;
			this.sSection = SeluSite.HOME;
			super.initSite();
			
		}
		
		override protected function loadExternalContent():void {
			var sndSrc:String = this.loaderInfo.parameters["music_src"];
			if (!sndSrc) sndSrc = "music2009.mp3";
			
			music = new Sound( new URLRequest( sndSrc ) );
			music.addEventListener( Event.COMPLETE, snd_complete );
			music.addEventListener( ProgressEvent.PROGRESS, snd_progress );
			soundController = new Object();
			soundController.volume = 1;
			soundController.position = 0;
			soundController.startDownload = getTimer();
			
			xmlContent = new SeluXMLContent();
			xmlContent.addEventListener( Event.COMPLETE, externalContentLoaded);
			
		}
				
		private function snd_progress(e:ProgressEvent):void {
			var p:int = Math.round(e.bytesLoaded * 100 / e.bytesTotal );
			if (p > 35) {
				music.removeEventListener( ProgressEvent.PROGRESS, snd_progress);
				musicChannel = music.play();
				musicChannel.addEventListener( Event.SOUND_COMPLETE, loop_music);
				setSound(true);
			}
		}
		
		private function snd_complete(e:Event):void {
			SeluSite.log("SeluSite | snd complete");
		}
		
		private function loop_music(e:Event):void {
			musicChannel.stop();
			soundController.position = 0;
			musicChannel = music.play( soundController.position );
		}
			
		// TODO esto vuela más tarde
		override public function setSection( s:String ):void {
			if ( /*s == SeluSite.NOVEDADES || s == SeluSite.PRENSA ||  */ s== SeluSite.SEXIES ) return;
			super.setSection( s );
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			getChildByName("mcSeluLoader").addEventListener( Event.CHANGE, hideLoader);
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest("mainContent.swf"+getNoCache()); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			mLoader.load(mRequest);			
		}
		
		private function hideLoader(e:Event):void {
			//getChildByName("mcSeluLoader").visible = false;
			removeChild( getChildByName("mcSeluLoader") );
		}
		
		private function onProgressHandler(evnt:ProgressEvent) {         
			var nP:Number = Math.round( evnt.bytesLoaded * 100 / evnt.bytesTotal );
			(getChildByName("mcSeluLoader") as SeluLoader).setPos( nP );
		}
		
		private function onCompleteHandler(loadEvent:Event) {         
			mainContent.addChild(loadEvent.currentTarget.content);
		}
		
		public function getTopClip():Sprite { return topClip; }
		
		public function getNewsData():XMLList { return xmlContent.getNewsData(); };
		public function getCollectionData():XMLList { return xmlContent.getCollectionData();	}
		public function getCollectionBasicData():XMLList { return xmlContent.getCollectionBasicData();	}
		public function getStoresData():XMLList { return xmlContent.getStoresData(); }
		public function getSexiesData():XMLList { return xmlContent.getSexiesData(); }
		public function getPressData():XMLList { return xmlContent.getPressData(); }
		
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
			if ( !getSound() || getSection() == SeluSite.BACKSTAGE || soundController.volume == 1) return;
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
		
	}
	
}