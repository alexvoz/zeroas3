package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	
	public class SeluBotonera
	extends BaseClip {
		private var navBar:SeluButtonBar;
		private var menuBtn:MovieClip;
		private var homeBtn:MovieClip;
		private var closeBtn:MovieClip;
		
		override protected function initClip():void {
			menuBtn = this.getChildByName("mcMenu") as MovieClip;
			homeBtn = this.getChildByName("mcHome") as MovieClip;
			closeBtn = this.getChildByName("mcCloseBtn") as MovieClip;
			
			menuBtn.visible = homeBtn.visible = false;
			homeBtn.buttonMode = true;
			closeBtn.buttonMode = true;
			
			homeBtn.addEventListener( MouseEvent.CLICK, rightButtonClick);
			homeBtn.addEventListener( MouseEvent.ROLL_OVER, rightButtonOver);
			homeBtn.addEventListener( MouseEvent.ROLL_OUT, rightButtonOut);
			closeBtn.addEventListener( MouseEvent.CLICK, rightButtonClick);
			
			navBar = new SeluButtonBar();
			navBar.x = 27;
			navBar.y = 200;
			navBar.addEventListener( Event.CHANGE, btnBarChange);
			this.addChild(navBar);
						
			if (SeluSite.getApp()) {
				SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
				sectionChanged( undefined );
			} else {
				homeBtn.visible = true;
			}
		}
		
		private function btnBarChange(evnt):void {
			SeluSite.getApp().setSection( navBar.getActiveButton().getData().section );			
		}
		
		private function rightButtonOut(e:MouseEvent):void 
		{
			homeBtn.gotoAndPlay("hide");
		}
		
		private function rightButtonOver(e:MouseEvent):void 
		{
			homeBtn.gotoAndPlay("show");
		}
		
		private function rightButtonClick(e:MouseEvent):void 
		{
			SeluSite.getApp().setSection( SeluSite.HOME );
		}
		
		private function sectionChanged(e:Event):void {
			if ( !e || SeluSite.getApp().getSection() == SeluSite.HOME) {
				menuBtn.visible = true;
				homeBtn.visible = false;
				
			} else {
				homeBtn.visible = true;
				menuBtn.visible = false;
				
			}
		}
		
	}
	
}