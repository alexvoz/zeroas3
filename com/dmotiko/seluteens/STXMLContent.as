﻿package com.dmotiko.seluteens {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.*;
	
	public class STXMLContent
	extends EventDispatcher {
		
		/* data XML */
		private var collection_loaderXML:URLLoader;
		private var collectionXMLList:XMLList;
		
		private var stores_loaderXML:URLLoader;
		private var storesXMLList:XMLList;
		
		private var news_loaderXML:URLLoader;
		private var newsXMLList:XMLList;
		
		private var press_loaderXML:URLLoader;
		private var pressXMLList:XMLList;
		/* end data XML*/
		
		function STXMLContent() {
			collection_loaderXML = new URLLoader();
			collection_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			collection_loaderXML.addEventListener( Event.COMPLETE, collectionLoaded );
			collection_loaderXML.load( new URLRequest( "collection.xml" ) );
			
			stores_loaderXML = new URLLoader();
			stores_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			stores_loaderXML.addEventListener( Event.COMPLETE, storesLoaded );
			stores_loaderXML.load( new URLRequest( "stores.xml" ) );
			
			news_loaderXML = new URLLoader();
			news_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			news_loaderXML.addEventListener( Event.COMPLETE, newsLoaded );
			news_loaderXML.load( new URLRequest( "news.xml" ) );
			
			press_loaderXML = new URLLoader();
			press_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			press_loaderXML.addEventListener( Event.COMPLETE, pressLoaded );
			press_loaderXML.load( new URLRequest( "press.xml" ) );
		}
		
		private function newsLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				newsXMLList = myXML.child("new");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				STSite.log("Could not parse the news XML | "+e.message)
			}
		}
		
		private function storesLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				storesXMLList = myXML.child("locales");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				STSite.log("Could not parse the stores XML | "+e.message)
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
				STSite.log("Could not parse the collection XML | "+e.message)
			}
		}
		
		private function pressLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				pressXMLList = myXML.child("month");
				checkXML();
								
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				STSite.log("Could not parse the press XML | "+e.message)
			}
		}
		
		private function checkXML():void {
			if ( collectionXMLList && storesXMLList && newsXMLList && pressXMLList ) {
				this.dispatchEvent( new Event(Event.COMPLETE) );
			}
		}
		
		public function getCollectionData():XMLList { return collectionXMLList;	}
		public function getStoresData():XMLList { return storesXMLList;	}
		public function getNewsData():XMLList { return newsXMLList;	}
		public function getPressData():XMLList { return pressXMLList; }
		
	}
	
}