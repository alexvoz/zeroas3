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
			
			var oEstampado:Object = { spanish: "Estampada", english: "Printed" };
			var oEstampado34:Object = { spanish: "3/4 Estampada", english: "Knee High Printed" };
			var oEstampado12:Object = { spanish: "Estampada 1/2 Caña", english: "Calf High printed" };
			var oRay:Object = { spanish: "Rayada", english: "Stripes" };
			var oRay34:Object = { spanish: "3/4 Rayada", english: "Knee High Stripes" };
			var oRay12:Object = { spanish: "Rayada 1/2 Caña", english: "Calf High Stripes" };
			var oLiso:Object = { spanish: "Liso", english: "Solid Colors" };
			var oLisoBlanco:Object = { spanish: "Lisa Blanca", english: "Solid White" };
			var oLisoNegro:Object = { spanish: "Lisa Negra", english: "Solid Black" };
			var oLiso34:Object = { spanish: "3/4 Lisa", english: "Knee High Solid Colors" };
			var oLiso12:Object = { spanish: "Lisos 1/2 Caña", english: "LOW CUT SOLID COLORS" };
			var oLisa:Object = { spanish: "Lisa", english: "Solid Colors" };
			var oSoq:Object = { spanish: "Soquete", english: "Low cut" };
			var oSoqBlanco:Object = { spanish: "Soquete Blanco", english: "White Low cut" };
			var oSoqNegro:Object = { spanish: "Soquete Negro", english: "Black Low cut" };
			var oSoqDeportivo:Object = { spanish: "Soquete Deportivo", english: "Sports Low cut" };
			var oSoqLiso:Object = { spanish: "Soquete Liso", english: "Low Cut solid colors" };
			var oSoqEst:Object = { spanish: "Soquete Estampado", english: "Low Cut printed" };
			var oSoqRay:Object = { spanish: "Soquete Rayado", english: "Low Cut Stripes" };
			var oSoqMesh:Object = { spanish: "Soquete Mesh", english: "Low Cut mesh" };
			var oSoqCalado:Object = { spanish: "Soquete Calado", english: "Low Cut" };
			var oSoqCaladoBlanca:Object = { spanish: "Soquete Calado Blanco", english: "White Low Cut" };
			var oClassic:Object = { spanish: "Clasicas", english: "Classic" };
			var oModern:Object = { spanish: "Moderna", english: "Modern" };
			var oRombo:Object = { spanish: "Rombo", english: "Argyle" };
			var oRombo12:Object = { spanish: "Rombo 1/2 Caña", english: "Calf High Argyle" };
			
			var oDocena:Object = { spanish: "x docena", english: "x 12 units" };
			var oDocenaMixTalle:Object = { spanish: "(6 de varón y 6 de nena) T: 000-00-0-1", english: "(6 for boys, 6 for girls)" };
			var oDocenaMixTalle123:Object = { spanish: "(6 de varón y 6 de nena) T: 0-1-2-3", english: "(6 for boys, 6 for girls)" };
			var oDocenaMixTalle45:Object = { spanish: "(6 de varón y 6 de nena) T: 4-5", english: "(6 for boys, 6 for girls)" };
			var oDocMix:Object = { spanish: "(6 de varón y 6 de nena)", english: "(6 for boys, 6 for girls)" };
			var oDocMisc:Object = { spanish: "(varios colores unisex, nena y varón)", english: "(various colors, unisex, for boys and girls)" };
			var oDocMiscTalle:Object = { spanish: "(varios colores unisex, nena y varón) T: 000-00-0-1", english: "(various colors, unisex, for boys and girls)" };
			var oDocMiscTalleN:Object = { spanish: "(varios colores unisex, nena y varón) T: 0-1-2-3", english: "(various colors, unisex, for boys and girls)" };
			var oDocMiscTalle45:Object = { spanish: "(varios colores unisex, nena y varón) T: 4-5", english: "(various colors, unisex, for boys and girls)" };
			var oDocRay:Object = { spanish: "(variedad de rayadas)", english: "(stripes, available in various colors)" };
			var oDocRay2:Object = { spanish: "(variedad de rayadas, estampadas, lisas)", english: "(stripes, printed, solid colors)" };
			var oDocBLW:Object = { spanish: "(de azul o docena de blanco)", english: "(blue or white)" };
			var oDocBW:Object = { spanish: "(de negro, o docena de blanco)", english: "(black or white)" };
			var oDocenaVC:Object = { spanish: "x Docena (Varios Colores)", english: "(x 12 Units Various Colors)" };
			var oDocColors:Object = { spanish: "(varios colores)", english: "(diff. colors available)" };
			var oTalle01234:Object = { spanish: "T: 0-1-2-3", english: "T: 0-1-2-3" };
			var oTalle0a1:Object = { spanish: "T: 000-00-0-1", english: "T: 000-00-0-1" };
			var oTalleUnico:Object = { spanish: "Talle único", english: "" };
			var oVariedadRayas:Object = { spanish: "(Variedad de Rayas)", spanish: "" }
			var oVariedadRayasMix:Object = { spanish: "(Variedad de Rayas, Estampadas, Lisas)", spanish: "" }
			var oColegialAzul:Object = { spanish: "(Azul)", spanish: "(Blue)" }
			var oColegialBlanco:Object = { spanish: "(Blanco)", spanish: "(White)"}
			
			
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocenaMixTalle );
			ci.setArticle("1011");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMiscTalle );
			ci.setArticle("1850");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMix );
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
			ci.setDescription2( oDocenaMixTalle123 );
			ci.setArticle("1020");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMiscTalleN );
			ci.setArticle("1070");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocenaMixTalle123 );
			ci.setArticle("104");
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
			ci.setDescription2( oDocenaMixTalle45 );
			ci.setArticle("1090");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocMiscTalle45 );
			ci.setArticle("1070");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocena );
			ci.setDescription2( oDocenaMixTalle45 );
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
			
			//grupo Bucaneras
			
			aData = new Array();
			ci = new CarritoItemData();
						
			ci.setName( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oVariedadRayas );
			ci.setArticle("205");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Bucaneras", english: "Thigh High" } );
			cig.setColor( SiteColors.MEDIAS_BUCANERA);
			cig.setHeader( new CSHMediaBucanera() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo CANCAN
			
			aData = new Array();
			ci = new CarritoItemData();
						
			ci.setName ( oLisa );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oVariedadRayasMix );
			ci.setArticle("82");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Can-Can", english: "Can-Can" } );
			cig.setColor( SiteColors.MEDIAS_CANCAN);
			cig.setHeader( new CSHMediaCancan() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//grupo COLEGIAL
			
			aData = new Array();
			ci = new CarritoItemData();
						
			ci.setName ( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oColegialAzul );
			ci.setArticle("1070A");
			aData.push(ci);
			
			ci.setName ( oEstampado );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oColegialBlanco );
			ci.setArticle("1070B");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName( { spanish: "Colegial", english: "School" } );
			cig.setColor( SiteColors.MEDIAS_COLEGIAL);
			cig.setHeader( new CSHMediaColegial() ); 
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
						
			ci.setName( oClassic );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("950");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oModern );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("951");
			aData.push(ci);
						
			ci = new CarritoItemData();
			ci.setName( oRombo );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("952");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoq );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("102D");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName ( oSoqLiso );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("102L");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqRay );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("102R");
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
			ci.setName( oEstampado34 );
			ci.setDescription( oDocena );
			ci.setDescription2 ( oTalleUnico );
			ci.setArticle("204");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oRay34 );
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("203");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso34 );
			ci.setDescription( oDocenaVC );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("203L");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oEstampado12 );
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("202");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oRay12 );
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("200");
			aData.push(ci);
						
			ci = new CarritoItemData();
			ci.setName( oRombo12 );
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("206");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oLiso12 );
			ci.setDescription( oDocenaVC );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("201");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqEst );
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("101");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqLiso );
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("101L");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqBlanco);
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("101B");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqNegro);
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("101N");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName( oSoqDeportivo);
			ci.setDescription( oDocena );
			ci.setDescription2( oTalleUnico );
			ci.setArticle("101D");
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