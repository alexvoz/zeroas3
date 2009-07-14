package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
		
	public class PedidoContainer
	extends BaseMenu {
		
		private var sContainer:Sprite;
		
		override protected function initClip():void {
			super.initClip();
			setView( PedidoItem );
		}
		
		public function deleteItem( evnt:Event ):void {
			
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();			
			for ( var i:int = 0; i < oData.length; i++) {
				var item:BaseMenuBtn = new view();
				item.setData( oData[i] );
				item.addEventListener( Event.CHANGE, deleteItem );
				aBtns.push(item);
			}
			layout();
			
		}
		
		override protected function layout():void {
			
			if (sContainer) removeChild(sContainer);
			sContainer = new Sprite();
			addChild(sContainer);
			nOffset = 0;
			
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				item.x = 144;
				item.y = nOffset;
				nOffset += item.height + nSpace;
				sContainer.addChild(item);
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
	}
	
}