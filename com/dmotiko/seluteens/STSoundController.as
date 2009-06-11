package com.dmotiko.seluteens {
	
	import com.general.WebSite;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.getTimer;
		
	public class STSoundController
	extends EventDispatcher {
		
		private var music:Sound;
		private var musicChannel:SoundChannel;
		private var soundTween:Tween;
		private var soundController:Object;
		
		function STSoundController() {
			
			music = new Sound( new URLRequest( STSite.getApp().loaderInfo.parameters["music_src"] ) );
			music.addEventListener( Event.COMPLETE, snd_complete );
			music.addEventListener( ProgressEvent.PROGRESS, snd_progress );
			soundController = new Object();
			soundController.volume = 1;
			soundController.position = 0;
			soundController.startDownload = getTimer();
			
		}
		
		public function getMusic():Sound { return music; }
		public function getMusicChannel():SoundChannel { return musicChannel; }
				
		public function fadeOutMusic():void {
			if ( soundController.volume == 0) return;
			if (soundTween) soundTween.stop();
			soundTween = new Tween(soundController, "volume", Regular.easeOut, soundController.volume, 0, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
			soundTween.addEventListener(TweenEvent.MOTION_FINISH, stop_music);
		}
			
		public function fadeInMusic():void {
			if ( ! STSite.getApp().getSound() || soundController.volume == 1) return;
			musicChannel = music.play( soundController.position );
			if (soundTween) soundTween.stop();
			soundTween = new Tween(soundController, "volume", Regular.easeOut, soundController.volume, 1, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
		}
		
		private function snd_progress(e:ProgressEvent):void {
			var p:int = Math.round(e.bytesLoaded * 100 / e.bytesTotal );
			if (p > 50) {
				music.removeEventListener( ProgressEvent.PROGRESS, snd_progress);
				musicChannel = music.play();
				musicChannel.addEventListener( Event.SOUND_COMPLETE, loop_music);
				STSite.getApp().setSound(true);
			}
		}
		
		private function snd_complete(e:Event):void {
			//STSite.log("snd complete");
		}
		
		private function loop_music(e:Event):void {
			musicChannel.stop();
			soundController.position = 0;
			musicChannel = music.play( soundController.position );
		}
		
		private function stop_music(e:TweenEvent):void 	{
			soundController.position = getMusicChannel().position;
			getMusicChannel().stop();
		}
				
		private function refresh_fade(e:TweenEvent):void {
			var transform:SoundTransform = getMusicChannel().soundTransform;
			transform.volume = soundController.volume;
			getMusicChannel().soundTransform = transform;
		}
		
	}
	
}