﻿package com.zero.snap 
{
	
	/**
	 * ...
	 * @author sminutoli
	 */
	import com.general.*
	import flash.events.*
	
	public class SiteSound
	extends BaseClip
	{
		
		private var bForceSound:Boolean;
		
		override protected function initClip():void {
			super.initClip();
			stop();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			Site.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			sound_changed();
		}
		
		private function section_changed(e:Event=undefined):void {
			if ((Site.getApp().getSection() == Site.REEL || Site.getApp().getSection() == Site.WORKS ) && Site.getApp().getSound()) {
				
				Site.getApp().setSound(false);
			} else if ( (Site.getApp().getSection() != Site.WORKS || Site.getApp().getSection() != Site.REEL)  ) {
				
				Site.getApp().setSound(true);
			}
		}
		
		private function sound_changed(e:Event=undefined):void {
			if ( Site.getApp().getSound() ) {
				Site.log( "Site.getSound true");
				this.gotoAndStop(1);
			} else {
				Site.log( "Site.getSound false");
				this.gotoAndStop(2);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void 
		{
			if ( !Site.getApp().getMusicChannel() ) return;
			bForceSound = false;
			Site.getApp().setSound( !Site.getApp().getSound());
		}
		
	}
	
}