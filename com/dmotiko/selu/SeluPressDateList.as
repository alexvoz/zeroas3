package com.dmotiko.selu {
	import com.general.*;
	import com.gui.ScrollerMovie;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
		
	public class SeluPressDateList
	extends SeluPressList {
		
		override protected function refreshData():void {
			this.removeChild(mcContent);
			mcContent = new Sprite();
			mcContent.x = mcMask.x;
			mcContent.y = mcMask.y;
			this.addChild( mcContent );
			mcContent.mask = mcMask;
			
			aBtns = new Array();
			
			var xml:XML = data as XML;
			var nY:int = 0;
			for each(var nodo:XML in xml.elements()){
				var item:BaseMenuBtn = new SeluPressButton();
				item.setData( { label: new String(nodo.@date), data: nodo } );
				item.addEventListener( MouseEvent.CLICK, active_btn );
				item.y = nY;
				nY += item.height + 10;
				mcContent.addChild( item );
				aBtns.push( item );
			}
			
			dispatchEvent( new Event(Event.COMPLETE) );
			
		}
		
	}
	
}