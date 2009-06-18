package com.dmotiko.opositor {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.display.*;
		
	public class OPPhotoLoader
	extends BaseClip {
		
		public var mcBar:Sprite;
		public var mcMask:Sprite;
		public var mcBack:Sprite;
		
		override protected function initClip():void {
			mcBar.mask = mcMask;
			mcBar.y = mcBack.y + mcBack.height;
		}
		
		override protected function refreshData():void {
			var nY:Number;
			if( data is ProgressEvent ){
				if ( ! this.visible ) this.visible = true;
				var e:ProgressEvent = data as ProgressEvent;
				var p:int = Math.round( e.bytesLoaded * 100 / e.bytesTotal );
				nY = mcBack.y + mcBack.height - p * mcBack.height / 100;
				if ( mcBar.y >= nY ) return;
				registerTween( "barMove", new Tween( mcBar, "y", Regular.easeOut, mcBar.y, nY, 0.3, true) );
				
			} else if ( !(data is Event) && data.dummy ) {
				nY = mcBack.y + mcBack.height - 20 * mcBack.height / 100;
				registerTween( "barMove", new Tween( mcBar, "y", Regular.easeOut, mcBar.y, nY, 2, true) );
				
			} else {
				registerTween( "barMove", new Tween( mcBar, "y", Regular.easeOut, mcBar.y, mcBack.y, 0.3, true), false, true );
			}
		}
		
		override protected function tweenFinished(key:String, tween:Tween):void {
			this.visible = false;
			mcBar.y = mcBack.y + mcBack.height;
		}
		
	}
	
}