package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.text.*;
	
	public class PedidoItem
	extends BaseMenuBtn {
		
		public var mcColor:MovieClip;
		public var mcDelete:MovieClip;
		public var txtTitle:TextField;
		public var txtDescription:TextField;
		public var txtArticle:TextField;
		public var inputNum:TextField;
				
		override protected function initClip():void {
			super.initClip();
						
			txtTitle.text = txtArticle.text = inputNum.text = "";
			txtTitle.autoSize = txtDescription.autoSize = txtArticle.autoSize = TextFieldAutoSize.LEFT;
			txtTitle.mouseEnabled = txtDescription.mouseEnabled = txtArticle.mouseEnabled = false;
			inputNum.restrict = "0-9";
			inputNum.maxChars = 2;
			inputNum.addEventListener( Event.CHANGE, refresh_quant);
			
			removeChild(txtDescription);
						
			mcDelete.addEventListener( MouseEvent.CLICK, delete_item);
			
			if ( Site.getApp() ) {
				Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, lang_changed);
			}
		}
		
		private function lang_changed(e:Event):void 
		{
			if ( data ) refreshData();
		}
		
		private function refresh_quant(e:Event):void 
		{
			(getData().getData() as CarritoItemData).setQuant( new int(inputNum.text) );
		}
		
		private function delete_item(e:MouseEvent):void {
			((getData() as BaseMenuBtn).getData() as CarritoItemData).setQuant(1);
			(getData() as BaseMenuBtn).dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		
		override protected function refreshData():void {
			
			var item:CarritoItemData = data.getData() as CarritoItemData;
			
			inputNum.text = item.getQuant().toString();
			
			//pinto el inicio
			var colorTransform:ColorTransform = mcColor.transform.colorTransform;
			colorTransform.color = item.getColor();
			mcColor.transform.colorTransform = colorTransform;
			
			//lleno los campos de texto
			txtTitle.text = item.getParentName().toUpperCase()+" / "+item.getName().toUpperCase();
			txtArticle.text = item.getArticle();
			if( item.getDescription() ){
				txtDescription.text = item.getDescription();
				txtDescription.x = txtTitle.getBounds(this).right + 5;
				addChild(txtDescription);
			}
			
		}
		
		public function getValue():String {
			var item:CarritoItemData = data.getData() as CarritoItemData;
			var sItem:String = "";
			sItem += txtTitle.text + " | ART " + txtArticle.text + " | CANTIDAD: " + inputNum.text;
			if ( item.getDescription() && item.getDescription() != "" ) sItem += " | " + item.getDescription();
			if ( item.getDescription2() && item.getDescription2() != "" ) sItem += " " + item.getDescription2();
			sItem += "\n--\n";
			return sItem;
		}
		
	}
	
}