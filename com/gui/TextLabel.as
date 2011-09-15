package com.gui 
{
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TextLabel extends TextField 
	{
		
		public function TextLabel(formato:TextFormat=null) 
		{
			super();
			this.width = 0;
			this.autoSize = TextFieldAutoSize.LEFT;
			this.wordWrap = false;
			this.selectable = false;
			this.multiline = false;
			this.embedFonts = true;
			this.antiAliasType = AntiAliasType.ADVANCED;
			this.sharpness = 200;
			this.mouseEnabled = false;
			if ( formato ) {
				this.defaultTextFormat = formato;
			}
		}
		
	}

}