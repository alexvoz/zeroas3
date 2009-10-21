package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
		
	public class CarritoMedias
	extends CarritoTemplate {
			
		override protected function initClip():void {
			super.initClip();
			
			var aData:Array;
			var ci:CarritoItemData;
			var cig:CarritoItemGroup;
			var nY:int = 0;
			
			var oEstampado:Object = { spanish: "Estampados", english: "Printed" };
			var oEstampado34:Object = { spanish: "3/4 Estampado", english: "Knee High Printed" };
			var oEstampado12:Object = { spanish: "Estampado 1/2 Caña", english: "Calf High printed" };
			var oRay:Object = { spanish: "Rayado", english: "Stripes" };
			var oRay34:Object = { spanish: "3/4 Rayado", english: "Knee High Stripes" };
			var oRay12:Object = { spanish: "Rayado 1/2 Caña", english: "Calf High Stripes" };
			var oLiso:Object = { spanish: "Lisos", english: "Solid Colors" };
			var oLiso34:Object = { spanish: "3/4 Liso", english: "Knee High Solid Colors" };
			var oLisa:Object = { spanish: "Lisas", english: "Solid Colors" };
			var oSoq:Object = { spanish: "Soquetes", english: "Low cut" };
			var oSoqBlanco:Object = { spanish: "Soquetes Blanco", english: "White Low cut" };
			var oSoqNegro:Object = { spanish: "Soquetes Negro", english: "Black Low cut" };
			var oSoqDeportivo:Object = { spanish: "Soquetes Deportivo", english: "Sports Low cut" };
			var oSoqLiso:Object = { spanish: "Soquetes Lisas", english: "Low Cut solid colors" };
			var oSoqEst:Object = { spanish: "Soquetes Estampado", english: "Low Cut printed" };
			var oSoqMesh:Object = { spanish: "Soquete Mesh", english: "Low Cut mesh" };
			var oSoqCalado:Object = { spanish: "Soquetes Calado", english: "Low Cut" };
			var oSoqCaladoBlanca:Object = { spanish: "Soquetes Calado Blanca", english: "White Low Cut" };
			var oClassic:Object = { spanish: "Clasicas", english: "Classic" };
			var oModern:Object = { spanish: "Modernas", english: "Modern" };
			var oRombo:Object = { spanish: "Rombos", english: "Argyle" };
			var oRombo12:Object = { spanish: "Rombo 1/2 Caña", english: "Calf High Argyle" };
			
			var oDocena:Object = { spanish: "x docena", english: "x 12 units" };
			var oDocMix:Object = { spanish: "(6 de varón y 6 de nena)", english: "(6 for boys, 6 for girls)" };
			var oDocMisc:Object = { spanish: "(varios colores unisex, nena y varón)", english: "(various colors, unisex, for boys and girls)" };
			var oDocRay:Object = { spanish: "(variedad de rayadas)", english: "(stripes, available in various colors)" };
			var oDocRay2:Object = { spanish: "(variedad de rayadas, estampadas, lisas)", english: "(stripes, printed, solid colors)" };
			var oDocBLW:Object = { spanish: "(de azul o docena de blanco)", english: "(blue or white)" };
			var oDocBW:Object = { spanish: "(de negro, o docena de blanco)", english: "(black or white)" };
			var oDocColors:Object = { spanish: "(varios colores)", english: "(diff. colors available)" };
			
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMix );
			ci.setArticle("1011");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMisc );
			ci.setArticle("1850");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocMix );
			ci.setArticle("104");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqBlanco );
			ci.setDescription( oDocMix );
			ci.setArticle("104");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Bebes", english: "Babies" } );
			cig.setColor( SiteColors.MEDIAS_BEBE );
			cig.setHeader( new CSHMediaBebe() ); 
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
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMix );
			ci.setArticle("1020");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMisc );
			ci.setArticle("1070");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocMix );
			ci.setArticle("105");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Niños", english: "Kids" } );
			cig.setColor( SiteColors.MEDIAS_NENES );
			cig.setHeader( new CSHMediaNenes() ); 
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
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMix );
			ci.setArticle("1090");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMisc );
			ci.setArticle("1070");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMix );
			ci.setArticle("105");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Juvenil", english: "Teens"} );
			cig.setColor( SiteColors.MEDIAS_JUVENIL );
			cig.setHeader( new CSHMediaJuvenil() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//return;
			//grupo7
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
						
			ci.setName( oClassic );
			ci.setDescription( oDocena );
			ci.setArticle("950");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oModern );
			ci.setDescription( oDocena );
			ci.setArticle("951");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocena );
			ci.setArticle("102");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqLiso );
			ci.setDescription( oDocena );
			ci.setArticle("102L");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqEst );
			ci.setDescription( oDocena );
			ci.setArticle("102");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqBlanco );
			ci.setDescription( oDocena );
			ci.setArticle("102");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqNegro );
			ci.setDescription( oDocena );
			ci.setArticle("102");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqDeportivo );
			ci.setDescription( oDocena );
			ci.setArticle("102M");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Hombre", english: "Men" } );
			cig.setColor( SiteColors.MEDIAS_HOMBRE);
			cig.setHeader( new CSHMediaHombre() ); 
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
						
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setArticle("204");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oRay );
			ci.setDescription( oDocena );
			ci.setArticle("203");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocColors );
			ci.setArticle("201");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocBW );
			ci.setArticle("203");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocBW );
			ci.setArticle("201");
			aData.push(ci);
						
			ci = new CarritoItemData();
			ci.setName( oSoqEst );
			ci.setDescription( oDocena );
			ci.setArticle("101");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocColors );
			ci.setArticle("101L");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocBW );
			ci.setArticle("101");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqCalado );
			ci.setDescription( oDocena );
			ci.setArticle("17");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqCaladoBlanca );
			ci.setDescription( oDocena );
			ci.setArticle("17");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqDeportivo );
			ci.setDescription( oDocena );
			ci.setArticle("101M");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Mujer", english: "Women" } );
			cig.setColor( SiteColors.MEDIAS_MUJER);
			cig.setHeader( new CSHMediaMujer() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
						
		}
				
	}
	
}