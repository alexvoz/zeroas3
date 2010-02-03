package com.gui {
	
	import flash.display.*
	import flash.events.*
	import flash.geom.Rectangle;
	
	public class ScrollerMovie
	extends MovieClip {
		
		public var mcDrag:Sprite;
		public var mcTrigger:Sprite;
		public var mcBar:Sprite;
		public var mcContent:Sprite;
		public var mcMask:Sprite;
		public var mcNext:Sprite;
		public var mcPrev:Sprite;
		protected var targY;
		protected var scrollAmount;
		
		public function ScrollerMovie() {
				
			//set a variable
			targY=0;
			
			if (mcTrigger) {
				mcTrigger.buttonMode = true;
				mcTrigger.addEventListener(MouseEvent.MOUSE_DOWN, drag_press);
			} else {
				mcDrag.buttonMode = true;
				mcDrag.addEventListener(MouseEvent.MOUSE_DOWN, drag_press);
			}
			
			//set the x position of the mcDrag
			//mcDrag.x = mcBar.x - (mcDrag.width - mcBar.width) /2;
						
			//set the drag action of the mcDrag
			
			
			//por ahora lo anulo
			//mcBar.addEventListener(MouseEvent.CLICK, bar_press);
			
			if ( !mcMask ) {
				mcMask = new Sprite();
				mcMask.y = mcBar.y;
				mcMask.x = 0;
				mcMask.graphics.beginFill(0);
				mcMask.graphics.drawRect(0,0, mcBar.x, mcBar.y + mcBar.height );
				this.addChild(mcMask);
			}
			
			//set the mask for the text
			if (!mcContent) {
				//trace("ScrollerMovie creating mcContent");
				mcContent = new Sprite();
				mcContent.name = "mcContent";
				mcContent.x = mcMask.x;
				mcContent.y = mcMask.y;
				this.addChild( mcContent );
			}
						
			mcContent.mask = mcMask;
			mcMask.alpha = 0.3;
			
			mcBar.visible = mcDrag.visible = false;
			
			if ( mcNext ) mcNext.addEventListener( MouseEvent.CLICK, force_drag );
			if ( mcPrev ) mcPrev.addEventListener( MouseEvent.CLICK, force_drag );
			
			//the scrolling animation
			mcContent.addEventListener( Event.ENTER_FRAME, content_check );
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
		
		protected function content_check(e:Event):void {
			if( !checkScroll() ) return;
			/*set a variable 
			this variable basically stores info regarding what fraction of the total content 
			is being displayed through the mask and ensures that dragging the mcDrag
			from top to bottom will reveal all the text.
			*/
			scrollAmount=(mcContent.height-(mcMask.height/*/1.3*/))/(mcBar.height-mcDrag.height);
			//set a new target y position
			targY =-mcDrag.y*scrollAmount;
			//set the y of the text to 1/5 of the distance between its current y and the target y
			
			//change the 5 to a lower number for faster scrolling or a higher number for slower scrolling
			mcContent.y-=(mcContent.y-targY)/5 ;
		}
		
		private function drag_release(e:MouseEvent):void {
			mcDrag.removeEventListener(MouseEvent.MOUSE_UP, drag_release);
			mcDrag.stopDrag();
			if (mcTrigger) mcTrigger.removeEventListener( Event.ENTER_FRAME, trigger_pos );
			if (mcDrag.stage) mcDrag.stage.removeEventListener( MouseEvent.MOUSE_UP, drag_release );
			else this.parent.removeEventListener( MouseEvent.MOUSE_UP, drag_release );
		}
		
		private function drag_press(e:MouseEvent):void {
			//drag is restricted to the height of the mask
			if (mcTrigger) mcTrigger.addEventListener( Event.ENTER_FRAME, trigger_pos );
			mcDrag.addEventListener(MouseEvent.MOUSE_UP, drag_release);
			mcDrag.startDrag(false, new Rectangle(mcDrag.x, 0, 0, mcBar.height - mcDrag.height));
			
			if (mcDrag.stage) mcDrag.stage.addEventListener( MouseEvent.MOUSE_UP, drag_release );
			else this.parent.addEventListener( MouseEvent.MOUSE_UP, drag_release );
		}
		
		private function trigger_pos(e:Event):void {
			mcTrigger.y = mcDrag.y;
		}
		
	}
	
}