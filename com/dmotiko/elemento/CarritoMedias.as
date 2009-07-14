package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
		
	public class CarritoMedias
	extends BaseClip {
		private var aGroups:Array;
		
		override protected function initClip():void {
			var aData:Array;
			var ci:CarritoItemData;
			var cig:CarritoItemGroup;
			var nY:int = 0;
						
			aGroups = new Array();
			
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Estampados");
			ci.setParentName("Bebe");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores unisex, nena y varón)");
			ci.setArticle("1850");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lisos");
			ci.setParentName("Bebe");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varon y 6 de nena)");
			ci.setArticle("1011");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes");
			ci.setParentName("Bebe");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varon y 6 de nena)");
			ci.setArticle("1011");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setColor( SiteColors.MEDIAS_BEBE );
			cig.setHeader( new CSHMediaBebe() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).bottom + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo2
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Estampados");
			ci.setParentName("Niños");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores unisex, nena y varón)");
			ci.setArticle("1850");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lisos");
			ci.setParentName("Niños");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varon y 6 de nena)");
			ci.setArticle("1011");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes");
			ci.setParentName("Niños");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varon y 6 de nena)");
			ci.setArticle("1011");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setColor( SiteColors.MEDIAS_NENES );
			cig.setHeader( new CSHMediaNenes() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).bottom + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
						
		}
		
		private function group_change(e:Event):void {
			dispatchEvent( new Event( Event.CHANGE ) );			
		}
		
		public function collectItems():Array {
			var a:Array = new Array();
			for each( var cig:CarritoItemGroup in aGroups) {
				a = a.concat( cig.collectItems() );
			}
			return a;
		}
		
	}
	
}