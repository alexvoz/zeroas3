package com.zero.campi 
{
	import com.general.Image;
	import com.greensock.TweenLite;
	import com.util.LayoutUtil;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CollectionMini extends Sprite 
	{
		
		private var data:XML;
		private var tweens:Vector.<TweenLite>;
		private var container:Sprite;
		private var txtTitle:TextField;
		
		public function CollectionMini( data:XML ) 
		{
			super();
			this.data = data;
			
			var font:Font = new FontCollection();
			var format:TextFormat = new TextFormat();
			format.font = font.fontName;
			format.size = 14;
			format.color = 0xC8C8C8;
						
			txtTitle = new TextField();
			txtTitle.embedFonts = true;
			txtTitle.autoSize = TextFieldAutoSize.LEFT;
			txtTitle.antiAliasType = AntiAliasType.ADVANCED;
			txtTitle.width = txtTitle.height = 0;
			txtTitle.selectable = false;
			
			txtTitle.defaultTextFormat = format;
			txtTitle.text = data.@title.toString().toUpperCase();
			
			addChild(txtTitle);
			
			container = new Sprite();
			addChild(container);
			
			var products:XMLList = data.product;
			for each( var p:XML in products ) {
				var sPath:String = p.@imgPath;
				if ( !sPath ) sPath = data.@imgPath;
				var img:Image = new Image( sPath + p.@thumb, new Point(23, 35), true );
				img.visible = false;
				container.addChild( img );
			}
			LayoutUtil.layoutX( container, 10 );
			txtTitle.visible = false;
			
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OVER, roll_over );
			this.addEventListener(MouseEvent.ROLL_OUT, roll_out );
			
		}
		
		private function roll_out(e:MouseEvent):void 
		{
			TweenLite.to( this, 0.5, { alpha: 1 } );
		}
		
		private function roll_over(e:MouseEvent):void 
		{
			TweenLite.to( this, 0.5, { alpha: 0.7 } );
		}
		
		public function show() {
			tweens = new Vector.<TweenLite>( container.numChildren+1, true );
			txtTitle.x = container.getBounds( this ).right + 10;
			txtTitle.y = container.y + ( container.height - txtTitle.textHeight ) / 2;
			txtTitle.visible = true;
			for (var i:int = 0; i < container.numChildren; i++) 
			{
				container.getChildAt(i).visible = true;
				tweens[i] = TweenLite.from( container.getChildAt(i), 0.5, { alpha: 0, x: 0, delay: i*0.3 } );
			}
			tweens[i] = TweenLite.from( txtTitle, 0.5, { alpha: 0, x: 0, delay: i * 0.3 } );
			
			tweens = tweens.sort( sortOnDelay ).reverse();
			tweens[0].vars.onComplete = show_end;
			tweens[0].vars.onReverseComplete = hide_end;
		}
		
		public function hide() {
			tweens.forEach( function( item:TweenLite, index:int, vector  ) { item.reverse(); } );
		}
		
		protected function show_end():void {
			this.dispatchEvent( new Event( CampiContent.SHOW_END ) );
		}
		
		protected function hide_end():void {
			this.dispatchEvent( new Event( CampiContent.HIDE_END ) );
		}
		
		protected function sortOnDelay(a, b):Number {
			if(a.vars.delay > a.vars.delay ) {
				return 1;
			} else if(a.vars.delay < b.vars.delay) {
				return -1;
			} else  {
				//aPrice == bPrice
				return 0;
			}
		}
		
	}

}