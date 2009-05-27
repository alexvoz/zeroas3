package com.dmotiko.seluteens {
	
	import com.general.*
	import flash.events.*
		
	public class SeluTeensSound
	extends BaseClip {
		private var bForceSound:Boolean;
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			SeluTeensSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			SeluTeensSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			sound_changed();
		}
		
		private function section_changed(e:Event=undefined):void {
			if ( SeluTeensSite.getApp().getSection() == SeluTeensSite.BACKSTAGE && !SeluTeensSite.getApp().getSound()) {
				bForceSound = true;
				SeluTeensSite.getApp().setSound(true);
			} else if ( bForceSound && SeluTeensSite.getApp().getSection() != SeluTeensSite.BACKSTAGE ) {
				bForceSound = false;
				SeluTeensSite.getApp().setSound(false);
			}
		}
		
		private function sound_changed(e:Event=undefined):void {
			if ( SeluTeensSite.getApp().getSound() ) {
				SeluTeensSite.getApp().log( "SeluTeensSite.getSound true");
				this.gotoAndStop(1);
			} else {
				SeluTeensSite.getApp().log( "SeluTeensSite.getSound false");
				this.gotoAndStop(2);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void 
		{
			if ( !SeluTeensSite.getApp().getMusicChannel() ) return;
			bForceSound = false;
			SeluTeensSite.getApp().setSound( !SeluTeensSite.getApp().getSound());
		}
		
	}
	
}