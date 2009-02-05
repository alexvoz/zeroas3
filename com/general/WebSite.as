package com.general {
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.TextField;
	
	public class WebSite
	extends MovieClip {
		
		public static var SECTION_CHANGED:String = "website_sectionChanged";
		public static var LANGUAGE_CHANGED:String = "website_languageChanged";
		
		protected static var app:WebSite;
		
		protected var sLanguage:String;
		protected var sSection:String;
		
		protected var txtConsole:WebSiteConsole;
		protected var mcCenterClip:DisplayObject;
		
		public static function getApp():WebSite {
			return app;
		}
		
		public function WebSite() {
			app = this;
			if ( this.loaderInfo.parameters["CONSOLE"]) {
				
				this.txtConsole = new WebSiteConsole();
				this.txtConsole.x = 0;
				this.txtConsole.y = 0;
				this.txtConsole.width = stage.width;
				this.txtConsole.height = 30;
				this.txtConsole.nLine = 1;
				this.txtConsole.multiline = true;
				this.txtConsole.background = true;
				this.txtConsole.backgroundColor = 0xFFFFFF;
				this.txtConsole.borderColor = 0;
				this.addChild(this.txtConsole);
				this.log("WebSite | Console Initialized");
				
			} else {
				this.log("WebSite | Console disabled");
			}
			this.initSite();
		}
		
		/**
		 *  @author: sminutoli
		 *  @usage: for override purposes
		 */
		protected function initSite():void {
			loadExternalContent();
		}
		/**
		 *  @author: sminutoli
		 *  @usage: for override purposes
		 */
		protected function loadExternalContent():void {
			externalContentLoaded();
		}
		/**
		 *  @author: sminutoli
		 *  @usage: for override purposes
		 */
		protected function externalContentLoaded():void {
			
		}
		
		/**
		 *  @author: sminutoli
		 *  @usage: init the stage for fullflash layout
		 *
		 * */
		protected function isFullFlash():void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener( Event.RESIZE, resizeBrowser);
			stage.dispatchEvent( new Event( Event.RESIZE ) );
		}
		/**
		 * @author: sminutoli
		 * @usage: function that defines the stage layout
		 * 
		 * */
		protected function resizeBrowser( evnt:Event ):void {
			if ( stage.stageWidth <= 1024 ) return;
			
			if ( getCenterClip() ) {
				x = (stage.stageWidth - getCenterClip().width) / 2; 
				y = (stage.stageHeight - getCenterClip().height) / 2;
				
			} else {
				x = (stage.stageWidth - width) / 2;
				y = (stage.stageHeight - height) / 2;
			}
		}
		
		
		public function getSection():String {
			return this.sSection;
		}
		public function setSection(sSection:String):void {
			this.sSection = sSection;
			log( "WebSite | setSection= "+sSection, true);
			dispatchEvent( new Event( WebSite.SECTION_CHANGED ) );
			if ( this.loaderInfo.parameters["analytics"] ) {
				var url:String = this.loaderInfo.parameters["analytics"]+"('"+sSection+"')";
				var request:URLRequest = new URLRequest(url);
				try {
					navigateToURL(request, '_self'); // second argument is target
				} catch (e:Error) {
					log( "WebSite | analytic error");
				}

			}
		}
		
		public function getLanguage():String {
			return this.sLanguage;
		}
		public function setLanguage(sLanguage:String):void {
			this.sLanguage = sLanguage;
			dispatchEvent( new Event( WebSite.LANGUAGE_CHANGED ) );
		}
		
		/**
		 * @author: sminutoli
		 * @return: for internal usage, returns a guide Display Object for align purposes
		 */
		protected function getCenterClip():DisplayObject {
			return this.mcCenterClip;
		}
		/**
		 * @author: sminutoli
		 * @param:	clip, a guide Display Object for align purposes
		 */
		protected function setCenterClip( clip:DisplayObject ):void {
			this.mcCenterClip = clip;
		}
		
		/**
		 * @author: sminutoli
		 * @usage: only if the browser injects de NO_CACHE parameter in the SWF
		 * @return: a ever changing number for no cache purposes
		 */
		public function getNoCache():String {
			if ( this.loaderInfo.parameters["NO_CACHE"]) {
				log( "WebSite getNoCache called", true);
				return "?NO_CACHE="+new Date().getTime();
			} else {
				return "";
			}
		}
		
		public function log(msg:String, toConsole:Boolean=false ):void {
			
			if ( this.loaderInfo.parameters["CONSOLE"]) {
				this.removeChild( txtConsole );
				this.addChild( txtConsole );
				txtConsole.text += txtConsole.nLine + " | " + msg;
				txtConsole.text += "\n";
				txtConsole.scrollV = txtConsole.maxScrollV;
				txtConsole.nLine ++;
			} else if( !toConsole) {
				trace(msg);
			}
		}
		
	}
	
}