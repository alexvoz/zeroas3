package com.util {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
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
		public static function getChildren( obj:DisplayObjectContainer ):Array {
			var a:Array = new Array();
			for (var i:int = 0; i < obj.numChildren; i++) 
			{
				a.push( obj.getChildAt(i) );
			}
			return a;
		}
		
	}
 
}