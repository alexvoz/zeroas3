package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
			
	public class SeluPuntosVentaMenu
	extends BaseMenu {
		
		override protected function layout():void {
			for (var i:uint = 0; i < aBtns.length; i++){
				if ( aBtns[i].getData().space ) {
					nOffset += 15;
				} else {
					var item:BaseMenuBtn = aBtns[i];
					if (bVertical) {
						item.y = nOffset;
						nOffset += item.height - 10;
					}
					this.addChild(item);	
				}
				
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		
	}
	
}