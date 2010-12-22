package com.zero.campi 
{
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransitionFactory 
	{
		
		public static function getInstance(trama:CampiBitmapTrama):TramaTransition
		{
			var total:Array = [ TramaTransition, TramaTransition2, TramaTransition3 ];
			return new TramaTransition2( trama );
			return new total[ Math.floor( Math.random() * total.length ) ]( trama ) ;
		}
		
	}

}