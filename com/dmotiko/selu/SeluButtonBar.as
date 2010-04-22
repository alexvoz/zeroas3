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
			nSpace = 1;
			nOffset = 0;
			setVertical(false);
			setView( SeluButton );
			setData( [ 
				{ label: "Colección  .", /*over: new ColeccionOver(),*/ section: SeluSite.COLECCION, nFrame: 2 },
				{ label: "Backstage  .", /*over: new BackstageOver(),*/ section: SeluSite.BACKSTAGE, nFrame: 2 },
				{ label: "Puntos de venta  .", /*over: new PuntosDeVentaOver(),*/ section: SeluSite.PUNTOVENTA, nFrame: 3 },
				{ label: "Novedades  .", /*over: new NovedadesOver(),*/ section: SeluSite.NOVEDADES, nFrame: 4 },
				{ label: "Sexies  .", over: new SexiesOver(),/*over: new ColeccionOver(),*/ /*section: SeluSite.SEXIES,*/ nFrame: 7 },
				{ label: "Prensa  .", /*over: new PrensaOver() over: new Construction(),*/ section: SeluSite.PRENSA, nFrame: 5 },
				{ label: "Contacto  .", /*over: new ContactoOver(),*/ section: SeluSite.CONTACTO, nFrame: 2 },
				{ label: "No casting", /*over: new NoCastingOver(),*/ section: SeluSite.NOCASTING, nFrame: 6 }
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
						nOffset += item.width + separator.width -8;//+ nSpace;
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