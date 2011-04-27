package com.zero.campi.distribucion 
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
	public class ZonaItem extends Sprite
	{
		
		public var local_title:TextField;
		public var sucursales:TextField;
		public var arrow:Sprite;
		public var mail:Sprite;
		
		private var local:XML;
		private var empresa:XML;
		
		public function ZonaItem(local:XML, empresa:XML ) 
		{
			//trace("new ZonaItem ");
			this.local = local;
			this.empresa = empresa;
			
			var font:Font = new ButtonLabel();
			var format:TextFormat = new TextFormat();
			format.font = font.fontName;
			
			var format2:TextFormat = new TextFormat();
			format2.font = font.fontName;
			format2.size = 11;
			format2.color = HTMLColors.grey;
						
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
						
			local_title.text = empresa.@name;
			
			LayoutUtil.layoutY(this, -5);
			try {
				if ( empresa.@mail && empresa.@mail.toString() != "" ) {
					mail = new ZonaItemEmail();
					mail.buttonMode = true;
					mail.x = local_title.getBounds(this).right + 5;
					mail.y = (local_title.height - mail.height ) / 2;
					mail.addEventListener(MouseEvent.CLICK, open_mail );
					addChild(mail);
				}
			} catch (e) {
				trace("ZonaItem empresa", empresa.@name,"@mail error ",e);
			}
			
			try {
				if ( empresa.@href && empresa.@href.toString() != "" ) {
					arrow = new ZonaItemHREF();
					arrow.buttonMode = true;
					if ( mail ) arrow.x = mail.getBounds(this).right + 5;
					else arrow.x = local_title.getBounds(this).right + 5;
					arrow.y = (local_title.height - arrow.height ) / 2;
					arrow.addEventListener(MouseEvent.CLICK, open_href );
					addChild(arrow);
				}
				
			} catch (e) {
				trace("ZonaItem empresa", empresa.@name,"@href error ",e);
			}
						
			sucursales.text = "Sucursales: "+ local;
			if ( local == "" ) removeChild(sucursales);
			
		}
		
		private function open_mail(e:MouseEvent):void 
		{
			navigateToURL( new URLRequest( "mailto:"+empresa.@mail ), "_self" );
		}
		
		private function open_href(e:MouseEvent):void 
		{
			navigateToURL( new URLRequest( empresa.@href ), "_blank" );
		}
		
	}

}