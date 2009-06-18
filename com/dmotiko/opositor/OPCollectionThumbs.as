package com.dmotiko.opositor {
	
	import com.general.*;
	import FLA.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	
	public class OPCollectionThumbs
	extends BaseMenu {
		
		private var mcContainer:Sprite
		private var tBtnPrev:Tween;
		private var tBtnNext:Tween;
		private var tContainer:Tween;
		
		public var mcPrev:Sprite;
		public var mcNext:Sprite;
		public var mcDrag:Sprite;
		public var mcMask:Sprite;
		public var mcBar:Sprite;
		
		override protected function initClip():void {
			super.initClip();
			setSize( new Point( this.width, mcMask.height ) );
			
			mcContainer = new Sprite();
			this.addChild(mcContainer);
			mcContainer.rotation = mcMask.rotation;
			mcContainer.x = mcMask.x;
			mcContainer.y = mcMask.y;			
			mcContainer.mask = mcMask;
			mcPrev.buttonMode = mcNext.buttonMode = true;
			mcPrev.useHandCursor = mcNext.useHandCursor = true;
			mcPrev.addEventListener( MouseEvent.ROLL_OVER, btnOver);
			mcNext.addEventListener( MouseEvent.ROLL_OVER, btnOver);
			mcPrev.addEventListener( MouseEvent.ROLL_OUT, btnOut);
			mcNext.addEventListener( MouseEvent.ROLL_OUT, btnOut);
			mcPrev.addEventListener( MouseEvent.CLICK, scrollThumbs);
			mcNext.addEventListener( MouseEvent.CLICK, scrollThumbs);
			
			mcDrag.visible = false;
			//mcDrag.visible = mcBar.visible = mcNext.visible = mcPrev.visible = false;
			
			nSpace = 7;
			setView( OPCollectionThumb );
			
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData:XMLList = getData() as XMLList;
			for ( var i:int = 0; i < oData.length(); i++) {
				var item:BaseMenuBtn = new view();
				item.setData( oData[i] );
				item.addEventListener( MouseEvent.CLICK, activeBtn );
				aBtns.push(item);
			}
			layout();
		}
						
		private function checkScroll( evnt:TweenEvent = undefined ):void {
			var nDif:Number = mcContainer.height - mcMask.height;
			var bPrev:Boolean = nDif > 0 && mcContainer.y < mcMask.y;
			var bNext:Boolean = nDif > 0 && mcContainer.y > mcMask.y - nDif;
			
			function btnOff( evnt:TweenEvent ) {
				((evnt.currentTarget as Tween).obj as DisplayObject).visible = false;
			}
			
			if (bPrev) {
				mcPrev.mouseEnabled = true;
				mcPrev.visible = true;
				if (mcPrev.alpha < 1 ) {
					tBtnPrev = new Tween( mcPrev, "alpha", Regular.easeOut, mcPrev.alpha, 1, 0.5, true);
				}
			} else if( mcPrev.visible && mcPrev.alpha > 0) {
				mcPrev.mouseEnabled = false;
				tBtnPrev = new Tween( mcPrev, "alpha", Regular.easeOut, mcPrev.alpha, 0, 0.5, true);
				tBtnPrev.addEventListener( TweenEvent.MOTION_FINISH, btnOff);
			}
			
			if (bNext) {
				mcNext.mouseEnabled = true;
				mcNext.visible = true;
				if (mcNext.alpha < 1 ) {
					tBtnPrev = new Tween( mcNext, "alpha", Regular.easeOut, mcNext.alpha, 1, 0.5, true);
				}
			} else if( mcNext.visible && mcNext.alpha > 0) {
				mcNext.mouseEnabled = false;
				tBtnNext = new Tween( mcNext, "alpha", Regular.easeOut, mcNext.alpha, 0, 0.5, true);
				tBtnNext.addEventListener( TweenEvent.MOTION_FINISH, btnOff);
			}
			
		}
						
		override protected function layout():void {
			removeChild(mcContainer);
			mcContainer = new Sprite();
			this.addChild(mcContainer);
			mcContainer.rotation = mcMask.rotation;
			mcContainer.x = mcMask.x;
			mcContainer.y = mcMask.y;			
			mcContainer.mask = mcMask;
			
			var nY:Number = 0;
			var nX:Number = 0;
			var nLimit:Number = aBtns.length;
			for (var i:int = 0; i < nLimit; i++){
				var item:Sprite;
				item = aBtns[i];
				
				//si es multiplo de 3 y no es el primero bajo de linea
				if ( i != 0 && i % 2 == 0) {
					nX = 0;
					nY += item.height + nSpace;
				}
				
				item.x = nX;
				item.y = nY;
				nX += item.width + nSpace;
				
				if( aBtns[i] ) item.addEventListener( MouseEvent.CLICK, activeBtn);
				mcContainer.addChild(item);
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
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
			var nScroll:Number = mcContainer.getChildAt(0).height + nSpace ;
			if ( evnt.currentTarget == mcPrev) {
				nEnd = mcContainer.y + nScroll;
				//if (nEnd > 0) return;
				
			} else if ( evnt.currentTarget == mcNext) {
				nEnd = mcContainer.y - nScroll;
				//if (nEnd < -mcMask.height) return;
			}
			if (tContainer){  tContainer.stop(); }
			tContainer = new Tween( mcContainer, "y", Strong.easeOut, mcContainer.y, nEnd, 1.5, true);
			tContainer.addEventListener( TweenEvent.MOTION_FINISH, checkScroll);
			mcNext.mouseChildren = mcPrev.mouseChildren = false;
			mcNext.mouseEnabled = mcPrev.mouseEnabled = false;
		}
		
		override public function activeBtn( evnt:MouseEvent ):void {
			//OPSite.log( "OPCollectionThumbs | activeBtn= " + evnt.currentTarget);
			if (getActiveButton() == evnt.currentTarget as BaseMenuBtn) return;
			super.activeBtn(evnt);		
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