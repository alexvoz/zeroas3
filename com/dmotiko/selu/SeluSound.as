package com.dmotiko.selu {
	
	import com.general.*
	import flash.events.*
		
	public class SeluSound
	extends BaseClip {
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
		}
		
		private function toggle_sound(e:MouseEvent):void 
		{
			if (this.currentFrame == 1) {
				this.gotoAndStop(2);
				SeluSite.getApp().fadeOutMusic();
			} else {
				if ( SeluSite.getApp().getSection() == SeluSite.BACKSTAGE) return;
				this.gotoAndStop(1);
				SeluSite.getApp().fadeInMusic();	
			}
		}
		
	}
	
}