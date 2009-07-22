package com.dmotiko.luisbelgrano {
	
	import com.general.*;
	import flash.display.*
	import flash.events.*;
	import fl.transitions.*
	import fl.transitions.easing.*
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	public class LBSound
	extends BaseClip {
		
		public var mcInterface:MovieClip;
		
		private var nInitX:Number;
		private var timerHide:Timer;
		private var mcIcon:MovieClip;
		private var btnStop:SimpleButton;
		private var btnPlay:SimpleButton;
		private var mcBack:MovieClip;
		private var sndChannel:SoundChannel;
		private var snd:Sound;
		private var oSound:Object;
		private var soundTween:Tween;
		private var playUp:DisplayObject;
		private var stopUp:DisplayObject;
		
		public function LBSound() {
			super();
		}
		
		override protected function initClip():void {
			LBSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			
			//cargo el sonido
			snd = new Sound( new URLRequest("MIRAMAR.mp3") );
			snd.addEventListener( Event.SOUND_COMPLETE, loop_music);
			oSound = new Object();
			oSound.volume = 0;
			oSound.position = 0;
						
			//recolecto variables
			var movieInterface:MovieClip = mcInterface;
			btnPlay = movieInterface.getChildByName("btnPlay") as SimpleButton;
			btnStop = movieInterface.getChildByName("btnStop") as SimpleButton;
			mcIcon = movieInterface.getChildByName("mcIcon") as MovieClip;
			mcBack = movieInterface.getChildByName("mcBack") as MovieClip;
			
			//defino eventos			
			mcIcon.addEventListener( MouseEvent.ROLL_OVER, show_clip );
			btnPlay.addEventListener( MouseEvent.CLICK, sound_play);
			btnStop.addEventListener( MouseEvent.CLICK, sound_stop);
			btnPlay.addEventListener( MouseEvent.ROLL_OVER, reset_timer);
			btnStop.addEventListener( MouseEvent.ROLL_OVER, reset_timer);
			
			//para dejar activo x boton
			playUp = btnPlay.upState;
			stopUp = btnStop.upState;
			
			nInitX = this.x;
			alpha = 0;
			registerTween("moveX", new Tween(this, "x", Elastic.easeOut, this.x, nInitX + 50, 1, true));
			registerTween("fadeIn", new Tween(this, "alpha", Regular.easeOut, this.alpha, 1, 0.5, true));
			timerHide = new Timer(2500, 1);
			timerHide.addEventListener( TimerEvent.TIMER_COMPLETE, timer_complete);
			timerHide.start();
			
			LBSite.getApp().setSound(true);
		}
		
		private function reset_timer(e:MouseEvent):void {
			timerHide.reset();
			timerHide.start();
		}
		
		private function sound_changed(e:Event):void {
			if ( LBSite.getApp().getSound() ) {
				btnPlay.upState = btnPlay.downState;
				btnStop.upState = stopUp;
				fadeInMusic();
			} else {
				btnPlay.upState = playUp;
				btnStop.upState = btnStop.downState;
				fadeOutMusic();
			}
		}
		private function refresh_fade(e:TweenEvent):void {
			var transform:SoundTransform = sndChannel.soundTransform;
			transform.volume = oSound.volume;
			sndChannel.soundTransform = transform;
		}
		
		private function loop_music(e:Event):void {
			sndChannel.stop();
			oSound.position = 0;
			sndChannel = snd.play( oSound.position );
		}
		
		private function fadeInMusic():void {
			if ( oSound.volume == 1) return;
			sndChannel = snd.play( oSound.position );
			if (soundTween) soundTween.stop();
			soundTween = new Tween(oSound, "volume", Regular.easeOut, oSound.volume, 1, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
		}
		
		private function fadeOutMusic():void {
			if ( oSound.volume == 0) return;
			if (soundTween) soundTween.stop();
			soundTween = new Tween(oSound, "volume", Regular.easeOut, oSound.volume, 0, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
			soundTween.addEventListener(TweenEvent.MOTION_FINISH, stop_music);
		}
		
		private function stop_music(e:TweenEvent):void 	{
			oSound.position = sndChannel.position;
			sndChannel.stop();
		}
		
		private function sound_stop(e:MouseEvent):void {
			LBSite.getApp().setSound(false);
		}
		
		private function sound_play(e:MouseEvent):void {
			LBSite.getApp().setSound(true);
		}
		
		private function timer_complete(e:TimerEvent):void {
			hide_clip();
		}
		
		private function show_clip( e = undefined):void {
			if ( bShowed ) return;
			reset_timer( undefined );
			mcIcon.gotoAndStop(2);
			super.show();
			registerTween("moveX", new Tween(this, "x", Regular.easeOut, this.x, nInitX + 50, 1, true));
		}
		
		private function hide_clip( e = undefined ):void {
			super.hide();
			mcIcon.gotoAndStop(1);
			registerTween("moveX", new Tween(this, "x", Regular.easeOut, this.x, nInitX, 1, true));
		}
				
	}
	
}