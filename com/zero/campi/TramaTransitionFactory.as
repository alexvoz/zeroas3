package com.zero.campi 
{
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransitionFactory 
	{
		
		public static function getInstance(trama:CampiBitmapTrama, autoplay:Boolean=true):TramaTransition
		{
			var total:Array = [ TramaTransition, TramaTransition2, TramaTransition3, TramaTransition4, TramaTransition5, TramaTransition6, TramaTransition7, TramaTransition8 ];
			return new total[ Math.floor( Math.random() * total.length ) ]( trama, autoplay ) ;
		}
		
	}

}