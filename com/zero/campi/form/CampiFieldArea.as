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
		
		public function CampiFieldArea(id:String, label:String, size:Point = undefined) 
		{
			super(id, label, new Point( 210, 150 ) );
			txtInput.multiline = true;
			txtInput.wordWrap = true;
		}
		override protected function validator(e:FocusEvent):void 
		{
			validate = value.length > 5;
		}
		
	}

}