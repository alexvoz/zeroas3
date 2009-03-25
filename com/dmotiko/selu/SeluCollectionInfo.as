package com.dmotiko.selu {
	import com.general.*;
	import flash.text.*;
	import flash.display.*;
	
	public class SeluCollectionInfo
	extends BaseClip {
		
		override protected function initClip():void {
			//this.visible = false;
			//this.alpha = 0;
			//txtContent.autoSize = TextFieldAutoSize.LEFT;
			//(txtContent as TextField).embedFonts = true;
			txtContent.text = "";
		}
		override protected function refreshData():void {
			txtContent.text = "";
			var xml:XMLList = (data as XML).child("description")[0].child("item");
			for (var i:int = 0; i < xml.length(); i++) {
				var sContent:String = (xml.children()[i] as XML).toXMLString();
				txtContent.appendText(  sContent + "\n");
			}
		}
		
	}
	
}