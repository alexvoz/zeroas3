package com.zero.campi.faq
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
	public class FAQItem extends Sprite
	{
		
		public var local_title:TextField;
		public var sucursales:TextField;
		public var arrow:Sprite;
		public var mail:Sprite;
		
		private var item:XML;
				
		public function FAQItem( item:XML ) 
		{
			this.item = item;
						
			var font:Font = new ButtonLabel();
			var format:TextFormat = new TextFormat();
			format.font = "Arial";
			format.color = HTMLColors.lightgrey;
									
			if( !local_title ){
				local_title = new TextField();
				local_title.width = 400;
				local_title.wordWrap = true;
				local_title.height = 0;
				local_title.autoSize = TextFieldAutoSize.LEFT;
				addChild( local_title );
				local_title.defaultTextFormat = format;
			}
					
			local_title.text = item;
		}
		
	}

}