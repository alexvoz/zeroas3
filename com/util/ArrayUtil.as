package com.util {
	
	public class ArrayUtil {
		
		public static function randomArray(array:Array):Array {
			var array2:Array = clone(array);
			array2.sort( function(a, b){
				return MathUtil.random(-1, 1);
			});
			return array2;
		}
		
		public static function clone(array:Array):Array {
			var clone:Array = new Array();
			for (var i:int = 0; i < array.length; i++){
				clone.push(array[i]);
			}
			return clone;
		}
		
	}
	
}