package com.eclecticdesignstudio.motion.easing.equations 
{
	import com.eclecticdesignstudio.motion.easing.IEasing;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class BounceEaseInOut implements IEasing
	{
		public var a:Number;
		public var p:Number;
		
		public function BounceEaseInOut(a:Number, p:Number) 
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
			if (t < d*0.5) return new BounceEaseIn(a,p).ease(t*2, 0, c, d) * .5 + b;
			else return new BounceEaseOut(a,p).ease(t*2-d, 0, c, d) * .5 + c*.5 + b;
		}
		
	}

}