package com.zero.campi.form 
{
	import flash.events.FocusEvent;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiFieldMail extends CampiField 
	{
		
		function CampiFieldMail(label:String) {
			super(label);
		}
		
		override protected function validator(e:FocusEvent):void 
		{
			var exp:RegExp = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			validate = exp.test( value.toLowerCase() );
		}
		
	}

}