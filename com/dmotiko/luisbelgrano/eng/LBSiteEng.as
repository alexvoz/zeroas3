package com.dmotiko.luisbelgrano.eng {
	
	import com.dmotiko.luisbelgrano.*;
	import com.general.WebSite;
	import flash.net.*;
	import flash.display.*;
	import flash.events.*;
	import flash.xml.*;
	
	public class LBSiteEng
	extends LBSite {
				
		//para evitar imports innecesarios
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():LBSiteEng {
			return LBSiteEng(app);
		}
		
		public static function dummyContent():Array {
			var aPortfolio = new Array();
			var aArtesAplicadas:Array = new Array();
			var aArtesPlasticas:Array = new Array();
				
			var pItem:LBPortfolioItemData; 
			var aPhotos:Array;
			var aItems:Array;
			var aSubItems:Array;
			var photo:LBPortfolioPhoto;
			var photoID:Number = 0;
			var sectionID:Number = 0;
			
			
			/* portfolio item 1 */
			aSubItems = new Array();
			
			/*subitem 1*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Decoration and signage of storefront.", "", "portfolio/navidad/bsAsDesign/minis/N-BD-1_mini.jpg", "portfolio/navidad/bsAsDesign/zoom/N-BD-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration and signage of storefront.", "", "portfolio/navidad/bsAsDesign/minis/N-BD-2_mini.jpg", "portfolio/navidad/bsAsDesign/zoom/N-BD-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "BsAs Design", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 1 */
			/*subitem 2*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Storefront signage.", "", "portfolio/navidad/escobar/minis/N-E-1_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Shopping mall gallery.", "", "portfolio/navidad/escobar/minis/N-E-2_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus´ house in the woods, with the elfs that help him with presents.", "", "portfolio/navidad/escobar/minis/N-E-3_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus´ house in the woods, with the elfs that help him with presents.", "", "portfolio/navidad/escobar/minis/N-E-4_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus´ house in the woods, with the elfs that help him with presents.", "", "portfolio/navidad/escobar/minis/N-E-5_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus´ house in the woods, with the elfs that help him with presents.", "", "portfolio/navidad/escobar/minis/N-E-6_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus´ house in the woods, with the elfs that help him with presents.", "", "portfolio/navidad/escobar/minis/N-E-7_mini.jpg", "portfolio/navidad/escobar/zoom/N-E-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Escobar", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 2 */
			/*subitem 3*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Christmas cloth flags at the Mall gallery.", "", "portfolio/navidad/lomasCenter/minis/N-LC-1_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Dolphins in the fountain, with Christmas hats.", "", "portfolio/navidad/lomasCenter/minis/N-LC-2_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Santa Claus´ forest, decorations details.", "", "portfolio/navidad/lomasCenter/minis/N-LC-3_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Signboard in Mall interior.", "", "portfolio/navidad/lomasCenter/minis/N-LC-4_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Christmas cloth flags at the Mall gallery.", "", "portfolio/navidad/lomasCenter/minis/N-LC-5_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Santa Claus´ forest, decorations details.", "", "portfolio/navidad/lomasCenter/minis/N-LC-6_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Santa Claus´ little palm tree house.", "", "portfolio/navidad/lomasCenter/minis/N-LC-7_mini.jpg", "portfolio/navidad/lomasCenter/zoom/N-LC-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "Lomas Center", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 3 */
			/*subitem 4*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Santa Claus house and sledge with elfs.", "", "portfolio/navidad/palermo/mini/N-P-1_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Detail of an elf.", "", "portfolio/navidad/palermo/mini/N-P-2_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Ornaments on columns inside shopping mall.", "", "portfolio/navidad/palermo/mini/N-P-3_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus house.", "", "portfolio/navidad/palermo/mini/N-P-4_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of Santa Claus house.", "", "portfolio/navidad/palermo/mini/N-P-5_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Mobile figures of stars, moons and suns with Christmas hats.", "", "portfolio/navidad/palermo/mini/N-P-6_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of the Christmas Kitchen decorative stage setting.", "", "portfolio/navidad/palermo/mini/N-P-7_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of the Christmas Kitchen decorative stage setting.", "", "portfolio/navidad/palermo/mini/N-P-8_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Details of the Christmas Kitchen decorative stage setting.", "", "portfolio/navidad/palermo/mini/N-P-9_mini.jpg", "portfolio/navidad/palermo/zoom/N-P-9_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
									
			pItem = new LBPortfolioItemData(sectionID as String, "Palermo", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 4 */
			/*subitem 5*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "5 m Christmas tree.", "portfolio/navidad/parqueBrown/minis/N-PB-1_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "Detail of the small animals in the woods.", "portfolio/navidad/parqueBrown/minis/N-PB-2_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "5 m Christmas tree.", "portfolio/navidad/parqueBrown/minis/N-PB-3_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "Storefront decoration.", "portfolio/navidad/parqueBrown/minis/N-PB-4_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "Detail of the small animals in the woods.", "portfolio/navidad/parqueBrown/minis/N-PB-5_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "Decorative signboard.", "portfolio/navidad/parqueBrown/minis/N-PB-6_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "Canopy and space decoration.", "portfolio/navidad/parqueBrown/minis/N-PB-7_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "5 m Christmas tree.", "portfolio/navidad/parqueBrown/minis/N-PB-8_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus Vegetable Garden."', "View of the decorative stage setting.", "portfolio/navidad/parqueBrown/minis/N-PB-9_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-9_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus Vegetable Garden."', "Santa Claus drinking mate while the bunnies harvest carrots.", "portfolio/navidad/parqueBrown/minis/N-PB-10_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-10_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus Vegetable Garden."', "Detail of the lettuces.", "portfolio/navidad/parqueBrown/minis/N-PB-11_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-11_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus Vegetable Garden."', "View of the decorative stage setting.", "portfolio/navidad/parqueBrown/minis/N-PB-12_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-12_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus Vegetable Garden."', "View from above.", "portfolio/navidad/parqueBrown/minis/N-PB-13_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-13_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '“Christmas Forest”', "Mobile figures of stars, moons and suns with Christmas hats.", "portfolio/navidad/parqueBrown/minis/N-PB-14_mini.jpg", "portfolio/navidad/parqueBrown/zoom/N-PB-14_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Parque Brown", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 5 */
			/*subitem 6*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, 'Pendant sledges.', "", "portfolio/navidad/plazaOeste/minis/N-PO-1_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Pendant sledges.', "", "portfolio/navidad/plazaOeste/minis/N-PO-2_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Pendant stars mobile.', "", "portfolio/navidad/plazaOeste/minis/N-PO-3_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Pendant sledges.', "", "portfolio/navidad/plazaOeste/minis/N-PO-4_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Santa Claus´ house with snow.', "", "portfolio/navidad/plazaOeste/minis/N-PO-5_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Santa Claus´ house on the stage.', "", "portfolio/navidad/plazaOeste/minis/N-PO-6_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Detail of landscape in the back and mill.', "", "portfolio/navidad/plazaOeste/minis/N-PO-7_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Pendant sledges.', "", "portfolio/navidad/plazaOeste/minis/N-PO-8_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;photo = new LBPortfolioPhoto(photoID as String, 'Mobile with Christmas ornaments.', "", "portfolio/navidad/plazaOeste/minis/N-PO-9_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-9_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photoID++;photo = new LBPortfolioPhoto(photoID as String, 'Christmas banner with Christmas motive.', "", "portfolio/navidad/plazaOeste/minis/N-PO-10_mini.jpg", "portfolio/navidad/plazaOeste/zoom/N-PO-10_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "Plaza Oeste", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 6 */
			/*subitem 7*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, 'Columns decorated with Christmas banners.', "", "portfolio/navidad/quilmes/minis/N-Q-1_mini.jpg", "portfolio/navidad/quilmes/zoom/N-Q-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Santa Claus hanging from a cloth.', "", "portfolio/navidad/quilmes/minis/N-Q-2_mini.jpg", "portfolio/navidad/quilmes/zoom/N-Q-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Columns decorated with Christmas banners.', "", "portfolio/navidad/quilmes/minis/N-Q-3_mini.jpg", "portfolio/navidad/quilmes/zoom/N-Q-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Detail of the Christmas decoration.', "", "portfolio/navidad/quilmes/minis/N-Q-4_mini.jpg", "portfolio/navidad/quilmes/zoom/N-Q-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
									
			pItem = new LBPortfolioItemData(sectionID as String, "Quilmes", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 7 */
			/*subitem 8*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus" Cabin in the woods. Portal de Rosario Shopping Mall.', "", "portfolio/navidad/rosario/minis/N-R-1_mini.jpg", "portfolio/navidad/rosario/zoom/N-R-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Santa Claus" Cabin in the woods. Portal de Rosario Shopping Mall.', "", "portfolio/navidad/rosario/minis/N-R-2_mini.jpg", "portfolio/navidad/rosario/zoom/N-R-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
												
			pItem = new LBPortfolioItemData(sectionID as String, "Rosario", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 8 */
			/*subitem 9*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Elf hang gliding.", "portfolio/navidad/unicenter/minis/N-U-1_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Elf surfing in a fountain.", "portfolio/navidad/unicenter/minis/N-U-2_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Planes mobile.", "portfolio/navidad/unicenter/minis/N-U-3_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "View of the Xmas crib with 25 figures.", "portfolio/navidad/unicenter/minis/N-U-4_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Santa Claus without his boots getting his feet wet in the fountain.", "portfolio/navidad/unicenter/minis/N-U-5_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Details with an affectionate elf.", "portfolio/navidad/unicenter/minis/N-U-6_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Detail of the Xmas crib.", "portfolio/navidad/unicenter/minis/N-U-7_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, '"Let´s be a little elf-like"', "Elf hang gliding.", "portfolio/navidad/unicenter/minis/N-U-8_mini.jpg", "portfolio/navidad/unicenter/zoom/N-U-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Unicenter", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 9 */
			
			pItem = new LBPortfolioItemData(sectionID as String, "Christmas", aPhotos, aSubItems);
			aArtesAplicadas.push(pItem);
			sectionID++;
			
			/*
			 * 
			 * END SECTION 1
			 * 
			 * */
			
			 /* portfolio item 2 */
			aSubItems = new Array();
			
			/*subitem 1*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Signboard on Casimiro Restaurant´s storefront, Caballito, Buenos Aires.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-1_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-2_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-3_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-4_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-5_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-6_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-7_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroCaballito/minis/DL-CC-8_mini.jpg", "portfolio/decLocales/casimiroCaballito/zoom/DL-CC-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Casimiro Caballito", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 1 */
			
			/*subitem 2*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-1_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-2_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-3_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-4_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-5_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-6_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decoration details in the playground.", "", "portfolio/decLocales/casimiroSanIsidro/minis/DL-CS-7_mini.jpg", "portfolio/decLocales/casimiroSanIsidro/zoom/DL-CS-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			
			
			pItem = new LBPortfolioItemData(sectionID as String, "Casimiro San Isidro", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 2 */
			
			/*subitem 3*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Entrance decoration and piñata for kids salon", "", "portfolio/decLocales/estacionJupiter/minis/DL-EJ-1_mini.jpg", "portfolio/decLocales/estacionJupiter/zoom/DL-EJ-1_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Entrance decoration and piñata for kids salon", "", "portfolio/decLocales/estacionJupiter/minis/DL-EJ-2_mini.jpg", "portfolio/decLocales/estacionJupiter/zoom/DL-EJ-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "Jupiter Station", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 3 */
			
			pItem = new LBPortfolioItemData(sectionID as String, "Store Deco", aPhotos, aSubItems);
			aArtesAplicadas.push(pItem);
			sectionID++;
			
			/* portfolio item 8 */
			aSubItems = new Array();
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-1_mini.jpg", "portfolio/taller/zoom/T-1_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-2_mini.jpg", "portfolio/taller/zoom/T-2_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-3_mini.jpg", "portfolio/taller/zoom/T-3_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-4_mini.jpg", "portfolio/taller/zoom/T-4_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-5_mini.jpg", "portfolio/taller/zoom/T-5_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-6_mini.jpg", "portfolio/taller/zoom/T-6_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-7_mini.jpg", "portfolio/taller/zoom/T-7_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-8_mini.jpg", "portfolio/taller/zoom/T-8_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-9_mini.jpg", "portfolio/taller/zoom/T-9_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-10_mini.jpg", "portfolio/taller/zoom/T-10_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-11_mini.jpg", "portfolio/taller/zoom/T-11_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-12_mini.jpg", "portfolio/taller/zoom/T-12_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-13_mini.jpg", "portfolio/taller/zoom/T-13_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Some pictures of the workshop in different phases of the design and making process.", "", "portfolio/taller/minis/T-14_mini.jpg", "portfolio/taller/zoom/T-14_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			 
			pItem = new LBPortfolioItemData(sectionID as String, "The Workshop", aPhotos, aSubItems);
			aArtesAplicadas.push(pItem);
			sectionID++;
			/* 
			 *   end Item 8
			 * 
			 * 
			 */
						
			 /* portfolio item 3 */
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Archway of the Bimbo artisan bakery. Buenos Aires Zoo.", "", "portfolio/marketing/minis/M-1_mini.jpg", "portfolio/marketing/zoom/M-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Archway of the Bimbo artisan bakery. Buenos Aires Zoo.", "", "portfolio/marketing/minis/M-2_mini.jpg", "portfolio/marketing/zoom/M-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "F1 Ferrari car for the CASE stand at Expo Chacra.", "", "portfolio/marketing/minis/M-3_mini.jpg", "portfolio/marketing/zoom/M-3_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "F1 Ferrari car for the CASE stand at Expo Chacra.", "", "portfolio/marketing/minis/M-4_mini.jpg", "portfolio/marketing/zoom/M-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Figurines for Christian Lacroix window display.", "", "portfolio/marketing/minis/M-5_mini.jpg", "portfolio/marketing/zoom/M-5_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Figurines for Christian Lacroix window display.", "", "portfolio/marketing/minis/M-6_mini.jpg", "portfolio/marketing/zoom/M-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Christmas decoration for Paula Cahen D´Anvers window display.", "", "portfolio/marketing/minis/M-7_mini.jpg", "portfolio/marketing/zoom/M-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Christmas decoration for Paula Cahen D´Anvers window display.", "", "portfolio/marketing/minis/M-8_mini.jpg", "portfolio/marketing/zoom/M-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Cheese display for Santa Rosa stand.", "", "portfolio/marketing/minis/M-9_mini.jpg", "portfolio/marketing/zoom/M-9_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Periscope for promotional campaing of the 571 movie.", "", "portfolio/marketing/minis/M-10_mini.jpg", "portfolio/marketing/zoom/M-10_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Gigantic figure of the packaging of Arquito Giratorio lollypops.", "", "portfolio/marketing/minis/M-11_mini.jpg", "portfolio/marketing/zoom/M-11_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Horse figure for Club Hípico Argentino.", "", "portfolio/marketing/minis/M-12_mini.jpg", "portfolio/marketing/zoom/M-12_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Santa Claus figures and decoration for Mantecol stands.", "", "portfolio/marketing/minis/M-13_mini.jpg", "portfolio/marketing/zoom/M-13_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Nativa check card made of foam rubber for advertising campaigns at the beach.", "", "portfolio/marketing/minis/M-14_mini.jpg", "portfolio/marketing/zoom/M-14_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Hindu sculptures for welcome event.", "", "portfolio/marketing/minis/M-15_mini.jpg", "portfolio/marketing/zoom/M-15_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Gigantic figure of the Menthoplus candy packaging with roulette.", "", "portfolio/marketing/minis/M-16_mini.jpg", "portfolio/marketing/zoom/M-16_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Paint jar figures for Mitsubishi. ", "", "portfolio/marketing/minis/M-17_mini.jpg", "portfolio/marketing/zoom/M-17_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Marketing", aPhotos);
			aArtesAplicadas.push(pItem);
			sectionID++;
			
			/*
			 *  END ITEM 3
			 * 
			 * */
			
			 /* portfolio item 4 */
			aSubItems = new Array();
			
			/*subitem 1*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-1_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-2_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-3_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-4_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-5_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-6_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-7_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-7_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Stage set for photo session for Club del Vino magazine.", "", "portfolio/escenografias/clubDelVino/minis/E-CV-8_mini.jpg", "portfolio/escenografias/clubDelVino/zoom/E-CV-8_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Club del Vino", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 1 */
			
			/*subitem 2*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Objects for Dibu III stage setting.", "", "portfolio/escenografias/dibu/minis/E-D-1_mini.jpg", "portfolio/escenografias/dibu/zoom/E-D-1_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Objects for Dibu III stage setting.", "", "portfolio/escenografias/dibu/minis/E-D-2_mini.jpg", "portfolio/escenografias/dibu/zoom/E-D-2_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Objects for Dibu III stage setting.", "", "portfolio/escenografias/dibu/minis/E-D-3_mini.jpg", "portfolio/escenografias/dibu/zoom/E-D-3_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "Dibu", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 2 */
			
			/*subitem 3*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Painting and objects for stage setting of 'Sin Complejos' TV program, Channel 13, Arg.", "", "portfolio/escenografias/varios/minis/E-V-1_mini.jpg", "portfolio/escenografias/varios/zoom/E-V-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Painting and objects for stage setting of 'Sin Complejos' TV program, Channel 13, Arg.", "", "portfolio/escenografias/varios/minis/E-V-2_mini.jpg", "portfolio/escenografias/varios/zoom/E-V-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Mural of Lipchestein paintings for cable TV program.", "", "portfolio/escenografias/varios/minis/E-V-3_mini.jpg", "portfolio/escenografias/varios/zoom/E-V-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Mural for Awankana music video.", "", "portfolio/escenografias/varios/minis/E-V-4_mini.jpg", "portfolio/escenografias/varios/zoom/E-V-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "3.5 m high cake for Quilmes beer commercial", "", "portfolio/escenografias/varios/minis/E-V-5_mini.jpg", "portfolio/escenografias/varios/zoom/E-V-5_zoom.png", "", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
									
			pItem = new LBPortfolioItemData(sectionID as String, "Miscellaneous", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 3 */
			
			pItem = new LBPortfolioItemData(sectionID as String, "Stage settings", aPhotos, aSubItems);
			aArtesAplicadas.push(pItem);
			sectionID++;
			
			/* 
			 *   end Item 4 
			 * 
			 * 
			 */
			
			/* portfolio item 5 */
			aSubItems = new Array();
			
			/*subitem 1*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, 'At the Station – 2000', "Oil on fiber 0,70 m x 0,70 m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-1_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-1_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Graphics fallen into Disuse - 2000', "Oil on fiber - 0.70m x 0.70m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-2_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-2_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Nocturnal in red - 2000', "Oil on fiber - 1.15m x 0.37m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-3_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-3_zoom.png", "portfolio/pintura/expoCentroCulturalSanTelmo/megaZoom/P-ECST-3_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Preceding Landscape  - 2000', "Oil on canvas - 1.20m x 1.00m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-4_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-4_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Red River - 2000', "Oil on canvas - 1.15m x 0.37m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-5_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-5_zoom.png", "portfolio/pintura/expoCentroCulturalSanTelmo/megaZoom/P-ECST-5_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Signs - 1999', "Oil on canvas - 1.00m x 1.00m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-6_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-6_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, 'Signs in the Sky - 1999', "Oil on canvas - 1.20m x 1.00m", "portfolio/pintura/expoCentroCulturalSanTelmo/minis/P-ECST-7_mini.jpg", "portfolio/pintura/expoCentroCulturalSanTelmo/zoom/P-ECST-7_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "CC San Telmo", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 1 */
			/*subitem 2*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Open Neighborhood - 2000", "Oil on fiber - 0.80m x 0.26m", "portfolio/pintura/expoMuseoPueyrredon/minis/P-EMP-1_mini.jpg", "portfolio/pintura/expoMuseoPueyrredon/zoom/P-EMP-1_zoom.png", "portfolio/pintura/expoMuseoPueyrredon/megaZoom/P-EMP-1_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Custodians of Hell - 2000", "Oil on fiber - 0.55m x 0.19m", "portfolio/pintura/expoMuseoPueyrredon/minis/P-EMP-2_mini.jpg", "portfolio/pintura/expoMuseoPueyrredon/zoom/P-EMP-2_zoom.png", "portfolio/pintura/expoMuseoPueyrredon/megaZoom/P-EMP-2_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "The Dehumanized - 2000", "Oil on fiber - 0.65m x 22.5m", "portfolio/pintura/expoMuseoPueyrredon/minis/P-EMP-3_mini.jpg", "portfolio/pintura/expoMuseoPueyrredon/zoom/P-EMP-3_zoom.png", "portfolio/pintura/expoMuseoPueyrredon/megaZoom/P-EMP-3_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "The Lord Enlightens Us - 2001", "Oil on fiber - 0.70m x 0.30m", "portfolio/pintura/expoMuseoPueyrredon/minis/P-EMP-4_mini.jpg", "portfolio/pintura/expoMuseoPueyrredon/zoom/P-EMP-4_zoom.png", "portfolio/pintura/expoMuseoPueyrredon/megaZoom/P-EMP-4_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Refugees - 2000", "Oil on fiber - 0.90m x 0.80m", "portfolio/pintura/expoMuseoPueyrredon/minis/P-EMP-5_mini.jpg", "portfolio/pintura/expoMuseoPueyrredon/zoom/P-EMP-5_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Ravaged Land - 2000", "Oil on fiber - 79.5m x 22.5m", "portfolio/pintura/expoMuseoPueyrredon/minis/P-EMP-6_mini.jpg", "portfolio/pintura/expoMuseoPueyrredon/zoom/P-EMP-6_zoom.png", "portfolio/pintura/expoMuseoPueyrredon/megaZoom/P-EMP-6_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Apocalyptic Landscape - 2001", "Oil on fiber - 0.80m x 0.25m", "portfolio/pintura/otros/minis/P-O-8_mini.jpg", "portfolio/pintura/otros/zoom/P-O-8_zoom.png", "portfolio/pintura/otros/megaZoom/P-O-8_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Bestial Flight - 2001", "Oil on fiber - 0.50m x 0.25m", "portfolio/pintura/otros/minis/P-O-11_mini.jpg", "portfolio/pintura/otros/zoom/P-O-11_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "Pueyrredón Museum", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 2 */
			/*subitem 3*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Red Carpet - 2001", "Oil on canvas - 0.25m x 0.60 m", "portfolio/pintura/figuras/minis/P-F-1_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-1_zoom.png", "portfolio/pintura/figuras/megaZoom/P-F-1_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Caryatid - 1998", "Oil on canvas - 1.00m x 1.00m", "portfolio/pintura/figuras/minis/P-F-2_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-2_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Lost in Thought - 1998", "Oil on canvas - 1.00m x 1.00m", "portfolio/pintura/figuras/minis/P-F-3_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-3_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Blue Figure - 2001", "Oil on fiber - 0.30m x 0.80m", "portfolio/pintura/figuras/minis/P-F-4_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-4_zoom.png", "portfolio/pintura/figuras/megaZoom/P-F-4_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Figure on the Lake - 2001", "Oil on fiber - 0.30m x 0.80m", "portfolio/pintura/figuras/minis/P-F-5_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-5_zoom.png", "portfolio/pintura/figuras/megaZoom/P-F-5_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Leaning Figure - 2000", "Oil on cardboard - 0.49m x 0.34m", "portfolio/pintura/figuras/minis/P-F-6_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-6_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Surprised Muse - 1998", "Oil on canvas - 0.80m x 1.00m", "portfolio/pintura/figuras/minis/P-F-7_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-7_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Pre-Raphaelist - 1998", "Oil on canvas - 1.00m x 1.00m", "portfolio/pintura/figuras/minis/P-F-8_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-8_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Beholding Beings - 1999", "Oil on cardboard - 0.30m x 0.50m", "portfolio/pintura/figuras/minis/P-F-9_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-9_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Ethereal Beings - 2000", "Oil on fiber - 0.58m x 1.17m", "portfolio/pintura/figuras/minis/P-F-10_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-10_zoom.png", "portfolio/pintura/figuras/megaZoom/P-F-10_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Suburbia - 2000", "Oil on cardboard - 0.32m x 0.70m", "portfolio/pintura/figuras/minis/P-F-11_mini.jpg", "portfolio/pintura/figuras/zoom/P-F-11_zoom.png", "portfolio/pintura/figuras/megaZoom/P-F-11_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
						
			pItem = new LBPortfolioItemData(sectionID as String, "Figures", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 3 */
			/*subitem 4*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "The Fall of the Guardian Angel - 2000", "Oil on fiber - 0.55m x 0.19m", "portfolio/pintura/otros/minis/P-O-1_mini.jpg", "portfolio/pintura/otros/zoom/P-O-1_zoom.png", "portfolio/pintura/otros/megaZoom/P-O-1_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "The Nap - 1995", "Oil on canvas - 0.50m x 0.40m", "portfolio/pintura/otros/minis/P-O-2_mini.jpg", "portfolio/pintura/otros/zoom/P-O-2_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Interior Space - 1995", "Oil on canvas - 1.00m x 0.80m", "portfolio/pintura/otros/minis/P-O-3_mini.jpg", "portfolio/pintura/otros/zoom/P-O-3_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Floating - 1995", "Oil on cardboard - 0.60m x 0.50m", "portfolio/pintura/otros/minis/P-O-4_mini.jpg", "portfolio/pintura/otros/zoom/P-O-4_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Interlude - 1998", "Oil on canvas - 0.80m x 1.00m", "portfolio/pintura/otros/minis/P-O-5_mini.jpg", "portfolio/pintura/otros/zoom/P-O-5_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Lyrical - 1999", "Oil on canvas - 1.20m x 1.00", "portfolio/pintura/otros/minis/P-O-6_mini.jpg", "portfolio/pintura/otros/zoom/P-O-6_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Melancholical - 2001", "Oil on fiber - 0.18m x 0.48m", "portfolio/pintura/otros/minis/P-O-7_mini.jpg", "portfolio/pintura/otros/zoom/P-O-7_zoom.png", "portfolio/pintura/otros/megaZoom/P-O-7_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Fisherman - 1997", "Oil on fiber - 0.80m x 1.00m", "portfolio/pintura/otros/minis/P-O-9_mini.jpg", "portfolio/pintura/otros/zoom/P-O-9_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Chairs - 1994", "Oil on canvas - 0.50m x 0.60m", "portfolio/pintura/otros/minis/P-O-10_mini.jpg", "portfolio/pintura/otros/zoom/P-O-10_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
												
			pItem = new LBPortfolioItemData(sectionID as String, "Other", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 4 */
			/*subitem 5*/
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Riverside Forest - 2001", "Oil on fiber 0.25m x 0.70m", "portfolio/pintura/paisajes/minis/P-P-1_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-1_zoom.png", "portfolio/pintura/paisajes/megaZoom/P-P-1_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "After the Storm - 1994", "Oil on fiber - 1.00m x 0.80m", "portfolio/pintura/paisajes/minis/P-P-2_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-2_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Horizon - 2001", "Oil on fiber - 0.25m x 0.80m", "portfolio/pintura/paisajes/minis/P-P-3_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-3_zoom.png", "portfolio/pintura/paisajes/megaZoom/P-P-3_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Garden of Eden - 1997", "Oil on canvas - 0.60m x 0.80m", "portfolio/pintura/paisajes/minis/P-P-4_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-4_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "The Reconquest - 2000", "Oil on canvas - 1.50m x 1.00m", "portfolio/pintura/paisajes/minis/P-P-5_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-5_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Unfinished Landscape - 2000", "Oil on canvas - 1.50m x 1.00m", "portfolio/pintura/paisajes/minis/P-P-6_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-6_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Windy Landscape - 2001", "Oil on canvas - 0.23m x 0.81m", "portfolio/pintura/paisajes/minis/P-P-7_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-7_zoom.png", "portfolio/pintura/paisajes/megaZoom/P-P-7_megazoom.jpg", LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Beach - 1995", "Oil on canvas - 0.40m x 0.30m", "portfolio/pintura/paisajes/minis/P-P-8_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-8_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "They Will Pass Below the Bridge - 2000", "Oil on fiber - 0.50m x 0.90m", "portfolio/pintura/paisajes/minis/P-P-9_mini.jpg", "portfolio/pintura/paisajes/zoom/P-P-9_zoom.png", undefined, LBPortfolioPhoto.PHOTO_TRANSPARENT);
			aPhotos.push(photo);
			photoID++;
									
			pItem = new LBPortfolioItemData(sectionID as String, "Landscapes", aPhotos);
			aSubItems.push(pItem);
			sectionID++;
			/* end subItem 5 */
						
			pItem = new LBPortfolioItemData(sectionID as String, "Paintings", aPhotos, aSubItems);
			aArtesPlasticas.push(pItem);
			sectionID++;
			/* 
			 *   end Item 5
			 * 
			 * 
			 */
			 	
			  /* portfolio item 6 */
			aSubItems = new Array();
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Soccer field decoration for Father´s Day at Plaza Oeste Shopping Mall, 06", "", "portfolio/variosShop/minis/V-1_mini.jpg", "portfolio/variosShop/zoom/V-1_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Storefront decoration for Portal de Palermo, fall-winter 03", "", "portfolio/variosShop/minis/V-2_mini.jpg", "portfolio/variosShop/zoom/V-2_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Storefront decoration for Portal de Palermo, fall-winter 03.", "", "portfolio/variosShop/minis/V-3_mini.jpg", "portfolio/variosShop/zoom/V-3_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Storefront decoration for Portal de Palermo, fall-winter 03.", "", "portfolio/variosShop/minis/V-4_mini.jpg", "portfolio/variosShop/zoom/V-4_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Storefront decoration for Portal de Palermo, fall-winter 03.", "", "portfolio/variosShop/minis/V-5_mini.jpg", "portfolio/variosShop/zoom/V-5_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Storefront decoration for Portal de Palermo, fall-winter 03.", "", "portfolio/variosShop/minis/V-6_mini.jpg", "portfolio/variosShop/zoom/V-6_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Signboard and decoration for Plaza Oeste Shopping Mall, fall-winter 03", "", "portfolio/variosShop/minis/V-7_mini.jpg", "portfolio/variosShop/zoom/V-7_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Signboard and decoration for Plaza Oeste Shopping Mall, fall-winter 03", "", "portfolio/variosShop/minis/V-8_mini.jpg", "portfolio/variosShop/zoom/V-8_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Easter decoration for advertising campaign stands at Unicenter, Portal Rosario and Plaza Oeste Shopping Malls.", "", "portfolio/variosShop/minis/V-9_mini.jpg", "portfolio/variosShop/zoom/V-9_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Easter decoration for advertising campaign stands at Unicenter, Portal Rosario and Plaza Oeste Shopping Malls.", "", "portfolio/variosShop/minis/V-10_mini.jpg", "portfolio/variosShop/zoom/V-10_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Pascuas, Decoraciones para stands promocionales de Pascuas en Unicenter, Plaza Oeste y Portal Rosario.", "", "portfolio/variosShop/minis/V-11_mini.jpg", "portfolio/variosShop/zoom/V-11_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Animal figures for Father´s Day decoration at Unicenter Shopping Mall.", "", "portfolio/variosShop/minis/V-12_mini.jpg", "portfolio/variosShop/zoom/V-12_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Winter decoration for Lomas Center Shopping Mall.", "", "portfolio/variosShop/minis/V-13_mini.jpg", "portfolio/variosShop/zoom/V-13_zoom.jpg", undefined, LBPortfolioPhoto.PHOTO_WIDE);
			aPhotos.push(photo);
			photoID++;
						 
			pItem = new LBPortfolioItemData(sectionID as String, "Miscellaneous", aPhotos, aSubItems);
			aArtesAplicadas.push(pItem);
			sectionID++;
			/* 
			 *   end Item 6
			 * 
			 * 
			 */
			 
			/* portfolio item 7 */
			aSubItems = new Array();
			aPhotos = new Array();
			photo = new LBPortfolioPhoto(photoID as String, "Mural in kids room.", "", "portfolio/decInterior/minis/DI-1_mini.jpg", "portfolio/decInterior/zoom/DI-1_zoom.jpg", "", LBPortfolioPhoto.PHOTO_SQUARE);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decorative painting on mirror and wooden niche.", "", "portfolio/decInterior/minis/DI-2_mini.jpg", "portfolio/decInterior/zoom/DI-2_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Decorative painting on elevator door.", "", "portfolio/decInterior/minis/DI-3_mini.jpg", "portfolio/decInterior/zoom/DI-3_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Mural on walls and closets.", "", "portfolio/decInterior/minis/DI-4_mini.jpg", "portfolio/decInterior/zoom/DI-4_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Gold leaf gilding of frames, and chimney and handrail.", "", "portfolio/decInterior/minis/DI-5_mini.jpg", "portfolio/decInterior/zoom/DI-5_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			photo = new LBPortfolioPhoto(photoID as String, "Gold leaf gilding of frames, and chimney and handrail.", "", "portfolio/decInterior/minis/DI-6_mini.jpg", "portfolio/decInterior/zoom/DI-6_zoom.jpg", "", LBPortfolioPhoto.PHOTO_VERTICAL);
			aPhotos.push(photo);
			photoID++;
			
			pItem = new LBPortfolioItemData(sectionID as String, "Interior Design", aPhotos);
			aArtesAplicadas.push(pItem);
			sectionID++;
			
			/*
			 * 
			 *  END ITEM 7
			 * 
			 * 
			 */
									
			aPortfolio.push( new LBPortfolioSectionData("1", "Applied Arts", aArtesAplicadas) );
			aPortfolio.push( new LBPortfolioSectionData("2", "Fine Arts", aArtesPlasticas) );
			
			return aPortfolio;
		}
				
		override protected function loadExternalContent():void {
			aPortfolio = dummyContent();
			setLanguage( LBSite.ENGLISH );
			this.externalContentLoaded();
		
		}
		
		override protected function externalContentLoaded( evnt:Event=undefined ):void {
						
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest( getResource("main_eng.swf") ); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler); 
			mLoader.load(mRequest);
			function onProgressHandler(loadEvent:ProgressEvent):void {
				var loadedbytes:uint = loadEvent.bytesLoaded;
				var totalbytes:uint = loadEvent.bytesTotal;
				var cargado:int = int(loadedbytes*100/totalbytes);
				if(getChildByName("loader")) getChildByName("loader").scaleX = cargado / 100;
				if (loadedbytes == totalbytes) {
					if(getChildByName("loader")) removeChild( getChildByName("loader"));
					if( getChildByName("loaderBar") ) removeChild( getChildByName("loaderBar") );
					if( getChildByName("loaderBar2") ) removeChild( getChildByName("loaderBar2") );
					if( getChildByName("loaderBar") ) removeChild( getChildByName("loaderText") );
				}
			}
			function onCompleteHandler(loadEvent:Event) {         
				setCenterClip(loadEvent.currentTarget.content.getChildByName("mcMask"));
				addChild(loadEvent.currentTarget.content);
				stage.dispatchEvent( new Event( Event.RESIZE ) );
			} 
			
		}
		
	}
	
}