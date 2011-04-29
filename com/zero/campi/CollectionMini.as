package com.zero.campi 
{
	import com.general.Image;
	import com.greensock.OverwriteManager;
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
		
		private var _data:XML;
		private var tweens:Vector.<TweenLite>;
		private var container:Sprite;
		private var containerSingle:Sprite;
		private var txtTitle:TextField;
		private var bMini:Boolean;
				
		public function CollectionMini( data:XML ) 
		{
			super();
			this._data = data;
			
			this.bMini = false;
			
			this.buttonMode = true;
			this.mouseChildren = false;
			
			var font:Font = new ButtonFont();
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
				var img:Image = new Image( sPath + p.@thumb, new Point(23, 35) );
				img.visible = false;
				if( p.@pdf == undefined ) p.@pdf = data.@pdf; //le clavo el pdf de la coleccion
				if( p.@download == undefined ) p.@download = data.@download; //le clavo el down de la coleccion
				container.addChild( img );
			}
			
			containerSingle = new Sprite();
			img = new Image( sPath + products[0].@thumb, new Point( 23, 35) );
			containerSingle.addChild(img);
			containerSingle.alpha = 0;
			containerSingle.x = -33;
			
			LayoutUtil.layoutX( container, 10 );
			txtTitle.visible = false;
			
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OVER, roll_over );
			this.addEventListener(MouseEvent.ROLL_OUT, roll_out );
			
		}
		
		private function roll_out(e:MouseEvent):void 
		{
			TweenLite.to( this, 0.5, { alpha: 1 } );
			if ( bMini ) {
				TweenLite.to( containerSingle, 0.5, { alpha: 0, x: 0, onComplete: function(){ if( contains( containerSingle ) ) removeChild(containerSingle) } } );
			}
		}
		
		private function roll_over(e:MouseEvent):void 
		{
			TweenLite.to( this, 0.5, { alpha: 0.7 } );
			if ( bMini ) {
				addChild( containerSingle );
				TweenLite.to( containerSingle, 0.5, { alpha: 1, x: -33 } );
			}
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
		
		public function makeMini() {
			bMini =  true;
			if ( contains(container) ) removeChild( container );
			for (var i:int = 0; i < container.numChildren; i++) 
			{
				TweenLite.killTweensOf( container.getChildAt(i), true );
			}
			TweenLite.killTweensOf( txtTitle, true );
			TweenLite.to( txtTitle, 0.5, { x:0 } );
		}
		
		public function makeNormal() {
			bMini =  false ;
			addChild( container );
			container.alpha = 1;
			//tweens.forEach( function( item:TweenLite, index:int, vector ) { item.resume(); } );
			TweenLite.to( txtTitle, 0.5, { x: container.getBounds( this ).right + 10, overwrite: false } );
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
		
		public function get data():XML { return _data; }
		
	}

}