package com.dmotiko.opositor {
	
	import com.general.*
	import flash.events.*
		
	public class OPSound
	extends BaseClip {
		private var bForceSound:Boolean;
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			OPSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			OPSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			sound_changed();
		}
		
		private function section_changed(e:Event=undefined):void {
			if ( OPSite.getApp().getSection() == OPSite.BACKSTAGE && !OPSite.getApp().getSound()) {
				bForceSound = true;
				OPSite.getApp().setSound(true);
			} else if ( bForceSound && OPSite.getApp().getSection() != OPSite.BACKSTAGE ) {
				bForceSound = false;
				OPSite.getApp().setSound(false);
			}
		}
		
		private function sound_changed(e:Event=undefined):void {
			if ( OPSite.getApp().getSound() ) {
				//OPSite.log( "OPSite.getSound true");
				this.gotoAndStop(1);
			} else {
				//OPSite.log( "OPSite.getSound false");
				this.gotoAndStop(2);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void {
			if ( !OPSite.getApp().getMusicChannel() ) return;
			bForceSound = false;
			OPSite.getApp().setSound( !OPSite.getApp().getSound());
		}
		
	}
	
}