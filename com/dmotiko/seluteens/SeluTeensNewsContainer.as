package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.geom.Rectangle;
	import flash.xml.XMLNode;
		
	public class SeluTeensNewsContainer
	extends BaseClip {
		
		public var mcContainer:MovieClip;
		private var tBtnPrev:Tween;
		private var tBtnNext:Tween;
		private var tContainer:Tween;
		public var mcPrev:MovieClip;
		public var mcDrag:MovieClip;
		public var mcBar:MovieClip;
		public var mcNext:MovieClip;
		public var mcMask:MovieClip;
		
		override protected function initClip():void {
			super.initClip();
			
			mcContainer.mask = mcMask;
			mcPrev.buttonMode = mcNext.buttonMode = true;
			mcPrev.useHandCursor = mcNext.useHandCursor = true;
						
			mcDrag.buttonMode = true;
			mcDrag.visible = mcBar.visible = mcNext.visible = mcPrev.visible = false;
			
			checkScroll();
			
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
			
		}
		
		private function checkScroll():void {
			var nDif:Number = mcContainer.height - mcMask.height;
			if(nDif > 0) {
				mcDrag.visible = mcBar.visible = true;
				mcDrag.y = mcBar.y;
				mcDrag.addEventListener( MouseEvent.MOUSE_DOWN, start_drag);
				parent.addEventListener( MouseEvent.MOUSE_UP, stop_drag);
															
			} else {
				mcDrag.visible = mcBar.visible = false;
				mcDrag.removeEventListener( MouseEvent.MOUSE_DOWN, start_drag);
				mcDrag.stage.removeEventListener( MouseEvent.MOUSE_UP, stop_drag);
			}
		}
		
	}
	
}