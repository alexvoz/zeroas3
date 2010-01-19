package com.zero.snap 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class SiteEvent extends Event
	{
		public var section:String;

		public function SiteEvent(sType:String, sSection:String, bBubbles:Boolean = false, bCancelable:Boolean = false) {
			super(sType, bBubbles, bCancelable);
			this.section = sSection;
		}
		public override function clone():Event {
            return new SiteEvent(type, this.section, bubbles, cancelable);
        }
        public override function toString():String
        {
            return formatToString("SiteEvent", "section", "type", "bubbles", "cancelable");
        }

	}
	
}