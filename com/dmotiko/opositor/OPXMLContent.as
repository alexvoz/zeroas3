package com.dmotiko.opositor {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.*;
	
	public class OPXMLContent
	extends EventDispatcher {
		
		/* data XML */
		private var collection_loaderXML:URLLoader;
		private var collectionXMLList:XMLList;
		
		private var stores_loaderXML:URLLoader;
		private var storesXMLList:XMLList;
		/* end data XML*/
		
		function OPXMLContent() {
			collection_loaderXML = new URLLoader();
			collection_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			collection_loaderXML.addEventListener( Event.COMPLETE, collectionLoaded );
			collection_loaderXML.load( new URLRequest( "collection.xml" ) );
			
			stores_loaderXML = new URLLoader();
			stores_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			stores_loaderXML.addEventListener( Event.COMPLETE, storesLoaded );
			stores_loaderXML.load( new URLRequest( "stores.xml" ) );
		}
		
		private function storesLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				storesXMLList = myXML.child("locales");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				OPSite.log("Could not parse the stores XML | "+e.message)
			}
		}
		
		private function collectionLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				collectionXMLList = myXML.children()[0].child("photo");
				checkXML();
								
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				OPSite.log("Could not parse the collection XML | "+e.message)
			}
		}
		
		private function checkXML():void {
			if ( collectionXMLList && storesXMLList) {
				this.dispatchEvent( new Event(Event.COMPLETE) );
			}
		}
		
		public function getCollectionData():XMLList { return collectionXMLList;	}
		public function getStoresData():XMLList { return storesXMLList;	}
				
	}
	
}