package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class ProductTemplateBtn
	extends SimpleButton {
		
		public function ProductTemplateBtn() {
			super();
			initClip();
			var p:BaseClip = parent as BaseClip;
			if ( p ) {
				addEventListener( BaseClip.CLIP_LOADED, p.childLoaded );
			}
			function dispatch(evnt) {
				removeEventListener( Event.ENTER_FRAME, dispatch );
				dispatchEvent( new Event( BaseClip.CLIP_LOADED ) );
			}
			addEventListener( Event.ENTER_FRAME, dispatch);
		}
		
		protected function initClip():void {
			
		}
		
		
	}
	
}