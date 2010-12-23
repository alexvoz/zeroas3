package com.util 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class LayoutUtil 
	{
		
		public static function layoutX(d:DisplayObjectContainer, space:int = 0):DisplayObjectContainer {
			var nX:uint = 0;
			for (var i:int = 0; i < d.numChildren; i++) 
			{
				var child:DisplayObject = d.getChildAt(i);
				child.x = nX;
				nX += child.width + space; 
			}
			return d;
		}
		public static function layoutY(d:DisplayObjectContainer, space:int = 0):DisplayObjectContainer {
			var nY:uint = 0;
			for (var i:int = 0; i < d.numChildren; i++) 
			{
				var child:DisplayObject = d.getChildAt(i);
				child.y = nY;
				nY += child.height + space; 
			}
			return d;
		}
		
	}

}