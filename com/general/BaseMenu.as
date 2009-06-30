package com.general {
	
	import flash.events.*;
	
		
	public class BaseMenu
	extends BaseClip {
		
		protected var activeButton:BaseMenuBtn;
		protected var view:Class;
		protected var aBtns:Array;
		protected var bVertical:Boolean;		
		protected var nSpace:Number;
		protected var nOffset:Number;
				
		override protected function initClip():void {
			bVertical = true;
			nSpace = 0;
			nOffset = 0;
		}
		
		public function setView(view:Class):void {
			this.view = view;
		}
		public function getView():Class {
			return view;
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();			
			for ( var i:int = 0; i < oData.length; i++) {
				var item:BaseMenuBtn = new view();
				item.setData( oData[i] );
				item.addEventListener( MouseEvent.CLICK, activeBtn );
				aBtns.push(item);
			}
			layout();
		}
		
		protected function layout():void {
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				if (bVertical) {
					item.y = nOffset;
					nOffset += item.height + nSpace;
				} else {
					item.x = nOffset;
					nOffset += item.width + nSpace;
				}
				this.addChild(item);
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		public function setVertical(value:Boolean):void {
			this.bVertical = value;
		}
		public function setSpace(value:Number):void {
			this.nSpace = value;
		}
		
		public function getButtons():Array {
			return this.aBtns;
		}
		
		public function activeBtn( evnt:MouseEvent ):void {
			if (activeButton) {
				if ( activeButton == evnt.currentTarget ) return;
				activeButton.setActive(false);
			}
			activeButton = evnt.currentTarget as BaseMenuBtn;
			activeButton.setActive( true );
			this.dispatchEvent( new Event( Event.CHANGE ) );
		}
		public function getActiveButton():BaseMenuBtn {
			return this.activeButton;
		}
		public function setActiveButton( btn:BaseMenuBtn ):void {
			if( activeButton ) this.activeButton.setActive(false);
			if ( !btn ) {
				this.activeButton = undefined;
			} else {
				var n = aBtns.indexOf( btn );
				if ( n >= 0) (this.aBtns[n] as BaseMenuBtn).setActive(true);
			}
		}
		
		public function getOffset():Number { return nOffset; }
		
		public function setOffset(value:Number):void 
		{
			nOffset = value;
		}
		
	}
	
}