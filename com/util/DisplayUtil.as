package com.util {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	public class DisplayUtil {
		public static  function remove(obj:Object):void {
			if (obj) {
				if (obj is DisplayObject) {
					if (obj.parent) {
						try {
							obj.parent.removeChild(obj);
						} catch (e:Error) {
							trace("Couldn't remove the object. It wasn't a child of a DisplayObject.");
						}
					} else {
						trace("Couldn't remove object. Parent property is null.");
					}
				} else {
					trace("Couldn't remove object. It is not a DisplayObject.");
				}
			} else {
				trace("Couldn't remove the object. It was null or doesn't exist.");
			}
		}
		
		public static function clear(obj:DisplayObjectContainer):void {
			while ( obj.numChildren ) {
				obj.removeChildAt( obj.numChildren - 1 );
			}
		}
		public static function addChildren( container:DisplayObjectContainer, a:Array ) {
			a.forEach( function(item) { 
				if (item is DisplayObject) {
					container.addChild( item )
				}} 
				)			
		}
		public static function massiveRemove( a:Array ) {
			a.forEach( function(item){ remove(item) } )
		}
		public static function getChildren( obj:DisplayObjectContainer, type:Class=null ):Array {
			var a:Array = new Array();
			for (var i:int = 0; i < obj.numChildren; i++) 
			{
				if( !type || obj.getChildAt(i) is type ){
					a.push( obj.getChildAt(i) );
				}
			}
			return a;
		}
		/**
		 * @usage: layout generico en X o Y, sirve para armar en ambas direcciones tambien (si cols es true es horizontal, sino es vertical
		 * @author: sminutoli
		 */
		public static function layout( contenedor:DisplayObjectContainer, units:uint= undefined, space:Point = undefined, cols:Boolean=true ):void {
			
			if ( !space ) space = new Point(0, 0 );
			
			//por las dudas evaluo si el contenedor está vacío
			if ( contenedor.numChildren == 0 ) return;
			
			var nX:int = 0;
			var nY:int = 0;
						
			for (var i:int = 0; i < contenedor.numChildren; i++) 
			{
				var actual:DisplayObject = contenedor.getChildAt(i);
				if ( cols ) {
					actual.x = nX;
				} else {
					actual.y = nY;
				}
				if ( units && i > 0 && (i+1) % units == 0 ) {
					if ( cols ) {
						nX = 0;
						nY += actual.height + space.y;
					} else {
						nX += actual.width + space.x;
						nY = 0;
					}
				} else {
					if ( cols ) nX += actual.width + space.x;
					else nY += actual.height + space.y;
					//trace( actual, actual.width );
				}
			}
			
		}
		
		public static function getRenderSize( contenedor:DisplayObjectContainer ):Point {
			var size:Point = new Point();
			for (var i:int = 0; i < contenedor.numChildren; i++) 
			{
				size.x += contenedor.getChildAt(i).width;
				size.y += contenedor.getChildAt(i).height;
			}
			return size;
		}
		
	}
 
}