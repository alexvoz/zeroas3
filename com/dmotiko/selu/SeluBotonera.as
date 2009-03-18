package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	
	public class SeluBotonera
	extends BaseClip {
		private var navBar:SeluButtonBar;
		private var menuBtn:MovieClip;
		private var homeBtn:MovieClip;
		private var closeBtn:MovieClip;
		private var nInitY:Number;
		private var nHomeY:Number;
		private var bIsDown:Boolean;
		
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
			navBar.mouseEnabled = false;
			navBar.mouseChildren = false;
			navBar.addEventListener( Event.CHANGE, btnBarChange);
			this.addChild(navBar);
			
			nInitY = this.y;
			nHomeY = this.y - 30;
					
			if (SeluSite.getApp()) {
				SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
				sectionChanged( undefined );
				checkSection();
			} else {
				homeBtn.visible = true;
			}
		}
		
		public function checkSection():void {
			var tween:Tween;
			if ( SeluSite.getApp().getSection() == SeluSite.HOME ) {
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
			trace("tweenFinished= "+bIsDown);
			navBar.mouseChildren = navBar.mouseEnabled = bIsDown;
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