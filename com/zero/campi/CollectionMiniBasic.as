package com.zero.campi 
{
	import com.general.Image;
	import com.greensock.TweenLite;
	import com.util.LayoutUtil;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
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
				
		public function CollectionMiniBasic( data:XML, activeNode:XML ) 
		{
			super();
			this._data = data;
			
			container = new Sprite();
			addChild(container);
			
			products = data.product;
			var i = 0;
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
				}
				
				container.addChild( img );
				i++;
			}
			
			LayoutUtil.layoutX( container, 10 );
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