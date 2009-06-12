package com.dmotiko.opositor {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	import FLA.*;
	
	public class OPButtonBar
	extends BaseMenu {
				
		override protected function initClip():void {
			bVertical = true;
			nSpace = 9;
			nOffset = 0;
			setVertical(false);
			setView( OPButtonResalte );
			setData( [ 
				{ label: "Colección", section: OPSite.COLECCION },
				{ label: "Novedades", section: OPSite.NOVEDADES },
				{ label: "Prensa", section: OPSite.PRENSA },
				{ label: "Puntos de Venta", section: OPSite.PUNTOVENTA },
				{ label: "Contacto", section: OPSite.CONTACTO }
			]);
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();
			for ( var i:int = 0; i < oData.length; i++) {
				//if ( i == oData.length - 1) setView( OPButtonSpecial );
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
				var separator:OPButtonSeparator;
				if (bVertical) {
					item.y = nOffset;
					nOffset += item.height + nSpace;
				} else {
					item.x = nOffset;
					if (i < aBtns.length - 1) {
						separator = new OPButtonSeparator();
						separator.x = item.x + item.width - 15;
						nOffset += item.width + separator.width + nSpace - 15;
					} else {
						nOffset += item.width + nSpace;
					}
				}
				this.addChild(item);
				if (separator) this.addChild(separator);
			}
		}
		
	}
	
}