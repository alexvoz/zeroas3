package com.general {
	
	import flash.xml.*
	import flash.net.*
	import flash.events.*
		
	
	public class DataXMLLoader
	extends DataLoader {
		
		function DataXMLLoader(src:String) {
			super(src);
		}
		
		override public function loadData():void {
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load( new URLRequest(dataSrc) );
		}
		
	}
	
}