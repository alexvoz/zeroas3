package com.eclecticdesignstudio.motion.easing 
{
	import com.eclecticdesignstudio.motion.easing.equations.BounceEaseIn;
	import com.eclecticdesignstudio.motion.easing.equations.BounceEaseInOut;
	import com.eclecticdesignstudio.motion.easing.equations.BounceEaseOut;
	/**
	 * ...
	 * @author sminutoli
	 */
	final public class Bounce
	{
		
		static public function get easeIn ():IEasing { return new BounceEaseIn (0.1, 0.4); }
		static public function get easeOut ():IEasing { return new BounceEaseOut (0.1, 0.4); }
		static public function get easeInOut ():IEasing { return new BounceEaseInOut (0.1, 0.4); }
		
		static public function easeInWith (a:Number, p:Number):IEasing {
			
			return new BounceEaseIn (a, p);
			
		}
		
		
		static public function easeOutWith (a:Number, p:Number):IEasing {
			
			return new BounceEaseOut (a, p);
			
		}
		
		
		static public function easeInOutWith (a:Number, p:Number):IEasing {
			
			return new BounceEaseInOut (a, p);
			
		}
		
		
	}

}