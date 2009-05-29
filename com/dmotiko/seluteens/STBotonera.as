package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	
	public class STBotonera
	extends BaseClip {
		public var mcCloseBtn:MovieClip;
		private var navBar:STButtonBar;
		
		private var nInitY:Number;
		private var nHomeY:Number;
		private var bIsDown:Boolean;
		
		override protected function initClip():void {
					
			mcCloseBtn.buttonMode = true;
				
			mcCloseBtn.addEventListener( MouseEvent.CLICK, rightButtonClick);
			
			navBar = new STButtonBar();
			navBar.x = 60;
			navBar.y = 197;
			navBar.rotation = 1.8;
			navBar.addEventListener( Event.CHANGE, btnBarChange);
			this.addChild(navBar);
			
			nInitY = this.y;
			nHomeY = this.y - 30;
					
			if (STSite.getApp()) {
				STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
				sectionChanged( undefined );
			}
			
		}
		
		private function btnBarChange(evnt):void {
			STSite.log( "STBotonera btnBarChange= " + evnt.currentTarget);
			STSite.getApp().setSection( navBar.getActiveButton().getData().section );			
		}
		
		private function rightButtonClick(e:MouseEvent):void {
			STSite.getApp().setSection( STSite.HOME );
		}
		
		private function sectionChanged(e:Event):void {
			if ( !e || STSite.getApp().getSection() == STSite.HOME) {
				navBar.setActiveButton(undefined);
			}
		}
		
	}
	
}