package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
			
	public class STPuntosVentaMenu
	extends BaseMenu {
		
		override protected function refreshData():void {
			aBtns = new Array();
			var xml:XML = getData() as XML;
			for each(var nodo:XML in xml.elements()){
				var item:BaseMenuBtn = new view();
				item.setData( { label: new String(nodo.@label), data: new String(nodo.@id), special: new String(nodo.@special) } );
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
					nOffset += item.height - 10;
				}
				this.addChild(item);	
				
				//hago la separación en el caso de exclusivos y gba oeste
				if ( aBtns[i].getData().data == "EXCLUSIVOS" || aBtns[i].getData().data == "GBA OESTE") {
					nOffset += 20;
				}
				
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		
	}
	
}