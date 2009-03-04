package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	import FLA.ContactoOver;
	
	public class SeluButtonBar
	extends BaseMenu {
				
		override protected function initClip():void {
			bVertical = true;
			nSpace = 5;
			nOffset = 0;
			setVertical(false);
			setView( SeluButton );
			setData( [ 
				{ label: "contacto", over: new ContactoOver() },
				{ label: "nocasting", over: new ContactoOver() }
			]);
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();
			for ( var i:int = 0; i < oData.length; i++) {
				if ( i == oData.length - 1) setView( SeluButtonSpecial );
				var item:BaseMenuBtn = new view();
				item.setData( oData[i] );
				item.addEventListener( MouseEvent.CLICK, activeBtn );
				aBtns.push(item);
			}
			layout();
		}
		
		override protected function layout():void {
			for (var i:uint = 0; i < aBtns.length; i++){
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
		
	}
	
}