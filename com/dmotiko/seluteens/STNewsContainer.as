package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.geom.Rectangle;
	import flash.xml.XMLNode;
		
	public class STNewsContainer
	extends BaseClip {
		
		public var mcScroller:STNewsScroller;
		private var selectedItem:STNewsItem;
								
		override protected function refreshData():void {
			var nY:int = 0;
			var container:Sprite = mcScroller.getChildByName("mcContent") as Sprite;
			STSite.log( "STNewsContainer | refreshData= "+ data );			
			for each( var node:XML in (data as XMLList) ) {
				
				var item:STNewsItem = new STNewsItem();
				item.addEventListener( Event.CHANGE, item_change);
				item.setData( { date: node.@date, title: node.@title, thumb: node.@thumb, link: node.@link, href: node.@href, data: node } );
				item.y = nY;
				container.addChild(item);
				nY += item.height;
				
			}
		}
		
		private function item_change(e:Event):void {
			selectedItem = e.currentTarget as STNewsItem;
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		public function getSelectedItem():STNewsItem { return selectedItem; }
		
	}
	
}