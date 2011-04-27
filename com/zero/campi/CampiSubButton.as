package com.zero.campi 
{
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiSubButton extends CampiButton 
	{
		
		public function CampiSubButton(sName:String, data:Object) 
		{
			super(sName, data);
			
		}
		override protected function getFormat():TextFormat {
			var format:TextFormat = new TextFormat( new ButtonFont().fontName, 12, 0xb9b9b9 );
			format.kerning = true;
			format.letterSpacing = -0.2;
			return format;
		}
		
	}

}