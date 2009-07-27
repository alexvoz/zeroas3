package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
		
	public class SectionSelector
	extends BaseMenu {
		private var sSubSection:String;
			
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();			
			for ( var i:int = 0; i < oData.length; i++) {
				var item:BaseMenuBtn = new view();
				item.setData( oData[i] );
				item.addEventListener( MouseEvent.ROLL_OVER, activeBtn );
				item.addEventListener( MouseEvent.CLICK, clickBtn );
				aBtns.push(item);
			}
			layout();
		}
		
		private function clickBtn(e:MouseEvent):void {
			
			var btn:BaseMenuBtn = e.currentTarget as BaseMenuBtn;
			setChildIndex(btn, numChildren-1);
			for (var i:int = 0; i < aBtns.length; i++)	{
				aBtns[i].removeEventListener( MouseEvent.ROLL_OVER, activeBtn );
				aBtns[i].removeEventListener( MouseEvent.CLICK, clickBtn );
				registerTween("moveBtn" + i, new Tween( aBtns[i], "x", Regular.easeOut, aBtns[i].x, 0, 0.7, true), false, i == aBtns.length-1);
			}
			sSubSection = (e.currentTarget as BaseMenuBtn).getData().value;
			
		}
		
		override protected function layout():void {
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				item.x = nOffset;
				nOffset += item.getSize().x + nSpace;
				this.addChild(item);
			}
			(aBtns[0] as BaseMenuBtn).dispatchEvent( new MouseEvent( MouseEvent.ROLL_OVER ) );
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		override public function activeBtn( evnt:MouseEvent ):void {
			if (activeButton == evnt.currentTarget) return;
			if(activeButton) activeButton.setActive(false);
			activeButton = evnt.currentTarget as BaseMenuBtn;
			activeButton.setActive( true );
			var bBtn:Boolean;
			var nBtn:int;
			var nX:int = 0;
			for ( var i:int = 0; i < aBtns.length; i++) {
				registerTween("moveBtn" + i, new Tween( aBtns[i], "x", Regular.easeOut, aBtns[i].x, nX, 0.3, true));
				if ( aBtns[i] == activeButton ) {
					nX += 280 + nSpace;
				} else {
					nX += 84 + nSpace;
				}
				
			}
			this.dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			if( key != "fade"){
				registerTween("fade", new Tween( this, "alpha", Regular.easeOut, this.alpha, 0, 0.5, true), false, true);
			} else {
				Site.getApp().setSection( sSubSection );
			}
		}
		
		
		
	}
	
}