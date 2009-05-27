package com.dmotiko.seluteens {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	import FLA.*;
	
	public class STButtonBar
	extends BaseMenu {
				
		override protected function initClip():void {
			bVertical = true;
			nSpace = 9;
			nOffset = 0;
			setVertical(false);
			setView( STButton );
			setData( [ 
				{ label: "coleccion", over: new ColeccionOver(), section: STSite.COLECCION },
				{ label: "backstage", over: new BackstageOver(), section: STSite.BACKSTAGE },
				{ label: "puntos de venta", over: new PuntosDeVentaOver(), section: STSite.PUNTOVENTA },
				{ label: "novedades", over: new NovedadesOver(), section: STSite.NOVEDADES }, // TODO: Poner el over de novedades
				{ label: "sexies", /*over: new SexiesOver()*/over: new Construction(), section: STSite.SEXIES },
				{ label: "prensa", over: new PrensaOver(), section: STSite.PRENSA },
				{ label: "contacto", over: new ContactoOver(), section: STSite.CONTACTO },
				{ label: "no casting", over: new NoCastingOver(), section: STSite.NOCASTING }
			]);
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();
			for ( var i:int = 0; i < oData.length; i++) {
				if ( i == oData.length - 1) setView( STButtonSpecial );
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
				var separator:STButtonSeparator;
				if (bVertical) {
					item.y = nOffset;
					nOffset += item.height + nSpace;
				} else {
					item.x = nOffset;
					if (i < aBtns.length - 1) {
						separator = new STButtonSeparator();
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