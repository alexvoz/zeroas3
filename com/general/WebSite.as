package com.general {
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.TextField;
	
	public class WebSite
	extends MovieClip {
		
		public static var SECTION_CHANGED:String = "website_sectionChanged";
		public static var LANGUAGE_CHANGED:String = "website_languageChanged";
		public static var SOUND_CHANGED:String = "website_soundChanged";
		
		protected static var app:WebSite;
		
		protected var sLanguage:String;
		protected var sSection:String;
		protected var bSound:Boolean;
		
		protected var txtConsole:WebSiteConsole;
		protected var mcCenterClip:DisplayObject;
		protected var testingParams:Object;
		protected var tweens:Array;
		
		public static function log( msg:*, toConsole:Boolean = false ):void {
			if ( getApp() ) getApp().internalLog( msg, toConsole );
			else if (!toConsole) trace( msg );
		}
		
		public static function getApp():WebSite {
			return app;
		}
		
		public function WebSite() {
			app = this;
			
			testingParams = new Object();
			
			if ( this.loaderInfo.parameters["CONSOLE"] ) {
				
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
				internalLog("WebSite | Console Initialized");
				
			} else {
				internalLog("WebSite | Console disabled");
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
		protected function externalContentLoaded( evnt:Event = undefined):void {
			
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
			log( "WebSite | setSection= " + sSection, true);
			dispatchEvent( new Event( WebSite.SECTION_CHANGED ) );
			track( sSection );
		}
		
		/**
		 * 
		 * @param	sTrack
		 * @usage   sends a message to a webSite trakker ( GoogleAnalytics by default );
		 */
		public function track( sTrack:String ):void {
			if ( this.loaderInfo.parameters["analytics"] ) {
				var url:String = this.loaderInfo.parameters["analytics"]+"('"+sTrack+"')";
				var request:URLRequest = new URLRequest(url);
				try {
					//navigateToURL(request, '_self'); // second argument is target
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
		
		public function getSound():Boolean { return bSound; }
		
		public function setSound(value:Boolean):void {
			bSound = value;
			dispatchEvent( new Event( WebSite.SOUND_CHANGED ) );
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
		/**
		 * @author: sminutoli
		 * @usage: usefull for temp URLs
		 * @return: a new URL = external header if exists + URL + noCache random if is enabled
		 */
		public function getResource(src:String):String {
			if ( this.loaderInfo.parameters["URL_HEADER"]) {
				src = this.loaderInfo.parameters["URL_HEADER"] + src;
			}
			return src += getNoCache();
		}
		
		public function getSWF_VAR(key:String):* {
			if( this.loaderInfo.parameters[key] ){
				return this.loaderInfo.parameters[key];
			} else {
				return this.testingParams[key];
			}
		}
		
		protected function internalLog(msg:*, toConsole:Boolean=false ):void {
			
			if ( this.loaderInfo.parameters["CONSOLE"]) {
				this.removeChild( txtConsole );
				this.addChild( txtConsole );
				txtConsole.text += txtConsole.nLine + " | " + msg;
				txtConsole.text += "\n";
				txtConsole.scrollV = txtConsole.maxScrollV;
				txtConsole.nLine ++;
			} else if ( this.loaderInfo.parameters["FIREBUG"] ) {
				navigateToURL( new URLRequest("javascript:console.log('" + msg + "');"), "_self" );
				
			} else if( !toConsole) {
				trace(msg);
			}
		}
		
		protected function registerTween( key:String, tween:Tween, keepAlive:Boolean=false, listenEnd:Boolean=false, listenChange:Boolean=false ):void {
			if ( !tweens ) tweens = new Array();
			killTween(key);
			tweens.push( { key: key, tween: tween } );
			//trace(this+" | registerTween | "+tweens.length);
			var oListener:Object = new Object();
			var root = this;
			if( listenChange ){
				oListener.onMotionChanged = function(ev) {
					root.tweenChanged( key, tween );
				}
				tween.addEventListener( TweenEvent.MOTION_CHANGE, oListener.onMotionChanged );
			}
			oListener.onMotionFinished = function(ev) {
				// busco el tween y lo saco del array, queda libre para que el garbage collector lo liquide
				for (var i:Number = 0; i < root.tweens.length ; i++) {
					if ( root.tweens[i].tween == tween ) {
						if( listenEnd ) root.tweenFinished( key, tween );
						if ( !keepAlive ) root.tweens.splice( i, 1 );
					}
				}
			}
			tween.addEventListener( TweenEvent.MOTION_FINISH, oListener.onMotionFinished );
			
		}
		
		/**
		 * @author: sminutoli
		 * @usage: for override purposes
		 * @param	key
		 * @param	tween
		 */
		protected function tweenChanged(key:String, tween:Tween):void {
			
		}
		/**
		 * @author: sminutoli
		 * @usage: for override purposes
		 * @param	key
		 * @param	tween
		 */
		protected function tweenFinished(key:String, tween:Tween):void {
			
		}
		
		/**
		 * 
		 * @param	arg | you can pass a Tween or a String/key
		 */
		protected function killTween(arg:*):void {
			var tween:Tween;
			if (arg is Tween) tween = arg;
			else tween = getTween(arg as String);
			if ( !tween ) return;
			// busco el tween y lo saco del array, queda libre para que el garbage collector lo liquide
			for (var i:Number = 0; i < tweens.length ; i++) {
				if ( tweens[i].tween == tween ) {
					tween.stop();
					tweens.splice( i, 1 );
				}
			}
		}
		protected function getTween(key:String):Tween {
			if ( !tweens ) return undefined;
			// busco el tween y lo saco del array, queda libre para que el garbage collector lo liquide
			for (var i:Number = 0; i < tweens.length ; i++) {
				if ( tweens[i].key == key ) return tweens[i].tween;
			}
			return undefined;
		}
		
	}
	
}