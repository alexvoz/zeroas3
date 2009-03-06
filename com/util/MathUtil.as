package com.util {
	
	public class MathUtil {
		
		public static function random(min:Number, max:Number):Number {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
		
	}
	
}