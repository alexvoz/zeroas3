package com.dmotiko.seluteens {
	import com.general.*;
	import com.gui.ScrollerMovie;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class STPressContainer
	extends BaseClip {
		
		public var mcScroller:ScrollerMovie;
				
		override protected function refreshData():void {
			//STSite.log( "STPressContainer | refreshData= " + data);
			var nY:int = 0;
			var container:Sprite = mcScroller.getChildByName("mcContent") as Sprite;
			var aHeaders:Array = [ STPressHeaderA, STPressHeaderB, STPressHeaderC ];
			var nHeader:int = 0;
			for each( var node:XML in (data as XMLList) ) {
				STSite.log( "STPressContainer | " + node.@name );
				if (nHeader == aHeaders.length) nHeader = 0;
				var header:STPressHeader = new aHeaders[nHeader]();
				STSite.log( "STPressContainer | " + aHeaders[nHeader] );
				STSite.log( "STPressContainer | " +  mcScroller );
				STSite.log( "STPressContainer | " +  mcScroller.getChildByName("mcContainer") );
				nHeader++;
				/*
				header.setData( new String(node.@name) );
				header.y = nY;
				nY += header.height + 30;
				container.addChild(header);
				*/
				
				//STSite.log( "STPressContainer | " + node.child("press") );
				/*
				for each( var press:XML in node.child("press") ) {
					STSite.log( "STPressContainer | " + press.@label );
					var item:STPressItem = new STPressItem();
					item.setData( { label: press.@label, data: press } );
					item.y = nY;
					container.addChild(item);
					nY += item.height;
				}
				*/				
			}
			/*
			for ( var i:int = 0; i < (data as XML).elements().length() ; i++) {
				STSite.log( "STPressContainer | refreshData= " + (data as XML).elements()[i] );
			}
			*/
		}
		
	}
	
}