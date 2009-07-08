package com.dmotiko.seluteens {
	
	import com.general.*
	import flash.events.*
		
	public class STSound
	extends BaseClip {
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			STSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			sound_changed();
		}
				
		private function sound_changed(e:Event=undefined):void {
			if ( STSite.getApp().getSound() ) {
				this.gotoAndStop(2);
			} else {
				this.gotoAndStop(1);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void {
			if ( !STSite.getApp().getMusicChannel() ) return;
			STSite.getApp().setSound( !STSite.getApp().getSound());
		}
		
	}
	
}