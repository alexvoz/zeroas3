package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.geom.Rectangle;
	import flash.xml.XMLNode;
		
	public class SeluPuntosVentaInfo
	extends BaseClip {
		
		private var mcContainer:Sprite;
		private var tBtnPrev:Tween;
		private var tBtnNext:Tween;
		private var tContainer:Tween;
		public var mcPrev:Sprite;
		public var mcDrag:Sprite;
		public var mcBar:Sprite;
		public var mcNext:Sprite;
		public var mcMask:Sprite;
		
		override protected function initClip():void {
			super.initClip();
						
			mcContainer = new Sprite();
			this.addChild(mcContainer);
			mcContainer.mask = mcMask;
			mcPrev.buttonMode = mcNext.buttonMode = true;
			mcPrev.useHandCursor = mcNext.useHandCursor = true;
						
			mcDrag.buttonMode = true;
			mcDrag.visible = mcBar.visible = mcNext.visible = mcPrev.visible = false;
			
		}
			
		override protected function refreshData():void {
			var aItems:Array = new String(data).split("\n");
			var aFinalItems:Array = new Array();
			var actualItem:Array = new Array();
			for (var i:Number = 0; i < aItems.length; i++) {
				var a:String = aItems[i] as String;
				if (i != aItems.length - 1 && a.charCodeAt( a.length - 1 ) == 13) a = a.substr(0, a.length - 1);
				if ( a != "") {
					actualItem.push( a );
					if (i == aItems.length - 1) {
						aFinalItems.push(actualItem);
						actualItem = new Array();
					}
				} else {
					aFinalItems.push(actualItem);
					actualItem = new Array();
				}
			}
						
			removeChild(mcContainer);
			mcContainer = new Sprite();
			mcContainer.mouseChildren =  mcContainer.mouseEnabled = false;
			this.addChild(mcContainer);
			mcContainer.mask = mcMask;
			
			var nY:Number = 0;
			var nLimit:Number = aFinalItems.length;
			for (var i2:int = 0; i2 < nLimit; i2++){
				var item:SeluPuntosVentaInfoItem = new SeluPuntosVentaInfoItem();
				item.setData( aFinalItems[i2] );
				item.y = nY;
				nY += item.height + 2;
				mcContainer.addChild(item);
			}
			//this.dispatchEvent( new Event( Event.COMPLETE ) );
			checkScroll();
		}
				
	}
	
}