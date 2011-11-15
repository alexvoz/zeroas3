package com.zero.campi 
{
	import com.greensock.TweenLite;
	import com.adobe.utils.StringUtil;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class ProductoZoom extends Sprite 
	{
		
		public var txtTitle:TextField;
		public var txtDescription:TextField;
		public var txtPDF:TextField;
		public var txtDownload:TextField;
		public var minis:CollectionMiniBasic;
		public var btnClose:SimpleButton;
		private var nodo:XML;
		
		public function ProductoZoom(nodo:XML) 
		{
			this.nodo = nodo;
			
			txtTitle.autoSize = TextFieldAutoSize.LEFT;
			txtDescription.autoSize = TextFieldAutoSize.LEFT;
			removeChild( txtTitle );
			removeChild( txtDescription );
			removeChild( txtPDF );
			removeChild( txtDownload );
			removeChild( btnClose );
			addEventListener(Event.ADDED_TO_STAGE, show_text );
			
			txtTitle.text = nodo.@title.toUpperCase();
			txtDescription.htmlText = StringUtil.remove( nodo, "\r" );
			txtDescription.y = txtTitle.y + txtTitle.textHeight + 15;
			var nBotones:int = 500;
			if ( nodo.@pdf.toString().length ) {
				txtPDF.y = nBotones;
				txtDownload.y = txtPDF.y;
				txtDownload.x = txtPDF.x + txtPDF.textWidth + 5;
			} else {
				txtDownload.y = nBotones;
			}
			
			txtPDF.htmlText = "<a href='"+nodo.@pdf+"' target='_blank'>" + txtPDF.text + "</a>";
			txtDownload.htmlText = "<a href='" + nodo.@download + "' target='_blank'>" + txtDownload.text + "</a>";		
		}
						
		public function hide():void {
			TweenLite.to( txtTitle, 0.5, { alpha: 0, y: txtTitle.y + 10  } );			
			TweenLite.to( txtDescription, 0.5, { alpha: 0, y: txtDescription.y + 10, delay: 0.5  } );
			TweenLite.to( txtPDF, 0.5, { alpha: 0, y: txtPDF.y + 10, delay: 0.5  } );
			TweenLite.to( txtDownload, 0.5, { alpha: 0, y: txtDownload.y + 10, delay: 0.5  } );
		}
		
		private function dispatch():void
		{
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function show_text(e:Event):void 
		{
			addChild( txtTitle );
			addChild( txtDescription );
			//addChild( btnClose );
						
			TweenLite.from( txtTitle, 0.5, { alpha: 0, y: txtTitle.y + 10  } );			
			TweenLite.from( txtDescription, 0.5, { alpha: 0, y: txtDescription.y + 10, delay: 0.5  } );			
			//TweenLite.from( btnClose, 0.5, { alpha: 0, y: btnClose.y + 10, delay: 1  } );			
			
			if ( nodo.@pdf.toString().length ) {
				addChild( txtPDF );
				TweenLite.from( txtPDF, 0.5, { alpha: 0, y: txtPDF.y + 10, delay: 0.5  } );			
			}
			if ( nodo.@download.toString().length ) {
				addChild( txtDownload );
				TweenLite.from( txtDownload, 0.5, { alpha: 0, y: txtDownload.y + 10, delay: 0.5  } );			
			}
			
			if ( minis) {
				addChild( minis );
				TweenLite.from( minis, 0.5, { alpha: 0, delay: 1  } );
			}
			
		}
		
	}

}