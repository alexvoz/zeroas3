package com.general {
	
	import flash.events.*;
	
		
	public class BaseMenu
	extends BaseClip {
		
		private var activeButton:BaseMenuBtn;
		protected var view:Class;
		protected var aBtns:Array;
		protected var bVertical:Boolean;		
		protected var nSpace:Number;
				
		public function BaseMenu() {
			super();
		}
		
		override protected function initClip():void {
			bVertical = true;
			nSpace = 0;
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
			var nOffset:Number = 0;
			for (var i:int = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				if (bVertical) {
					item.y = nOffset;
					nOffset += item.height + nSpace;
				} else {
					item.x = nOffset;
					nOffset += item.height + nSpace;
				}
				this.addChild(item);
			}
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
			if(activeButton) activeButton.setActive(false);
			activeButton = evnt.currentTarget as BaseMenuBtn;
			evnt.currentTarget.setActive( true );
			this.dispatchEvent( new Event( Event.CHANGE ) );
		}
		public function getActiveButton():BaseMenuBtn {
			return this.activeButton;
		}
		
	}
	
}