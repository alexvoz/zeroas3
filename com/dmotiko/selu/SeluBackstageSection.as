package com.dmotiko.selu {
	
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import fl.video.*;
		
	public class SeluBackstageSection
	extends BaseClip {
		
		public var flvPlayer:FLVPlayback;
		public var spPlay:Sprite;
		public var spPause:Sprite;
		public var spStop:Sprite;
		public var spSeek:Sprite;
		private var volumeController:Object;
		private var tVolume:Tween;
				
		override protected function initClip():void {
			super.initClip();
			
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			SeluSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
												
			//inicializo los clips
			spPlay.buttonMode = spPause.buttonMode = spStop.buttonMode = true;
			spPlay.addEventListener( MouseEvent.ROLL_OVER, btn_over );
			spPlay.addEventListener( MouseEvent.ROLL_OUT, btn_out);
			spPause.addEventListener( MouseEvent.ROLL_OVER, btn_over );
			spPause.addEventListener( MouseEvent.ROLL_OUT, btn_out);
			spStop.addEventListener( MouseEvent.ROLL_OVER, btn_over );
			spStop.addEventListener( MouseEvent.ROLL_OUT, btn_out);
			spStop.addEventListener( MouseEvent.CLICK, reset_video);
			
			flvPlayer.playButton = spPlay;
			flvPlayer.pauseButton = spPause;
			flvPlayer.stopButton = spStop;
			flvPlayer.seekBar = spSeek;
			flvPlayer.autoPlay = false;
			flvPlayer.addEventListener(VideoEvent.STATE_CHANGE, video_change);
			flvPlayer.load( SeluSite.getApp().loaderInfo.parameters["video_src"] );
			volumeController = new Object();
			if ( SeluSite.getApp().getSound() ) volumeController.volume = 1;
			else volumeController.volume = 0;
		}
		
		private function sound_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() != SeluSite.BACKSTAGE) return;
			if ( SeluSite.getApp().getSound() ) {
				//volumeController.volume = 1;
				videoFadeIn();
			} else {
				videoFadeOut();
			}
			
		}
						
		private function video_change(e:VideoEvent):void {
			SeluSite.log("video_change= " + e.state);
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.BACKSTAGE ) {
				flvPlayer.playWhenEnoughDownloaded();
				if ( !SeluSite.getApp().getSound() ) return;
				videoFadeIn();
			} else {
				if( flvPlayer.state != "stopped"){
					if ( !SeluSite.getApp().getSound() ) {
						stop_flv(undefined);
						return;
					}
					videoFadeOut();
				}
				SeluSite.getApp().fadeInMusic();
			}
		}
		
		private function videoFadeOut():void {
			if ( tVolume ) tVolume.stop();
			tVolume = new Tween(volumeController, "volume", Regular.easeOut, volumeController.volume, 0, 2, true);
			tVolume.addEventListener( TweenEvent.MOTION_CHANGE, refresh_volume);
			tVolume.addEventListener( TweenEvent.MOTION_FINISH, stop_flv);
		}
		
		private function videoFadeIn():void	{
			if ( tVolume ) tVolume.stop();
			tVolume = new Tween(volumeController, "volume", Regular.easeOut, volumeController.volume, 1, 2, true);
			tVolume.addEventListener( TweenEvent.MOTION_CHANGE, refresh_volume);
			SeluSite.getApp().fadeOutMusic();
		}
		
		private function refresh_volume(e:TweenEvent):void {
			flvPlayer.volume = volumeController.volume;
		}
		
		private function stop_flv(e:TweenEvent):void {
			flvPlayer.seek(0);
			flvPlayer.stop();
		}
		
		private function reset_video(e:MouseEvent):void {
			flvPlayer.seekPercent(0);
		}
		
		private function btn_over( e:MouseEvent ):void {
			var btn:Sprite = e.currentTarget as Sprite;
			killTween( "btnOver" );
			registerTween("btnOver", new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 0.7, 0.3, true) );
		}
		private function btn_out( e:MouseEvent ):void {
			var btn:Sprite = e.currentTarget as Sprite;
			killTween( "btnOut" );
			registerTween("btnOut", new Tween( btn, "alpha", Regular.easeOut, btn.alpha, 1, 0.3, true) );
		}
		
		
	}
	
}