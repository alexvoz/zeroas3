package com.eclecticdesignstudio.motion.easing.equations 
{
	import com.eclecticdesignstudio.motion.easing.IEasing;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class BounceEaseIn implements IEasing
	{
		public var a:Number;
		public var p:Number;
		
		public function BounceEaseIn(a:Number, p:Number) 
		{
			this.a = a;
			this.p = p;
		}
		
		/* INTERFACE com.eclecticdesignstudio.motion.easing.IEasing */
		
		public function calculate(k:Number):Number
		{
			
			return 0;
		}
		
		public function ease(t:Number, b:Number, c:Number, d:Number):Number
		{
			return c - new BounceEaseOut(a,p).ease(d-t, 0, c, d) + b;
		}
		
	}

}