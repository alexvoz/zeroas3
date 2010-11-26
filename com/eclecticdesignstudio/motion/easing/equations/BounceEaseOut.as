package com.eclecticdesignstudio.motion.easing.equations 
{
	import com.eclecticdesignstudio.motion.easing.IEasing;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class BounceEaseOut implements IEasing
	{
		public var a:Number;
		public var p:Number;
		
		public function BounceEaseOut(a:Number, p:Number) 
		{
			this.a = a;
			this.p = p;
		}
		
		/* INTERFACE com.eclecticdesignstudio.motion.easing.IEasing */
		
		public function calculate(k:Number):Number
		{
			trace("Bounce.easeOut calculate")
			return 0;
		}
		
		public function ease(t:Number, b:Number, c:Number, d:Number):Number
		{
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		}
		
	}

}