package com.zero.campi.form 
{
	import flash.events.FocusEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiFieldArea extends CampiField 
	{
		
		public function CampiFieldArea(label:String, size:Point = undefined) 
		{
			super(label, new Point( 200, 150 ) );
			txtInput.multiline = true;
		}
		override protected function validator(e:FocusEvent):void 
		{
			validate = value.length > 5;
		}
		
	}

}