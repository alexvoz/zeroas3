package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	import FLA.*;
	
	public class SeluButtonBar
	extends BaseMenu {
				
		override protected function initClip():void {
			bVertical = true;
			nSpace = 9;
			nOffset = 0;
			setVertical(false);
			setView( SeluButton );
			setData( [ 
				{ label: "coleccion", over: new ColeccionOver(), section: SeluSite.COLECCION },
				{ label: "backstage", over: new BackstageOver(), section: SeluSite.BACKSTAGE },
				{ label: "puntos de venta", over: new PuntosDeVentaOver(), section: SeluSite.PUNTOVENTA },
				{ label: "novedades", over: new PrensaOver(), section: SeluSite.NOVEDADES }, // TODO: Poner el over de novedades
				{ label: "sexies", over: new SexiesOver(), section: SeluSite.SEXIES },
				{ label: "prensa", over: new PrensaOver(), section: SeluSite.PRENSA },
				{ label: "contacto", over: new ContactoOver(), section: SeluSite.CONTACTO },
				{ label: "no casting", over: new NoCastingOver(), section: SeluSite.NOCASTING }
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
				var separator:SeluButtonSeparator;
				if (bVertical) {
					item.y = nOffset;
					nOffset += item.height + nSpace;
				} else {
					item.x = nOffset;
					if (i < aBtns.length - 1) {
						separator = new SeluButtonSeparator();
						separator.x = item.x + item.width;
						nOffset += item.width + separator.width + nSpace;
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