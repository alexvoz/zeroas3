package com.gui 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TextSmooth
	extends MovieClip
	{
		public var mcText:MovieClip;
		private var mcMask:Sprite;
		
		public function TextSmooth() 
		{
			//creo un contenedor
			mcMask = new Sprite();
			mcText.mask = mcMask;
			
		}
		
	}
	
}