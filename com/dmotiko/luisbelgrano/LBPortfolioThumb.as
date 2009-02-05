package com.dmotiko.luisbelgrano {
	import com.general.BaseMenuBtn;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	public class LBPortfolioThumb
	extends BaseMenuBtn {
		
		private var loader:Loader;
		private var shadowAlpha:Tween;
		private var clipAlpha:Tween;
		
		public function LBPortfolioThumb() {
			super();
		}
		override protected function initClip():void {
			mcShadow.alpha = 0.6;
			mcShadow.buttonMode = true;
			mcShadow.useHandCursor = true;
			mcShadow.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			mcShadow.addEventListener( MouseEvent.ROLL_OUT, rollOut);
			mcPhoto.mask = mcMask;
		}
		
		override protected function refreshData():void {
			var photo:LBPortfolioPhoto = getData() as LBPortfolioPhoto;
			var sNoCache:String = ( LBSite.getApp() ) ? LBSite.getApp().getNoCache() : "";
			var request:URLRequest = new URLRequest( photo.getIcon() + sNoCache );
			this.loader = new Loader();
			this.loader.load( request );
			this.loader.addEventListener( Event.INIT, thumbInit);
			mcPhoto.addChild( this.loader );
		}
		
		override public function rollOver( evnt:MouseEvent):void {
			if (shadowAlpha) shadowAlpha.stop();
			shadowAlpha = new Tween( mcShadow, "alpha", Regular.easeIn, mcShadow.alpha, 0, 1, true);
		}
		override public function rollOut( evnt:MouseEvent):void {
			if ( bActive ) return;
			if (shadowAlpha) shadowAlpha.stop();
			shadowAlpha = new Tween( mcShadow, "alpha", Regular.easeOut, mcShadow.alpha, 0.6, 1, true);
		}
		
		private function thumbInit( evnt:Event ):void {
			var clip = evnt.currentTarget;
			clip.alpha = 0;
			clipAlpha = new Tween( clip, "alpha", Regular.easeIn, 0, 1, 1, true);
		}
	}
	
}