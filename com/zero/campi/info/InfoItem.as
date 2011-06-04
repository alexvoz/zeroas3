package com.zero.campi.info
{
	import com.util.HTMLColors;
	import com.util.LayoutUtil;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class InfoItem extends Sprite
	{
		
		public var local_title:TextField;
		public var sucursales:TextField;
		public var arrow:Sprite;
		public var mail:Sprite;
		
		private var item:XML;
				
		public function InfoItem( item:XML ) 
		{
			this.item = item;
						
			var font:Font = new ButtonLabel();
			var format:TextFormat = new TextFormat();
			format.font = font.fontName;
						
			var format2:TextFormat = new TextFormat();
			format2.font = font.fontName;
			format2.size = 11;
									
			if( !local_title ){
				local_title = new TextField();
				local_title.width = local_title.height = 0;
				local_title.embedFonts = true;
				local_title.autoSize = TextFieldAutoSize.LEFT;
				addChild( local_title );
				local_title.defaultTextFormat = format;
			}
			
			if( !sucursales ){
				sucursales = new TextField();
				sucursales.wordWrap = true;
				sucursales.width = 300;
				sucursales.height = 0;
				sucursales.embedFonts = true;
				sucursales.autoSize = TextFieldAutoSize.LEFT;
				addChild(sucursales);
				sucursales.defaultTextFormat = format2;
			}
						
			local_title.text = item.@name;
			
			LayoutUtil.layoutY(this, -5);
						
			try {
				if ( item.@href && item.@href.toString() != "" ) {
					arrow = new InfoItemHREF();
					arrow.buttonMode = true;
					arrow.x = local_title.getBounds(this).right + 5;
					arrow.y = (local_title.height - arrow.height ) / 2;
					arrow.addEventListener(MouseEvent.CLICK, open_href );
					addChild(arrow);
				}
				
			} catch (e) {
				trace("InfoItem ", item.@name,"@href error ",e);
			}
						
			sucursales.text = item;
			if ( item == "" ) removeChild(sucursales);
			
		}
		
		private function open_href(e:MouseEvent):void 
		{
			navigateToURL( new URLRequest( item.@href ), "_blank" );
		}
		
	}

}