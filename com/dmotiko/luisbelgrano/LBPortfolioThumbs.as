package com.dmotiko.luisbelgrano {
	
	import com.general.*;
	import FLA.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	
	public class LBPortfolioThumbs
	extends BaseMenu {
		
		private var mcContainer:MovieClip;
		private var tContainer:Tween;
		private var aPos:Array;
		
		public function LBPortfolioThumbs() {
			super();
		}
		
		override protected function initClip():void {
			super.initClip();
			setSize( new Point( this.width, mcMask.height ) );
			
			mcContainer = new MovieClip();
			this.addChild(mcContainer);
			mcContainer.mask = mcMask;
			mcPrev.buttonMode = mcNext.buttonMode = true;
			mcPrev.useHandCursor = mcNext.useHandCursor = true;
			mcPrev.addEventListener( MouseEvent.ROLL_OVER, btnOver);
			mcNext.addEventListener( MouseEvent.ROLL_OVER, btnOver);
			mcPrev.addEventListener( MouseEvent.ROLL_OUT, btnOut);
			mcNext.addEventListener( MouseEvent.ROLL_OUT, btnOut);
			mcPrev.addEventListener( MouseEvent.CLICK, scrollThumbs);
			mcNext.addEventListener( MouseEvent.CLICK, scrollThumbs);
			checkScroll();
			
			nSpace = 8;
			setView( LBPortfolioThumb );
		}
		
		private function checkScroll( evnt:TweenEvent = undefined ):void {
			var bWidth:Boolean = mcContainer.height > mcMask.height;
			var bPrev:Boolean = mcContainer.y < 0;
			var bNext:Boolean = mcContainer.y > mcContainer.y - mcContainer.height + mcMask.y + mcMask.height;
			
			mcPrev.visible = bWidth && bPrev;
			mcNext.visible = bWidth && bNext;
		}
						
		override protected function layout():void {
			removeChild(mcContainer);
			mcContainer = new MovieClip();
			this.addChild(mcContainer);
			mcContainer.mask = mcMask;
			/*
			if( mcContainer.numChildren > 0){
				for (var child:int = 0; child < mcContainer.numChildren ; child++){
					mcContainer.removeChildAt( child );
				}
			}
			*/
			var nY:Number = 0;
			var nX:Number = 0;
			var nLimit:Number = ( aBtns.length >= 8) ? aBtns.length : 8;
			for (var i:int = 0; i < nLimit; i++){
				var item:Sprite;
				if (aBtns[i]) item = aBtns[i];
				else item = new PortfolioThumbEmpty();
				
				if ( i != 0 && i % 4 == 0) {
					nX = 0;
					nY += item.height + nSpace;
				}
				item.x = nX;
				item.y = nY;
				nX += item.width + nSpace;
				if( aBtns[i] ) item.addEventListener( MouseEvent.CLICK, activeBtn);
				mcContainer.addChild(item);
			}
			
			checkScroll();
		}
		
		private function btnOver( evnt:MouseEvent ):void {
			(evnt.currentTarget as MovieClip).alpha = 0.75;
		}
		private function btnOut( evnt:MouseEvent ):void {
			(evnt.currentTarget as MovieClip).alpha = 1;
		}
		private function scrollThumbs( evnt:MouseEvent ):void {
			var nEnd:Number;
			var nScroll:Number = mcContainer.getChildAt(0).height + nSpace;
			if ( evnt.currentTarget == mcPrev) {
				nEnd = mcContainer.y + nScroll;
				if (nEnd > 0) return;
				
			} else if ( evnt.currentTarget == mcNext) {
				nEnd = mcContainer.y - nScroll;
				if (nEnd < -mcMask.width) return;
			}
			if (tContainer){  tContainer.stop(); }
			tContainer = new Tween( mcContainer, "y", Strong.easeOut, mcContainer.y, nEnd, 1.5, true);
			tContainer.addEventListener( TweenEvent.MOTION_FINISH, checkScroll);
		}
		
		override public function activeBtn( evnt:MouseEvent ):void {
			super.activeBtn( evnt );
			var btn:DisplayObject = (evnt.currentTarget as DisplayObject);
			var check:Boolean = mcMask.hitTestObject( btn );
			if ( !check ) {
				var nEnd:Number = -btn.y;
				if (tContainer){  tContainer.stop(); }
				tContainer = new Tween( mcContainer, "y", Strong.easeOut, mcContainer.y, nEnd, 1.5, true);
				tContainer.addEventListener( TweenEvent.MOTION_FINISH, checkScroll);
			}
		}
		
	}
	
}