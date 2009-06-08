package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.*;
	import flash.display.*;
		
	public class STPhotoLoader
	extends BaseClip {
		
		public var mcBar:Sprite;
		public var mcMask:Sprite;
		public var mcBack:Sprite;
		
		override protected function initClip():void {
			mcBar.mask = mcMask;
			mcBar.y = mcBack.y + mcBack.height;
		}
		
		override protected function refreshData():void {
			if( data is ProgressEvent ){
				if ( ! this.visible ) this.visible = true;
				var e:ProgressEvent = data as ProgressEvent;
				var p:int = Math.round( e.bytesLoaded * 100 / e.bytesTotal );
				var nY:Number = mcBack.y + mcBack.height - p * mcBack.height / 100;
				registerTween( "barMove", new Tween( mcBar, "y", Regular.easeOut, mcBar.y, nY, 0.3, true) );
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