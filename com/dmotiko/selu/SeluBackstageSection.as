package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import fl.video.*;
	
	public class SeluBackstageSection
	extends BaseClip {
		
		private var videoPlayer:FLVPlayback;
		private var playButton:Sprite;
		private var pauseButton:Sprite;
		private var stopButton:Sprite;
				
		override protected function initClip():void {
			super.initClip();
			trace("SeluBackstageSection initClip "+this);
			
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//recolecto los movieclips que están en el fla
			playButton = getChildByName("mcPlay") as Sprite;
			pauseButton = getChildByName("mcPause") as Sprite;
			stopButton = getChildByName("mcStop") as Sprite;
			videoPlayer = getChildByName("flvPlayer") as FLVPlayback;
			
			//inicializo los clips
			playButton.buttonMode = pauseButton.buttonMode = stopButton.buttonMode = true;
			playButton.addEventListener( MouseEvent.ROLL_OVER, btn_over );
			playButton.addEventListener( MouseEvent.ROLL_OUT, btn_out);
			pauseButton.addEventListener( MouseEvent.ROLL_OVER, btn_over );
			pauseButton.addEventListener( MouseEvent.ROLL_OUT, btn_out);
			stopButton.addEventListener( MouseEvent.ROLL_OVER, btn_over );
			stopButton.addEventListener( MouseEvent.ROLL_OUT, btn_out);
			stopButton.addEventListener( MouseEvent.CLICK, reset_video);
			
			videoPlayer.playButton = playButton;
			videoPlayer.pauseButton = pauseButton;
			videoPlayer.stopButton = stopButton;
			videoPlayer.source = "backstage.flv";
			videoPlayer.stop();
			
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.BACKSTAGE ) {
				videoPlayer.play();
			} else {
				videoPlayer.seekPercent(0);
				videoPlayer.stop();
			}
		}
		
		private function reset_video(e:MouseEvent):void {
			videoPlayer.seekPercent(0);
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