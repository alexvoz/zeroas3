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
					
			//grupo1
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Estampados");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varón y 6 de nena)");
			ci.setArticle("1011");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lisos");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores unisex, nena y varón)");
			ci.setArticle("1850");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varon y 6 de nena)");
			ci.setArticle("104");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Bebe");
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
			ci.setName("Estampados");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varón y 6 de nena)");
			ci.setArticle("1020");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lisos");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores unisex, nena y varón)");
			ci.setArticle("1070");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varón y 6 de nena)");
			ci.setArticle("104");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Niños");
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
			ci.setName("Estampados");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varón y 6 de nena)");
			ci.setArticle("1090");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Lisos");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores unisex, nena y varón)");
			ci.setArticle("1070");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes");
			ci.setDescription("x docena");
			ci.setDescription2("(6 de varon y 6 de nena)");
			ci.setArticle("105");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Juvenil");
			cig.setColor( SiteColors.MEDIAS_JUVENIL );
			cig.setHeader( new CSHMediaJuvenil() ); 
			cig.setData( aData );
			addChild(cig);
			cig.y = nY;
			nY += cig.getBounds(this).height + 20;
			cig.addEventListener( Event.CHANGE, group_change);
			aGroups.push(cig);
			
			//return;
			
			//grupo4
			//defino los items
			aData = new Array();
			ci = new CarritoItemData();
			ci.setName("Estampados");
			ci.setDescription("x docena");
			ci.setDescription2("(variedad de rayadas)");
			ci.setArticle("205");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Bucanera");
			cig.setColor( SiteColors.MEDIAS_BUCANERA );
			cig.setHeader( new CSHMediaBucanera() ); 
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
			ci.setName("Estampados");
			ci.setDescription("x docena");
			ci.setDescription2("(variedad de rayadas, estampadas, lisas)");
			ci.setArticle("082");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Can Can");
			cig.setColor( SiteColors.MEDIAS_CANCAN);
			cig.setHeader( new CSHMediaCanCan() ); 
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
			ci.setName("Lisas");
			ci.setDescription("x docena");
			ci.setDescription2("(de azul o docena de blanco)");
			ci.setArticle("000");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Colegial");
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
			ci.setName("Clasicas");
			ci.setDescription("x docena");
			ci.setArticle("950");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Modernas");
			ci.setDescription("x docena");
			ci.setArticle("951");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Rombos");
			ci.setDescription("x docena");
			ci.setArticle("952");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes");
			ci.setDescription("x docena");
			ci.setArticle("102");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquetes Lisas");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores)");
			ci.setArticle("000");
			aData.push(ci);
			
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Hombre");
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
			ci.setName("3/4 Estampado");
			ci.setDescription("x docena");
			ci.setArticle("204");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("3/4 Rayado");
			ci.setDescription("x docena");
			ci.setArticle("203");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("3/4 Liso");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores)");
			ci.setArticle("203");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("3/4 Estampado");
			ci.setDescription("x docena");
			ci.setDescription2("(de negro, o docena de blanco)");
			ci.setArticle("203");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Estampado 1/2 Caña");
			ci.setDescription("x docena");
			ci.setArticle("202");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Rayado 1/2 Caña");
			ci.setDescription("x docena");
			ci.setArticle("200");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Rombo 1/2 Caña");
			ci.setDescription("x docena");
			ci.setArticle("206");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Liso");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores)");
			ci.setArticle("201");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Liso");
			ci.setDescription("x docena");
			ci.setDescription2("(de negro, o docena de blanco)");
			ci.setArticle("201");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquete Estampado");
			ci.setDescription("x docena");
			ci.setArticle("101");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquete Liso");
			ci.setDescription("x docena");
			ci.setDescription2("(varios colores)");
			ci.setArticle("101");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquete Liso");
			ci.setDescription("x docena");
			ci.setDescription2("(de blanco o docena de negro)");
			ci.setArticle("101");
			aData.push(ci);
			
			ci = new CarritoItemData();
			ci.setName("Soquete Mesh");
			ci.setDescription("x docena");
			ci.setArticle("101");
			aData.push(ci);
						
			//defino el grupo
			cig = new CarritoItemGroup();
			cig.setView( CarritoItem );
			cig.setName("Mujer");
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