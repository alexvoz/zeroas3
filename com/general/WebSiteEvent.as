package com.general {
	import flash.events.Event;
	
	public class WebSiteEvent
	extends Event {
		private var data;
		
		public function WebSiteEvent( type:String, data:Object) {
			this.data = data;
		}
		
		public function get data(): { return data; }
		
		public function set data(value:):void {
			data = value;
		}
		
	}
	
}