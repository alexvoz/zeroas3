package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
		
	public class STCollectionThumb
	extends BaseMenuBtn {
		
		//FLA instances
		public var mcBack:MovieClip;
		public var mcOver:MovieClip;
		//
		
		private var loader:Loader;
		private var spPhoto:Sprite;
		private var spProgress:Sprite;
				
		override protected function initClip():void {
			spPhoto = new Sprite();
			spPhoto.buttonMode = true;
			spPhoto.x = 10;
			spPhoto.y = 10;
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
			
			spProgress.x = spPhoto.x + (spPhoto.width - spProgress.width) / 2;
			spProgress.y = spPhoto.y +(spPhoto.height - spProgress.height) / 2;
		}
		
		override protected function refreshData():void {
			var sNoCache:String = ( STSite.getApp() ) ? STSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( (data as XML).attribute("mini") + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.contentLoaderInfo.addEventListener( Event.INIT, thumbInit);
			spPhoto.addChild( this.loader );
			
			registerTween( "progressFade", new Tween( spProgress, "alpha", Regular.easeOut, 0, 1, 0.5, true), true, true);
		}
		
		override protected function tweenFinished( key:String, tween:Tween ):void {
			if ( key == "progressFade" ) {
				//STSite.log("STCollectionThumb | tweenFinished " + key);
				tween.yoyo();
			}
		}
		
		private function thumbInit( evnt:Event ):void {
			killTween( "progressFade" );
			removeChild(spProgress);
			(loader.content as Bitmap).smoothing = true;
		}
		
		override public function rollOver( evnt:MouseEvent):void {
			mcOver.gotoAndStop(2);
		}
		override public function rollOut( evnt:MouseEvent):void {
			if ( bActive ) return;
			mcOver.gotoAndStop(3);
		}
		
		override public function setActive(active:Boolean):void {
			super.setActive( active );
		}
		
	}
	
}