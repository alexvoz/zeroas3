package com.dmotiko.opositor {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
		
	public class OPCollectionThumb
	extends BaseMenuBtn {
		
		//FLA instances
		public var mcPhoto:MovieClip;
		//
		
		private var loader:Loader;
		private var spPhoto:Sprite;
		private var spProgress:Sprite;
				
		override protected function initClip():void {
			mcPhoto.buttonMode = true;
			mcPhoto.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			mcPhoto.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			/*
			var spProgressBar:Sprite = new Sprite();
			spProgressBar.name = "spProgressBar";
			spProgressBar.graphics.beginFill(0x666666);
			spProgressBar.graphics.drawRect(0, 0, 5, 2);
			
			spProgress = new Sprite();
			spProgress.addChild( spProgressBar );
					
			this.addChild( spProgress );
			this.addChild( spPhoto );
			
			spProgress.x = spPhoto.x + (spPhoto.width - spProgress.width) / 2;
			spProgress.y = spPhoto.y +(spPhoto.height - spProgress.height) / 2;
			*/
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( OPSite.getApp() ) ? OPSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("mini") + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			mcPhoto.addChild( this.loader );
			
			//registerTween( "progressFade", new Tween( spProgress, "alpha", Regular.easeOut, 0, 1, 0.5, true), true, true);
		}
		
		override protected function tweenFinished( key:String, tween:Tween ):void {
			if ( key == "progressFade" ) {
				//OPSite.log("OPCollectionThumb | tweenFinished " + key);
				tween.yoyo();
			}
		}
		
		private function thumbInit( evnt:Event ):void {
			killTween( "progressFade" );
			//removeChild(spProgress);
			(loader.content as Bitmap).smoothing = true;
		}
		
		override public function rollOver( evnt:MouseEvent):void {
			this.gotoAndPlay("over");
		}
		override public function rollOut( evnt:MouseEvent):void {
			if ( bActive ) return;
			this.gotoAndPlay("out");
		}
		
		override public function setActive(active:Boolean):void {
			super.setActive( active );
		}
		
	}
	
}