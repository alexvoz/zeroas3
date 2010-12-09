package com.util {
	
	public class MathUtil {
		
		public static function random(min:int, max:int):int {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
		
	}
	
}