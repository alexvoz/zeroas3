package com.zero.campi.form 
{
	import flash.events.FocusEvent;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiFieldNotEmpty extends CampiField 
	{
		
		function CampiFieldNotEmpty( label:String ) {
			super(label);
		}
		
		override protected function validator(e:FocusEvent):void 
		{
			validate = value.length > 0;
		}
		
	}

}