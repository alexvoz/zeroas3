package com.zero.campi.form 
{
	import flash.events.FocusEvent;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiFieldNotEmpty extends CampiField 
	{
		
		function CampiFieldNotEmpty(id:String, label:String ) {
			super(id, label);
		}
		
		override protected function validator(e:FocusEvent):void 
		{
			validate = value.length > 0;
		}
		
	}

}