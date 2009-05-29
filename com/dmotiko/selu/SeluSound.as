package com.dmotiko.selu {
	
	import com.general.*
	import flash.events.*
		
	public class SeluSound
	extends BaseClip {
		private var bForceSound:Boolean;
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			SeluSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			sound_changed();
		}
		
		private function section_changed(e:Event=undefined):void {
			if ( SeluSite.getApp().getSection() == SeluSite.BACKSTAGE && !SeluSite.getApp().getSound()) {
				bForceSound = true;
				SeluSite.getApp().setSound(true);
			} else if ( bForceSound && SeluSite.getApp().getSection() != SeluSite.BACKSTAGE ) {
				bForceSound = false;
				SeluSite.getApp().setSound(false);
			}
		}
		
		private function sound_changed(e:Event=undefined):void {
			if ( SeluSite.getApp().getSound() ) {
				SeluSite.log( "SeluSite.getSound true");
				this.gotoAndStop(1);
			} else {
				SeluSite.log( "SeluSite.getSound false");
				this.gotoAndStop(2);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void 
		{
			if ( !SeluSite.getApp().getMusicChannel() ) return;
			bForceSound = false;
			SeluSite.getApp().setSound( !SeluSite.getApp().getSound());
		}
		
	}
	
}