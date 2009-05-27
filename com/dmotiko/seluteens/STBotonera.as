package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	
	public class STBotonera
	extends BaseClip {
		public var navBar:STButtonBar;
		public var mcMenu:MovieClip;
		public var mcHome:MovieClip;
		public var mcCloseBtn:MovieClip;
		private var nInitY:Number;
		private var nHomeY:Number;
		private var bIsDown:Boolean;
		
		override protected function initClip():void {
			mcMenu.visible = mcHome.visible = false;
			mcHome.buttonMode = true;
			mcCloseBtn.buttonMode = true;
			
			mcHome.addEventListener( MouseEvent.CLICK, rightButtonClick);
			mcHome.addEventListener( MouseEvent.ROLL_OVER, rightButtonOver);
			mcHome.addEventListener( MouseEvent.ROLL_OUT, rightButtonOut);
			mcCloseBtn.addEventListener( MouseEvent.CLICK, rightButtonClick);
			
			navBar = new STButtonBar();
			navBar.x = 27;
			navBar.y = 200;
			navBar.mouseEnabled = false;
			navBar.mouseChildren = false;
			navBar.addEventListener( Event.CHANGE, btnBarChange);
			this.addChild(navBar);
			
			nInitY = this.y;
			nHomeY = this.y - 30;
					
			if (STSite.getApp()) {
				STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
				sectionChanged( undefined );
				checkSection();
			} else {
				mcHome.visible = true;
			}
		}
		
		public function checkSection():void {
			var tween:Tween;
			if ( STSite.getApp().getSection() == STSite.HOME ) {
				killTween("moveY");
				tween =  new Tween( this, "y", Regular.easeOut, this.y, nHomeY, 0.5, true );
				registerTween("moveY", tween);
				bIsDown = false;
				navBar.setActiveButton(undefined);
				this.root.addEventListener( MouseEvent.MOUSE_MOVE, checkMenu);
			} else {
				killTween("moveY");
				tween =  new Tween( this, "y", Regular.easeOut, this.y, nInitY, 0.5, true );
				registerTween("moveY", tween);
				bIsDown = true;
				this.root.removeEventListener( MouseEvent.MOUSE_MOVE, checkMenu);
			}
		}
		
		private function checkMenu(e:MouseEvent):void {
			var check:Boolean;
			var nEnd:Number;
			if ( !bIsDown ) {
				nEnd = nInitY;
				check = e.stageY > (e.target as DisplayObject).height / 2;
			} else {
				nEnd = nHomeY;
				check = e.stageY < (e.target as DisplayObject).height / 2;
			}
			if (check) {
				bIsDown = !bIsDown;
				var tween =  new Tween( this, "y", Regular.easeOut, this.y, nEnd, 0.5, true );
				killTween("moveY");
				registerTween("moveY", tween, false, true);
			}
		}
		
		override protected function tweenFinished(key:String, tween:Tween):void {
			navBar.mouseChildren = navBar.mouseEnabled = bIsDown;
		}
		
		private function btnBarChange(evnt):void {
			STSite.getApp().setSection( navBar.getActiveButton().getData().section );			
		}
		
		private function rightButtonOut(e:MouseEvent):void 
		{
			mcHome.gotoAndPlay("hide");
		}
		
		private function rightButtonOver(e:MouseEvent):void 
		{
			mcHome.gotoAndPlay("show");
		}
		
		private function rightButtonClick(e:MouseEvent):void 
		{
			STSite.getApp().setSection( STSite.HOME );
		}
		
		private function sectionChanged(e:Event):void {
			if ( !e || STSite.getApp().getSection() == STSite.HOME) {
				mcMenu.visible = true;
				mcHome.visible = false;
				
			} else {
				mcHome.visible = true;
				mcMenu.visible = false;
				
			}
		}
		
	}
	
}