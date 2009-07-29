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
			
			var oUnit:Object = { spanish: "x unidad", english: "per unit" };
			var oSlipCom:Object = { spanish: "Slip Combinado", english: "Briefs combination of colors" };
			var oSlipRay:Object = { spanish: "Slip Rayado", english: "Briefs stripes" };
			var oBoxerLiso:Object = { spanish: "Boxer Liso", english: "Boxer solid colors" };
			var oBoxerRay:Object = { spanish: "Boxer Rayado", english: "Boxer stripes" };
			var oBoxerColl:Object = { spanish: "collareta contratono", english: "waistband in diff. color" };
			
			var oBomb:Object = { spanish: "Bombacha Clásica", english: "Panties Classic" };
			var oBombLL:Object = { spanish: "Bombacha Lisa Lycra", english: "PANTIES solid colors lycra" };
			var oBombSet:Object = { spanish: "CONJUNTO CAMISETA Y BOMBACHA", english: "SHIRT AND PANTIES SET" };
			var oCorpBomb:Object = { spanish: "Corpiño y Bombacha", english: "BRA & PANTIES" };
			var oCorpCullotte:Object = { spanish: "Corpiño y Culotte", english: "BRA & PANTIES" };
			var oColaless:Object = { spanish: "Colaless", english: "THONG" };
			var oBikini:Object = { spanish: "Vedettina", english: "BIKINI" };
			var oBombRL:Object = { spanish: "rayada y lisa", english: "stripes, solid colors" };
			var oLycraPrinted:Object = { spanish: "(lycra con estampa)", english: "(lycra, printed)" };
			var oLisoRibbed:Object = { spanish: "(liso ribb desagujado)", english: "(solid colors, ribbed)" };
			
			var oRemeraNene:Object = { spanish: "Remera Nene", english: "BOY T-SHIRT" };
			var oRemeraNena:Object = { spanish: "Remera Nena", english: "GIRL T-SHIRT" };
						
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Fede");
			ci.setDescription( oUnit );
			ci.setArticle("935");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Nano");
			ci.setDescription( oUnit );
			ci.setArticle("936");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Pepo");
			ci.setDescription( oUnit );
			ci.setArticle("937");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Pijama", english: "Sleepwear" } );
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
			ci.setDescription( oUnit );
			ci.setArticle("521");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lina");
			ci.setDescription( oUnit );
			ci.setArticle("522");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lulu");
			ci.setDescription( oUnit );
			ci.setArticle("519");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Sol");
			ci.setDescription( oUnit );
			ci.setArticle("520");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Pijama", english: "Sleepwear" } );
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
			ci.setDescription( oUnit );
			ci.setArticle("206");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Telma");
			ci.setDescription( oUnit );
			ci.setArticle("207");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Vicky");
			ci.setDescription( oUnit );
			ci.setArticle("205");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Pijama", english: "Sleepwear" } );
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
			ci.setName( oSlipCom );
			ci.setArticle("703");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSlipRay );
			ci.setArticle("704");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBoxerLiso );
			ci.setArticle("605");
			aData.push(ci);
			
			
			ci = new CarritoItemData();
			ci.setName( oBoxerRay );
			ci.setArticle("705");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBoxerLiso );
			ci.setDescription( oBoxerColl );
			ci.setArticle("706");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "R Interior", english: "Underwear" } );
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
			ci.setName( oBomb );
			ci.setDescription( oBombRL );
			ci.setArticle("602");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBombLL );
			ci.setArticle("702");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBombSet );
			ci.setDescription2( oLycraPrinted );
			ci.setArticle("610");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBombSet );
			ci.setDescription2( oLisoRibbed );
			ci.setArticle("615");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oCorpBomb );
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
			cig.setName( { spanish: "R Interior", english: "Underwear" } );
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
			ci.setName( oCorpCullotte );
			ci.setArticle("814");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oColaless );
			ci.setArticle("800");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBikini );
			ci.setArticle("801");
			aData.push(ci);
												
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "R Interior", english: "Underwear" } );
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
			ci.setName( oRemeraNene );
			ci.setArticle("800");
			aData.push(ci);
							
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Remera", english: "T-shirt" } );
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
			ci.setName( oRemeraNena );
			ci.setArticle("800");
			aData.push(ci);
							
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Remera", english: "T-shirt" } );
			cig.setColor( SiteColors.ROPA_REMERA_NENA );
			cig.setHeader( new CSHRopaRemeraNena() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
						
		}
		
	}
	
}