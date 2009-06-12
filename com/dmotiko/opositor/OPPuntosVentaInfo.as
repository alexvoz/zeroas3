package com.dmotiko.opositor {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.geom.Rectangle;
	import flash.xml.XMLNode;
		
	public class OPPuntosVentaInfo
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
		
		private function scroll_content(e:Event):void {			
			var nTotal:Number = (mcBar.y + mcBar.height - mcDrag.height);
			var nDragPercent:Number = (mcDrag.y - mcBar.y) * 100 / nTotal;
			nDragPercent = Math.round( nDragPercent );
			if (nDragPercent > 96) nDragPercent = 100;
			var nDif:Number = mcContainer.height - mcMask.height;
			var nY:Number = nDragPercent * -(nDif) / 100;
			mcContainer.y = mcMask.y + nY;
		}
		
		private function start_drag(e:MouseEvent):void {
			mcDrag.startDrag( false, new Rectangle( mcDrag.x, mcBar.y, 0, mcBar.height - mcDrag.height ) ); 
			mcDrag.addEventListener( Event.ENTER_FRAME, scroll_content);
		}
		private function stop_drag(e:MouseEvent):void {
			mcDrag.stopDrag();
			mcDrag.removeEventListener( Event.ENTER_FRAME, scroll_content);
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
				var item:OPPuntosVentaInfoItem = new OPPuntosVentaInfoItem();
				item.setData( aFinalItems[i2] );
				item.y = nY;
				nY += item.height + 2;
				mcContainer.addChild(item);
			}
			//this.dispatchEvent( new Event( Event.COMPLETE ) );
			checkScroll();
		}
		
		private function checkScroll():void {
			var nDif:Number = mcContainer.height - mcMask.height;
			if(nDif > 0) {
				mcDrag.visible = mcBar.visible = true;
				mcDrag.y = mcBar.y;
				mcDrag.addEventListener( MouseEvent.MOUSE_DOWN, start_drag);
				if (mcDrag.stage) mcDrag.stage.addEventListener( MouseEvent.MOUSE_UP, stop_drag);
				else parent.addEventListener( MouseEvent.MOUSE_UP, stop_drag);
															
			} else {
				mcDrag.visible = mcBar.visible = false;
				mcDrag.removeEventListener( MouseEvent.MOUSE_DOWN, start_drag);
				if (mcDrag.stage) mcDrag.stage.removeEventListener( MouseEvent.MOUSE_UP, stop_drag);
				else parent.removeEventListener( MouseEvent.MOUSE_UP, stop_drag);
			}
		}
		
	}
	
}