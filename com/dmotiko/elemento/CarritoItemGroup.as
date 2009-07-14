package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
		
	public class CarritoItemGroup
	extends BaseMenu {
		
		private var nColor:int;
		private var _sName:String;
		private var spHeader:MovieClip;
				
		override protected function initClip():void {
			super.initClip();
			nSpace = -5;
		}
		
		public function setColor(value):void {
			this.nColor = value;
		}
		
		public function setHeader( sp:MovieClip ):void {
			this.spHeader = sp;
		}
		
		public function collectItems():Array {
			var a:Array = new Array();
			for each( var btn:BaseMenuBtn in aBtns) {
				if ( btn.getActive() ) a.push( btn );
			}
			return a;
		}
		
		override public function activeBtn( evnt:MouseEvent ):void {
			dispatchEvent( new Event(Event.CHANGE) );
		}
				
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();			
			for ( var i:int = 0; i < oData.length; i++) {
				var item:BaseMenuBtn = new view();
				(oData[i] as CarritoItemData).setColor( this.nColor );
				(oData[i] as CarritoItemData).setParentName( this._sName );
				item.setData( oData[i] );
				item.addEventListener( MouseEvent.CLICK, activeBtn );
				aBtns.push(item);
			}
			layout();
		}
		
		override protected function layout():void {
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				item.x = 144;
				item.y = nOffset;
				nOffset += item.height + nSpace;
				this.addChild(item);
			}
			this.addChild(spHeader);
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		public function getName():String { return _sName; }
		
		public function setName(value:String):void 
		{
			_sName = value;
		}
		
	}
	
}