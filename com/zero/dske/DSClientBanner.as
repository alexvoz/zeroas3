package com.zero.dske {
	
	import com.general.*
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.events.*
	import flash.display.*
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	public class DSClientBanner
	extends BaseClip {
		
		private var container:Sprite;
		private var client_loaderXML:URLLoader;
		private var clientXMLList:XMLList;
		private var nItem:Number;
		private var tItems:Timer;
		
		override protected function initClip():void {
					
			container = new Sprite();
			container.y = 55;
			this.addChild( container );
			
			//armo el timer para mostrar a los flaquitos
			tItems = new Timer(300);
			tItems.addEventListener(TimerEvent.TIMER, showNextItem);
			
			//cargo los clientes
			client_loaderXML = new URLLoader();
			client_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			client_loaderXML.addEventListener( Event.COMPLETE, clientsLoaded );
			client_loaderXML.load( new URLRequest( "clients.xml" ) );
			
			this.alpha = 0;
			registerTween( "fadeIn", new Tween( this, "alpha", Regular.easeOut, 0, 1, 1, true ));
		}
		
		private function showNextItem(e:TimerEvent):void {
			var item:DSClientItem = container.getChildAt(nItem) as DSClientItem;
			item.visible = true;
			registerTween("itemFade" + nItem, new Tween( item, "alpha", Regular.easeOut, item.alpha, 1, 1, true));
			nItem++;
			if (nItem == container.numChildren) {
				tItems.reset();
				tItems.stop();
			} 
		}
		
		private function clientsLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data);
				clientXMLList = myXML.child("client");
				dataLoaded();
								
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				trace("Could not parse the XML")
				trace(e.message)
			}
		}
		
		private function dataLoaded():void {
			var nY:Number = 0;
			for each(var nodo:XML in new XML("<root>"+clientXMLList.toXMLString()+"</root>").elements()){
				var item:DSClientItem = new DSClientItem();
				item.setData( { title: new String(nodo.@title), successHREF: new String(nodo.@successHREF) } );
				item.x = 5;
				item.y = nY;
				item.visible = false;
				item.alpha = 0;
				container.addChild(item);
				nY += item.height + 4; 
			}
			nItem = 0;
			tItems.start();
		}
		
	}
	
}