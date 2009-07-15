package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.events.*;
	import flash.display.*;
	import flash.net.*;
	
	public class ContactoSection
	extends BaseClip {
		
		public var mcForm:ContactoEnvio;
		public var msgERROR:Sprite;
		public var msgOK:Sprite;
		
		override protected function initClip():void {
			super.initClip();
			this.stop();
			if (Site.getApp()) {
				Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed );
			}
		}
		
		private function section_changed(e:Event):void {
			var nFrame:int;
			if ( Site.getApp().getSection() == Site.CONTACTO) {
				nFrame = 2;
			} else {
				nFrame = 1;
			}
			if ( currentFrame == nFrame ) return;
			gotoAndStop(nFrame);
		}
		
		override public function childLoaded( evnt:Event ):void {
			if ( evnt.currentTarget == mcForm ) {
				mcForm.addEventListener( Event.CHANGE, form_changed );
			}
		}
		
		private function form_changed(e:Event):void {
			if ( e.target != mcForm) return;
			var o:Object = mcForm.collectVars();
						
			var request:URLRequest = new URLRequest ("sendMail.php");
			request.method = URLRequestMethod.POST;
									
			var variables:URLVariables = new URLVariables();
			variables.name = o.name;
			variables.mail = o.mail;
			variables.comment = o.comment;
			request.data = variables;
										
			var loader:URLLoader = new URLLoader (request);
			loader.addEventListener(Event.COMPLETE, send_complete);
			loader.load(request);
		}
		
		private function send_complete(e:Event):void {
			Site.log( "send response= " + e.target.data);
			if (e.target.data == "OK") {
				mcForm.erase_fields(undefined);
				registerTween( "msgOKFade", new Tween( msgOK, "alpha", Regular.easeOut, 1, 0, 3, true));
			} else {
				registerTween( "msgERRORFade", new Tween( msgERROR, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
		}
		
	}
	
}