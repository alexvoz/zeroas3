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
			var oDes:Object = { spanish: "Desagujado", english: "looseknit" };
			var oCotton:Object = { spanish: "Algodón con Lycra", english: "Cotton and Lycra" };
			
			var oSlipLis:Object = { spanish: "Slip Liso", english: "solid color brief" };
			var oSlipEst:Object = { spanish: "Slip Estampado", english: "Painted Brief" };
			var oSlipRay:Object = { spanish: "Slip Rayado", english: "Striped Brief " };
			var oBoxerLiso:Object = { spanish: "Boxer Liso", english: "solid colors Boxer" };
			var oBoxerLisColl:Object = { spanish: "con collaret", english: "with waistband" };
			var oBoxerEst:Object = { spanish: "Boxer Estampado", english: "printed boxer" };
			var oBoxerRay:Object = { spanish: "Boxer Rayado", english: "Striped Boxer" };
			
			var oBomb:Object = { spanish: "Bombacha Clásica", english: "Classic Panties" };
			var oBombCE:Object = { spanish: "Bombacha Clásica Estampada", english: "classic printed PANTIES" };
			var oBombacha:Object = { spanish: "BOMBACHA", english: "panties" };
			var oBombCO:Object = { spanish: "Bombacha Colores Oscuros", english: "Dark Colors Panties" };
			var oConjCamBomb:Object = { spanish: "Conjunto Camiseta y Bombacha", english: "shirt and panties set" };
			var oCorpBomb:Object = { spanish: "Corpiño y Bombacha", english: "bra and panties" };
			var oCulotte:Object = { spanish: "Culotte", english: "Culotte" };
			var oMiniShort:Object = { spanish: "MiniShort", english: "MiniShort" };
						
			var oRemeraNene:Object = { spanish: "Remera Nene", english: "BOY T-SHIRT" };
			var oRemeraNena:Object = { spanish: "Remera Nena", english: "GIRL T-SHIRT" };
					
						
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Alex");
			ci.setDescription( { spanish: "(Interlock Estampado) x Unidad", english: "(Printed Interlock) per Unit" } );
			ci.setArticle("948");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Dante");
			ci.setDescription( { spanish: "(Interlock) x Unidad", english: "(Interlock) per Unit" } );
			ci.setArticle("954");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Elias");
			ci.setDescription( { spanish: "(Ribb) x Unidad", english: "(Ribb) per Unit" } );
			ci.setArticle("949");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Felix");
			ci.setDescription( { spanish: "(Interlock) x Unidad", english: "(Interlock) per Unit" } );
			ci.setArticle("946");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Igor");
			ci.setDescription( { spanish: "(Jersey) x Unidad", english: "(Jersey) per Unit" } );
			ci.setArticle("947");
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
			ci.setName("Ana");
			ci.setDescription( { spanish: "(Interlock) x Unidad", english: "(Interlock) per Unit" } );
			ci.setArticle("533");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Fiona");
			ci.setDescription( { spanish: "(Interlock Estampado) x Unidad", english: "(Printed Interlock) per Unit" } );
			ci.setArticle("537");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Kari");
			ci.setDescription( { spanish: "(Jersey) x Unidad", english: "(Jersey) per Unit" } );
			ci.setArticle("536");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Mia");
			ci.setDescription( { spanish: "(Interlock) x Unidad", english: "(Interlock) per Unit" } );
			ci.setArticle("535");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Nina");
			ci.setDescription( { spanish: "(Ribb) x Unidad", english: "(Ribb) per Unit" } );
			ci.setArticle("534");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Penty");
			ci.setDescription( { spanish: "(Intelock) x Unidad", english: "(Interlock) per Unit" } );
			ci.setArticle("532");
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
			ci.setName("Pijama");
			ci.setDescription2( oUnit );
			ci.setArticle("210");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Combinado");
			ci.setDescription2( oUnit );
			ci.setArticle("211");
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
			ci.setName( oSlipLis );
			ci.setArticle("703");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSlipEst );
			ci.setArticle("708");
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
			ci.setName( oBoxerLiso );
			ci.setDescription( oBoxerLisColl );
			ci.setArticle("706");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBoxerEst );
			ci.setArticle("707");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBoxerRay );
			ci.setArticle("705");
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
			ci.setDescription( "(Lycra)" );
			ci.setArticle("702");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBombCE );
			ci.setDescription( "(Lycra)" );
			ci.setArticle("604");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBombacha );
			ci.setDescription( "(Ribb)" );
			ci.setArticle("602");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oBombCO );
			ci.setDescription( "(Lycra)" );
			ci.setArticle("700");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oConjCamBomb );
			ci.setDescription2 (oCotton);
			ci.setArticle("610");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName(oConjCamBomb);
			ci.setDescription2(oDes);
			ci.setArticle("615");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName(oCorpBomb);
			ci.setArticle("609");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName(oCulotte);
			ci.setArticle("701");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName(oMiniShort);
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
			
		}
		
	}
	
}