﻿package com.dmotiko.seluteens.dummy {
	import com.general.*;
	import com.gui.ScrollerMovie;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.geom.Rectangle;
	import flash.text.*;
	import flash.events.*;
	
	public class ComboListPVScroller
	extends BaseClip {
				
		private var targY;
		public var mcDrag:Sprite;
		public var mcBar:Sprite;
		public var mcContent:ComboListPVContent;
		public var mcMask:Sprite;
		public var mcNext:Sprite;
		public var mcPrev:Sprite;
		private var scrollAmount;
		
		public function ComboListPVScroller() {
				
			//set a variable
			targY=0;
			
			mcDrag.buttonMode = true;
			
			//set the x position of the mcDrag
			//mcDrag.x = mcBar.x - (mcDrag.width - mcBar.width) /2;
						
			//set the drag action of the mcDrag
			mcDrag.addEventListener(MouseEvent.MOUSE_DOWN, drag_press);
			
			//por ahora lo anulo
			//mcBar.addEventListener(MouseEvent.CLICK, bar_press);
						
			//set the mask for the text
			mcContent.mask = mcMask;
			mcContent.addEventListener( Event.CHANGE, content_changed );
			mcMask.alpha = 0.3;
			
			mcBar.visible = mcDrag.visible = false;
			
			if ( mcNext ) mcNext.addEventListener( MouseEvent.CLICK, force_drag );
			if ( mcPrev ) mcPrev.addEventListener( MouseEvent.CLICK, force_drag );
			
			//the scrolling animation
			mcContent.addEventListener( Event.ENTER_FRAME, content_check );
		}
		
		private function content_changed(e:Event):void {
			this.setData( e.currentTarget.getData() );
			dispatchEvent( new Event( Event.CHANGE ) ); 
		}
		
		private function force_drag(e:MouseEvent):void {
			var nOffset:Number;
			nOffset = 10 * 100 / (mcBar.height - mcDrag.height);
			if ( e.currentTarget == mcPrev ) nOffset *= -1;
			if ( mcDrag + nOffset < mcBar.y || mcDrag + nOffset > mcBar.y + mcBar.height - mcDrag.height ) return;
			var nY:Number = mcDrag.y + nOffset;
		}
		
		private function bar_press(e:MouseEvent):void {
			var nY:Number = mcBar.mouseY;
			if ( nY> mcBar.height - mcDrag.height) nY = mcBar.height - mcDrag.height;
			mcDrag.y = nY;
		}
		
		public function checkScroll():Boolean {
			mcBar.visible = mcDrag.visible = !(mcContent.height <= mcMask.height);
			if ( mcNext ) mcNext.visible = mcBar.visible;
			if ( mcPrev ) mcPrev.visible = mcBar.visible;
			return mcBar.visible;
		}
		
		private function content_check(e:Event):void {
			if( !checkScroll() ) return;
			/*set a variable 
			this variable basically stores info regarding what fraction of the total content 
			is being displayed through the mask and ensures that dragging the mcDrag
			from top to bottom will reveal all the text.
			*/
			scrollAmount=(mcContent.height-(mcMask.height/*/1.3*/))/(mcMask.height-mcDrag.height);
			//set a new target y position
			targY =-mcDrag.y*scrollAmount;
			//set the y of the text to 1/5 of the distance between its current y and the target y
			
			//change the 5 to a lower number for faster scrolling or a higher number for slower scrolling
			mcContent.y-=(mcContent.y-targY)/5;
		}
		
		private function drag_release(e:MouseEvent):void {
			mcDrag.stopDrag();
			mcDrag.removeEventListener(MouseEvent.MOUSE_UP, drag_release);
			if (mcDrag.stage) mcDrag.stage.removeEventListener( MouseEvent.MOUSE_UP, drag_release );
			else this.parent.removeEventListener( MouseEvent.MOUSE_UP, drag_release );
		}
		
		private function drag_press(e:MouseEvent):void {
			//drag is restricted to the height of the mask
			mcDrag.startDrag(false, new Rectangle(mcDrag.x, 0, 0, mcMask.height - mcDrag.height));
			mcDrag.addEventListener(MouseEvent.MOUSE_UP, drag_release);
			if (mcDrag.stage) mcDrag.stage.addEventListener( MouseEvent.MOUSE_UP, drag_release );
			else this.parent.addEventListener( MouseEvent.MOUSE_UP, drag_release );
		}
		
	}
	
}