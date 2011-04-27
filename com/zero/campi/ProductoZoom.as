package com.zero.campi 
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
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
		public var minis:CollectionMiniBasic;
		
		public function ProductoZoom() 
		{
			txtTitle.autoSize = TextFieldAutoSize.LEFT;
			removeChild( txtTitle );
			removeChild( txtDescription );
			addEventListener(Event.ADDED_TO_STAGE, show_text );
		}
		
		public function hide():void {
			TweenLite.to( txtTitle, 0.5, { alpha: 0, y: txtTitle.y + 10  } );			
			TweenLite.to( txtDescription, 0.5, { alpha: 0, y: txtDescription.y + 10, delay: 0.5  } );
		}
		
		private function dispatch():void
		{
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function show_text(e:Event):void 
		{
			addChild( txtTitle );
			addChild( txtDescription );
			
			TweenLite.from( txtTitle, 0.5, { alpha: 0, y: txtTitle.y + 10  } );			
			TweenLite.from( txtDescription, 0.5, { alpha: 0, y: txtDescription.y + 10, delay: 0.5  } );			
			
			if ( minis) {
				addChild( minis );
				TweenLite.from( minis, 0.5, { alpha: 0, delay: 1  } );
			}
			
		}
		
	}

}