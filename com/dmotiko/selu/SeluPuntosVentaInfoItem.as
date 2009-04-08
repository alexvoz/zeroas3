package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import flash.text.*;
	import com.general.*
	import flash.xml.XMLNode;
		
	public class SeluPuntosVentaInfoItem
	extends BaseClip {
				
		override protected function initClip():void {
			super.initClip();
			txtContent.autoSize = TextFieldAutoSize.LEFT;
			txtContent.text = "";
		}
		
		override protected function refreshData():void {
			//trace("SeluPuntosVentaInfoItem | refreshData");
			for each( var item in data) {
				var aWords:Array = (item as String).split(" ");
				for ( var i:Number = 0; i < aWords.length; i++) {
					aWords[i] = (aWords[i] as String).substr(0,1).toUpperCase()+(aWords[i] as String).substr(1).toLowerCase();
				}
				item = aWords.join(" ");
				txtContent.appendText( item + "\n" );
			}
			mcStroke.y = txtContent.y + txtContent.height + 2;
		}
		
	}
	
}