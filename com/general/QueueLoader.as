package com.general 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class QueueLoader 
	{
		
		private var list:Dictionary;
		private var keys:Array;
		private var n:int;
		
		public function QueueLoader() 
		{
			list = new Dictionary(true);
			keys = new Array();
			reset();
		}
		public function reset():void  {
			n = -1;
		}
		public function push(path:String) {
			if ( ! list[ path ] ) {
				list[ path ] = "loading";
				keys.push( path );
			}
		}
		
	}

}