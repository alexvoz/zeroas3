package com.dmotiko.opositor {
	import com.general.*;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.display.*;
	
	public class OPCollectionInfo
	extends BaseClip {
		
		public var txtArticle:TextField;
		public var txtMaterial:TextField;
		public var txtColor:TextField;
		public var mcSeparator:MovieClip;
				
		override protected function initClip():void {
			txtArticle.text = "";
			txtMaterial.text = "";
			txtColor.text = "";
			txtMaterial.autoSize = txtColor.autoSize = TextFieldAutoSize.RIGHT;
		}
		override protected function refreshData():void {
			txtArticle.text = "";
			txtMaterial.text = "";
			txtColor.text = "";
			var xml:XMLList = (data as XML).child("description")[0].child("item");
			for (var i:int = 0; i < xml.length(); i++) {
				var sContent:String = (xml[i] as XML).children()[0];
				//saco los enters y doble espaciados
				while( sContent.indexOf(String.fromCharCode(10)) > -1  ){
					sContent = sContent.replace( String.fromCharCode(10), "");
				}
				while( sContent.indexOf("  ") > -1 ){
					sContent = sContent.replace("  ", " ");
				}
				//si el contenido es muy largo meto un <br> a la mitad de las palabras
				switch(new String(xml[i].@type)) {
					case "article":
					txtArticle.appendText(sContent.toUpperCase());
					break;
					
					case "material":
					txtMaterial.appendText(sContent.toUpperCase()+"\n");
					break;
					
					case "color":
					txtColor.appendText(sContent.toUpperCase());
					break;
				} 
			}
			txtMaterial.y = txtArticle.y + txtArticle.height - 2;
			mcSeparator.y = txtMaterial.y + txtMaterial.height + 2;
			txtColor.y = mcSeparator.y + mcSeparator.height + 2;
			
		}
		
	}
	
}