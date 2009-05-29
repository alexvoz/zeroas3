package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
		
	public class SeluCollectionThumb
	extends BaseMenuBtn {
		
		private var loader:Loader;
		private var clipAlpha:Tween;
		private var spPhoto:Sprite;
		private var spProgress:Sprite;
				
		override protected function initClip():void {
			spPhoto = new Sprite();
			spPhoto.graphics.drawRect(0, 0, 63, 63);
			spPhoto.buttonMode = true;
			spPhoto.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			spPhoto.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			
			var spProgressBar:Sprite = new Sprite();
			spProgressBar.name = "spProgressBar";
			spProgressBar.graphics.beginFill(0x666666);
			spProgressBar.graphics.drawRect(0, 0, 5, 2);
			
			spProgress = new Sprite();
			spProgress.addChild( spProgressBar );
					
			this.addChild( spProgress );
			this.addChild( spPhoto );
			
			spProgress.x = (spPhoto.width - spProgress.width) / 2;
			spProgress.y = (spPhoto.height - spProgress.height) / 2;
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( SeluSite.getApp() ) ? SeluSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("mini") + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			spPhoto.addChild( this.loader );
			
			registerTween( "progressFade", new Tween( spProgress, "alpha", Regular.easeOut, 0, 1, 0.5, true), true, true);
		}
		
		override protected function tweenFinished( key:String, tween:Tween ):void {
			if ( key == "progressFade" ) {
				SeluSite.log("SeluCollectionThumb | tweenFinished " + key);
				tween.yoyo();
			}
		}
		
		private function thumbInit( evnt:Event ):void {
			SeluSite.log("SeluCollectionThumb | " + evnt.currentTarget.url + " | thumbInit");
			killTween( "progressFade" );
			removeChild(spProgress);
			var nAlpha:Number = 1;
			if (!bActive) nAlpha = 0.2; //spPhoto.alpha = 0.2;
			registerTween("thumbFade", new Tween( spPhoto, "alpha", Regular.easeOut, 0, nAlpha, 0.3, true) );
		}
		
		override public function rollOver( evnt:MouseEvent):void {
			if (clipAlpha) clipAlpha.stop();
			clipAlpha = new Tween( spPhoto, "alpha", Regular.easeIn, spPhoto.alpha, 1, 0.3, true);
		}
		override public function rollOut( evnt:MouseEvent):void {
			if ( bActive ) return;
			if (clipAlpha) clipAlpha.stop();
			clipAlpha = new Tween( spPhoto, "alpha", Regular.easeIn, spPhoto.alpha, 0.2, 0.3, true);
		}
		
	}
	
}