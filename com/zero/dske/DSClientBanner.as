package com.zero.dske {
	
	import com.general.*
	import flash.events.*
	import flash.display.*
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	public class DSClientBanner
	extends BaseClip {
		
		private var container:Sprite;
		private var client_loaderXML:URLLoader;
		private var clientXMLList:XMLList;
		
		override protected function initClip():void {
			trace("initClip " + this);
			
			container = new Sprite();
			container.y = 40;
			this.addChild( container );
			
			//cargo los clientes
			client_loaderXML = new URLLoader();
			client_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			client_loaderXML.addEventListener( Event.COMPLETE, clientsLoaded );
			client_loaderXML.load( new URLRequest( "clients.xml" ) );
		}
		
		private function clientsLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data);
				trace(myXML.children()[0]);
				clientXMLList = myXML.children()[0].child("client");
				dataLoaded();
								
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				trace("Could not parse the XML")
				trace(e.message)
			}
		}
		
		private function dataLoaded():void {
			var nY:Number = 0;
			trace( clientXMLList );
			for each(var nodo:XML in clientXMLList.elements()){
				var item:DSClientItem = new DSClientItem();
				item.setData( { title: new String(nodo.@title), success: new String(nodo.@success), successHREF: new String(nodo.@successHREF) } );
				item.y = nY;
				container.addChild(item);
				nY += item.height; 
			}
		}
		
	}
	
}