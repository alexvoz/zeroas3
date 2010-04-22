package com.dmotiko.selu {
	import com.general.*;
	import flash.text.*;
	import flash.display.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class SeluCollectionInfo
	extends BaseClip {
		
		public var txtContent:TextField;
		public var mcNext:Sprite;
		public var mcPrev:Sprite;
		
		override protected function initClip():void {
			txtContent.htmlText = "";
			mcNext.buttonMode = mcPrev.buttonMode = true;
			mcNext.addEventListener( MouseEvent.CLICK, scroll_text);
			mcPrev.addEventListener( MouseEvent.CLICK, scroll_text);
			mcPrev.visible = false;
		}
		override protected function refreshData():void {
			txtContent.htmlText = "";
			var xml:XMLList = (data as XML).child("description")[0].child("item");
			for (var i:int = 0; i < xml.length(); i++) {
				var sContent:String = (xml[i] as XML).toXMLString();
				//saco los enters y doble espaciados
				while( sContent.indexOf(String.fromCharCode(10)) > -1  ){
					sContent = sContent.replace( String.fromCharCode(10), "");
				}
				while( sContent.indexOf("  ") > -1 ){
					sContent = sContent.replace("  ", " ");
				}
				//si el contenido es muy largo meto un <br> a la mitad de las palabras
				if ( sContent.length > 75 ) {
					var aWords:Array = sContent.split(" ");
					var nWords:int = Math.round(aWords.length / 2) + 1;
					sContent = aWords.slice(0, nWords).join(" ") + "<br>" + aWords.slice(nWords, aWords.length).join(" ");
				}
				txtContent.htmlText += sContent;
			}
			
		}
		private function scroll_text(e:MouseEvent):void 
		{
			if ( e.currentTarget == mcNext ) {
				txtContent.scrollV ++;
				if (txtContent.scrollV == txtContent.maxScrollV ) mcNext.visible = false;
				mcPrev.visible = true;
				
			} else {
				txtContent.scrollV --;
				if (txtContent.scrollV == 1 ) mcPrev.visible = false;
				mcNext.visible = true;
			}
		}
	}
	
}