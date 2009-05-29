package com.dmotiko.seluteens {
	
	import com.general.*
	import flash.events.*
		
	public class STSound
	extends BaseClip {
		private var bForceSound:Boolean;
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			STSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			sound_changed();
		}
		
		private function section_changed(e:Event=undefined):void {
			if ( STSite.getApp().getSection() == STSite.BACKSTAGE && !STSite.getApp().getSound()) {
				bForceSound = true;
				STSite.getApp().setSound(true);
			} else if ( bForceSound && STSite.getApp().getSection() != STSite.BACKSTAGE ) {
				bForceSound = false;
				STSite.getApp().setSound(false);
			}
		}
		
		private function sound_changed(e:Event=undefined):void {
			if ( STSite.getApp().getSound() ) {
				STSite.log( "STSite.getSound true");
				this.gotoAndStop(1);
			} else {
				STSite.log( "STSite.getSound false");
				this.gotoAndStop(2);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void {
			if ( !STSite.getApp().getMusicChannel() ) return;
			bForceSound = false;
			STSite.getApp().setSound( !STSite.getApp().getSound());
		}
		
	}
	
}