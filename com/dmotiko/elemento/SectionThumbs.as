package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	public class SectionThumbs
	extends BaseClip {
				
		protected var container:Sprite;
		protected var aThumbPos:Array; // define las coordenadas para acomodar las thumbs
		protected var pIndex:Point; // guarda el rango de indices
		protected var nThumbs:int; // numero de minis que se muestran por pantalla
		
		public var btnPrev:SimpleButton;
		public var btnNext:SimpleButton;
		private var _loaderXML:URLLoader;
		private var _XMLList:XMLList;
		
		override protected function initClip():void {
			nThumbs = 4;
			
			aThumbPos = new Array();
			aThumbPos[0] = new Point(60, 53);
			aThumbPos[1] = new Point(201, 180);
			aThumbPos[2] = new Point(60, 308);
			aThumbPos[3] = new Point(201, 435);
						
			btnNext.addEventListener( MouseEvent.CLICK, showNextIcons);
			btnPrev.addEventListener( MouseEvent.CLICK, showPrevIcons);
			
			_loaderXML = new URLLoader();
			_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			_loaderXML.addEventListener( Event.COMPLETE, xmlLoaded );
			
		}
		
		private function xmlLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				_XMLList = myXML.child("thumb");
				showIcons();
								
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				Site.log("Could not parse the XML | "+e.message)
			}
		}
		
		override protected function refreshData():void {
			//comienza con el rango 0 al numero de minis
			pIndex = new Point(0, nThumbs - 1);
			btnNext.visible = btnPrev.visible = false;
			
			_loaderXML.load( new URLRequest( data as String ) );
		}
		
		private function showPrevIcons(e:MouseEvent):void {
			pIndex.x = pIndex.x - nThumbs;
			pIndex.y = pIndex.y - nThumbs;
			showIcons();
		}
		
		private function showNextIcons(e:MouseEvent):void {
			pIndex.x = pIndex.y + 1;
			pIndex.y = pIndex.x + nThumbs - 1;
			showIcons();
		}
		
		private function showIcons():void {
			clearCanvas();
	
			var nPos = 0;
			for( var i:int = pIndex.x; i <= pIndex.y; i++){
				if(_XMLList[i]){
					var t = new ThumbIcon();
					t.x = aThumbPos[nPos].x;
					t.y = aThumbPos[nPos].y;
					t.setData( { src: _XMLList[i].@src } );
					container.addChild(t);
					nPos++;
				}
			}
			
			checkScroll();
		}
		
		private function checkScroll():void {
			btnPrev.visible = pIndex.x > 0;
			btnNext.visible = pIndex.y < _XMLList.length() - 1;
		}
		
		private function clearCanvas():void {
			if( container && this.contains(container) ) removeChild(container);
			container = new Sprite();
			addChild(container);
		}
		
	}
	
}