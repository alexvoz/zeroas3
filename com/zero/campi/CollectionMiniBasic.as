package com.zero.campi 
{
	import com.general.Image;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.util.LayoutUtil;
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CollectionMiniBasic extends Sprite 
	{
		private var _data:XML;
		private var container:Sprite;
		private var products:XMLList;
		private var _activeNode:XML;
		private var btnPrev:SimpleButton;
		private var btnNext:SimpleButton;
		private var scrollPos:int;
				
		public function CollectionMiniBasic( data:XML, activeNode:XML ) 
		{
			super();
			this._data = data;
			
			container = new Sprite();
			addChild(container);
			
			products = data.product;
			var i = 0;
			var activeIndex = 0;
			for each( var p:XML in products ) {
				var sPath:String = p.@imgPath;
				if ( !sPath ) sPath = data.@imgPath;
				var img:Image = new Image( sPath + p.@thumb, new Point(30, 45), true );
				img.name = "id_" + p.@id;
				if ( p != activeNode ) {
					
					img.alpha = 0.5;
					img.buttonMode = true;
					img.addEventListener(MouseEvent.CLICK, set_active );	
					img.addEventListener(MouseEvent.ROLL_OVER, img_over );
					img.addEventListener(MouseEvent.ROLL_OUT, img_out );
				} else {
					activeIndex = i;
				}
				
				container.addChild( img );
				i++;
			}
			
			LayoutUtil.layoutX( container, 10 );
			container.scrollRect = new Rectangle( 0, 0, 30 * 4 + 10 * 3, 45 );
			if ( container.numChildren > 4 ) {
				
				btnPrev = new ProductArrow();
				btnNext = new ProductArrow();
				btnPrev.rotation = 90;
				btnNext.rotation = -90;
				btnPrev.y = btnNext.y = container.y + ( container.height / 2 );
				btnPrev.x = -15;
				btnNext.x = container.scrollRect.width + 15;
				addChild( btnPrev );
				addChild( btnNext );
				btnPrev.addEventListener(MouseEvent.CLICK, scroll_content );
				btnNext.addEventListener(MouseEvent.CLICK, scroll_content );
				scrollPos = 0;
				TweenLite.to( btnPrev, 0, { autoAlpha: 0 } );
				TweenLite.to( btnNext, 0, { autoAlpha: 0 } );
				if( activeIndex < 4 ){
					TweenLite.to( btnNext, 0.5, { autoAlpha: 1, delay: 3 } );
				} else {
					scrollPos = Math.min( container.numChildren - 4,  activeIndex );
					TweenLite.to( btnPrev, 0.5, { autoAlpha: 1, delay: 3 } );
					for (var i2:int = 0; i2 < container.numChildren; i2++) 
					{
						var child2:DisplayObject = container.getChildAt( i2 );
						var modulo2:int = 30 + 10;
						var inicio:int = -modulo2 * scrollPos;
						child2.x = inicio + modulo2*i2;
					}
				}
				
			}
		}
		
		private function scroll_content(e:MouseEvent):void 
		{
			switch( e.target ) {
				case btnPrev:
				if ( scrollPos > 0 ) {
					scrollPos--;
					if( scrollPos > 0 ) scrollPos--;
					if( scrollPos > 0 ) scrollPos--;
					if( scrollPos > 0 ) scrollPos--;
				}
				break;
				
				case btnNext:
				if ( scrollPos < container.numChildren - 4 ) {
					scrollPos++;
					if( scrollPos < container.numChildren - 4 ) scrollPos++;
					if( scrollPos < container.numChildren - 4 ) scrollPos++;
					if( scrollPos < container.numChildren - 4 ) scrollPos++;
				}
				break;
			}
			TweenLite.to( btnPrev, 0.5, { autoAlpha: scrollPos > 0 ? 1 : 0 } );
			TweenLite.to( btnNext, 0.5, { autoAlpha: scrollPos < container.numChildren - 4 ? 1 : 0 } );
						
			for (var i2:int = 0; i2 < container.numChildren; i2++) 
			{
				var child2:DisplayObject = container.getChildAt( i2 );
				var modulo2:int = 30 + 10;
				var inicio:int = -modulo2 * scrollPos;
				TweenLite.to( child2, 0.7, { x: inicio + modulo2*i2, ease: Strong.easeInOut, delay: i2 / 20 } );
			}
		}
		
		private function img_out(e:MouseEvent):void 
		{
			TweenLite.to( e.currentTarget, 0.5, { alpha: 0.5 } );
		}
		
		private function img_over(e:MouseEvent):void 
		{
			TweenLite.to( e.currentTarget, 0.5, { alpha: 1 } );
		}
		
		private function set_active(e:MouseEvent):void 
		{
			e.stopImmediatePropagation();
			_activeNode = products.( @id == e.currentTarget.name.split("_")[1] )[0];
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		public function get data():XML { return _data; }
		
		public function get activeNode():XML { return _activeNode; }
		
	}

}