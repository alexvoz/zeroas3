package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.text.*;
	
	public class CarritoItem
	extends BaseMenuBtn {
		
		public var mcColor:MovieClip;
		public var mcBullet:MovieClip;
		public var txtTitle:TextField;
		public var txtDescription:TextField;
		public var txtDescription2:TextField;
		public var txtArticle:TextField;
		
		override protected function initClip():void {
			super.initClip();
			
			txtTitle.text = txtArticle.text = "";
			txtTitle.autoSize = txtDescription.autoSize = txtDescription2.autoSize = txtArticle.autoSize = TextFieldAutoSize.LEFT;
			txtTitle.mouseEnabled = txtDescription.mouseEnabled = txtDescription2.mouseEnabled = txtArticle.mouseEnabled = false;
			removeChild(txtDescription);
			removeChild(txtDescription2);
			
			addEventListener( MouseEvent.CLICK, toggle_active);
			
			if ( Site.getApp() ) {
				Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, lang_changed);
			}
		}
		
		private function lang_changed(e:Event):void 
		{
			if( data ) refreshData();
		}
		
		private function toggle_active(e:MouseEvent):void {
			setActive( !bActive );
		}
		
		override protected function refreshData():void {
			var item:CarritoItemData = data as CarritoItemData;
			
			//pinto el inicio
			var colorTransform:ColorTransform = mcColor.transform.colorTransform;
			colorTransform.color = item.getColor();
			mcColor.transform.colorTransform = colorTransform;
			
			//lleno los campos de texto
			txtTitle.text = item.getName().toUpperCase();
			txtArticle.text = item.getArticle();
			if( item.getDescription() ){
				txtDescription.text = item.getDescription();
				txtDescription.x = txtTitle.getBounds(this).right + 5;
				addChild(txtDescription);
			}
			if( item.getDescription2() ){
				txtDescription2.text = item.getDescription2();
				addChild(txtDescription2);
			}
		}
		
		override public function rollOver(evnt:MouseEvent):void { 
			mcBullet.gotoAndStop(2);
		}
		override public function rollOut(evnt:MouseEvent):void { 
			if ( bActive ) return;
			mcBullet.gotoAndStop(1);
		}
		
	}
	
}