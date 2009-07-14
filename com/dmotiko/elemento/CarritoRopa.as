package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
		
	public class CarritoRopa
	extends CarritoTemplate {
		
		override protected function initClip():void {
			super.initClip();
			
			var aData:Array;
			var ci:CarritoItemData;
			var cig:CarritoItemGroup;
			var nY:int = 0;
						
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Fede");
			ci.setDescription("x unidad");
			ci.setArticle("935");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Nano");
			ci.setDescription("x unidad");
			ci.setArticle("936");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Pepo");
			ci.setDescription("x unidad");
			ci.setArticle("937");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Pijama");
			cig.setColor( SiteColors.ROPA_PIJAMA_NENE );
			cig.setHeader( new CSHRopaPijamaNene() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo2
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Eva");
			ci.setDescription("x unidad");
			ci.setArticle("521");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lina");
			ci.setDescription("x unidad");
			ci.setArticle("522");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lulu");
			ci.setDescription("x unidad");
			ci.setArticle("519");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Sol");
			ci.setDescription("x unidad");
			ci.setArticle("520");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Pijama");
			cig.setColor( SiteColors.ROPA_PIJAMA_NENA );
			cig.setHeader( new CSHRopaPijamaNena() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo3
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Love");
			ci.setDescription("x unidad");
			ci.setArticle("206");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Telma");
			ci.setDescription("x unidad");
			ci.setArticle("207");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Vicky");
			ci.setDescription("x unidad");
			ci.setArticle("205");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Pijama");
			cig.setColor( SiteColors.ROPA_PIJAMA_TEEN );
			cig.setHeader( new CSHRopaPijamaTeen() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo4
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Slip Combinado");
			ci.setArticle("703");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Slip Rayados");
			ci.setArticle("704");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Boxer Lisos");
			ci.setArticle("605");
			aData.push(ci);
			
			
			ci = new CarritoItemData();
			ci.setName("Boxer Rayados");
			ci.setArticle("705");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Boxer Lisos");
			ci.setDescription("collareta contratono");
			ci.setArticle("706");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("R Interior");
			cig.setColor( SiteColors.ROPA_INT_NENE );
			cig.setHeader( new CSHRopaIntNene() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo5
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Bombacha Clásica");
			ci.setDescription("rayada y lisa");
			ci.setArticle("602");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Bombacha Lisa Lycra");
			ci.setArticle("702");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("CONJUNTO CAMISETA Y BOMBACHA");
			ci.setDescription2("(lycra con estampa)");
			ci.setArticle("610");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("CONJUNTO CAMISETA Y BOMBACHA");
			ci.setDescription2("(liso ribb desagujado)");
			ci.setArticle("615");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Corpiño y Bombacha");
			ci.setArticle("609");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Culotte");
			ci.setArticle("701");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Mini Short");
			ci.setArticle("601");
			aData.push(ci);
									
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("R Interior");
			cig.setColor( SiteColors.ROPA_INT_NENA );
			cig.setHeader( new CSHRopaIntNena() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo6
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Culotte");
			ci.setArticle("803");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Corpiño y Culotte");
			ci.setArticle("814");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Colaless");
			ci.setArticle("800");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Vedettina");
			ci.setArticle("801");
			aData.push(ci);
												
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("R Interior");
			cig.setColor( SiteColors.ROPA_INT_TEEN );
			cig.setHeader( new CSHRopaIntTeen() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo7
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Remera Nene");
			ci.setArticle("800");
			aData.push(ci);
							
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Remera");
			cig.setColor( SiteColors.ROPA_REMERA_NENE );
			cig.setHeader( new CSHRopaRemeraNene() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo8
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Remera Nena");
			ci.setArticle("800");
			aData.push(ci);
							
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Remera");
			cig.setColor( SiteColors.ROPA_REMERA_NENA );
			cig.setHeader( new CSHRopaRemeraNene() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
						
		}
		
	}
	
}