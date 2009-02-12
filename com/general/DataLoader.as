package com.general {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.*;
		
	
	public class DataLoader
	extends EventDispatcher {
			
		protected var dataSrc:String;
		protected var data:Object;
		protected var loader:URLLoader;
		
		/**
		 * @param	src | the XML file path
		 */
		function DataLoader(src:String) {
			this.dataSrc = src;
			loader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, parse );
		}
				
		public function loadData():void {
			
		}
		
		public function getData():Object {
			return this.data;
		}
			
		protected function parse( evnt:Event ):void {
			setData( undefined );
		}
		
		protected function setData(data:Object):void {
			this.data = data;
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
	}
	
}