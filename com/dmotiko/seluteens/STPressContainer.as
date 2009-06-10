package com.dmotiko.seluteens {
	import com.general.*;
	import com.gui.ScrollerMovie;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class STPressContainer
	extends BaseClip {
		
		public var mcScroller:STPressScroller;
		private var selectedItem:STPressItem;
		private var firstItem:STPressItem;
		
		override protected function initClip():void {
			if (STSite.getApp()) {
				STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			}
		}
		
		private function section_changed(e:Event):void {
			if ( STSite.getApp().getSection() == STSite.PRENSA ) {
				firstItem.dispatchEvent( new Event( Event.CHANGE ) );
			}
		}
		
		override protected function refreshData():void {
			//STSite.log( "STPressContainer | refreshData= " + data);
			var nY:int = 0;
			var container:Sprite = mcScroller.getChildByName("mcContent") as Sprite;
			var aHeaders:Array = [ STPressHeaderA, STPressHeaderB, STPressHeaderC ];
			var nHeader:int = 0;
			for each( var node:XML in (data as XMLList) ) {
				if (nHeader == aHeaders.length) nHeader = 0;
				var header:STPressHeader = new aHeaders[nHeader]();
				nHeader++;
				
				header.setData( new String(node.@name) );
				nY += 5;
				header.y = nY;
				nY += header.height + 20;
				container.addChild(header);
				
				for each( var press:XML in node.child("press") ) {
					var item:STPressItem = new STPressItem();
					item.addEventListener( Event.CHANGE, item_change);
					item.setData( { label: press.@label, data: press } );
					item.y = nY;
					container.addChild(item);
					nY += item.height;
					if (!firstItem) {
						firstItem = item;
						item.setActive( true );
					}
				}
				
			}
			firstItem.dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		private function item_change(e:Event):void {
			if (selectedItem) selectedItem.setActive(false);
			selectedItem = e.currentTarget as STPressItem;
			selectedItem.setActive(true)
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		public function getSelectedItem():STPressItem { return selectedItem; }
		
	}
	
}