package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class SiteSound
	extends BaseClip {
		
		public var mcPlay:BaseMenuBtnNormal;
		public var mcStop:BaseMenuBtnNormal;
		public var mcBuffer:MovieClip;
		
		override protected function initClip():void {
			super.initClip();
			Site.log( "new SiteSound" );
			mcBuffer.stop();
			mcPlay.mouseEnabled = mcStop.mouseEnabled;
			mcPlay.addEventListener( MouseEvent.CLICK, play_music);
			mcStop.addEventListener( MouseEvent.CLICK, stop_music);
			Site.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			sound_changed();
		}
		
		private function sound_changed(e:Event=undefined):void {
			Site.log( "SiteSound | sound_changed= " + Site.getApp().getSound());
			if ( Site.getApp().getSound() ) {
				mcBuffer.play();
				mcPlay.rollOver(undefined);
				mcPlay.setActive(true);
				mcStop.setActive(false);
			} else {
				mcBuffer.gotoAndStop(1);
				mcStop.rollOver(undefined);
				mcStop.setActive(true);
				mcPlay.setActive(false);
			}
		}
		
		private function stop_music(e:MouseEvent):void {
			if ( !Site.getApp().getMusicChannel() ) return;
			Site.getApp().setSound(false);
		}
		
		private function play_music(e:MouseEvent):void {
			if ( !Site.getApp().getMusicChannel() ) return;
			Site.getApp().setSound(true);
		}
		
	}
	
}