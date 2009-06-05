package com.dmotiko.seluteens.dummy {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class ComboListPV
	extends BaseClip {
				
		public var mcScroller:ComboListPVScroller;
		public var mcClose:Sprite;
			
		override public function childLoaded( e:Event ):void {
			if ( e.currentTarget == mcScroller ) {
				mcScroller.alpha = 0;
				new Tween( mcScroller, "alpha", Regular.easeOut, mcScroller.alpha, 1, 0.5, true );
				mcScroller.addEventListener( Event.CHANGE, scroller_changed );
			}
		}
		
		protected function scroller_changed(e:Event):void {
			this.setData( e.currentTarget.getData() );
			new Tween( mcScroller, "alpha", Regular.easeOut, mcScroller.alpha, 0, 0.3, true );
			this.hide();
			dispatchEvent( new Event( Event.CHANGE ) ); 
		}
				
		override public function show():void {
			this.gotoAndPlay("show");
		}
		override protected function showEnd( evnt = undefined ): void {
			super.showEnd( evnt );
			mcClose.buttonMode = true;
			mcClose.addEventListener( MouseEvent.CLICK, function( e ) { 
				new Tween( mcScroller, "alpha", Regular.easeOut, mcScroller.alpha, 0, 0.3, true );
				hide() 
			} );
		}
		override public function hide():void {
			this.gotoAndPlay("hide");
		}
		
	}
	
}