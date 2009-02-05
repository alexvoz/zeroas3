package com.general {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class BaseClip
	extends MovieClip {
		
		public static var CLIP_LOADED:String = "baseclip_loaded";
		public static var CLIP_SHOWED:String = "baseclip_showed";
		public static var CLIP_HIDDEN:String = "baseclip_hidden";
		
		protected var data:Object;
		protected var bShowed:Boolean;
		
		public function BaseClip() {
			super();
			initClip();
			var p:BaseClip = parent as BaseClip;
			if ( p ) {
				addEventListener( CLIP_LOADED, p.childLoaded );
				function dispatch(evnt) {
					removeEventListener( Event.ENTER_FRAME, dispatch );
					dispatchEvent( new Event( CLIP_LOADED ) );
				}
				addEventListener( Event.ENTER_FRAME, dispatch);
			}
		}
		
		/**
		 * @usage: for override purposes
		 */
		protected function initClip():void {
			
		}
		public function getData():Object {
			return this.data;
		}
		
		public function setData(data:Object):void {
			this.data = data;
			refreshData();
		}
		/**
		 * @author: sminutoli
		 * @usage:  Su uso es para la herencia
		 */
		protected function refreshData():void {
			return;
		}
		
		/**
		 * @author: sminutoli
		 * @usage:  Su uso es para la herencia
		 */
		public function childLoaded( evnt:Event ):void {
			
		}
		
		/**
		 * @author: sminutoli
		 * @usage:  Su uso es para la herencia
		 */
		public function show():void {
			this.showEnd();
		}
		protected function showEnd(evnt=undefined):void {
			bShowed = true;
			this.dispatchEvent( new Event( CLIP_SHOWED ) );
		}
		
		/**
		 * @author: sminutoli
		 * @usage:  Su uso es para la herencia
		 */
		public function hide():void {
			this.hideEnd();
		}
		protected function hideEnd(evnt=undefined):void {
			bShowed = false;
			this.dispatchEvent( new Event( CLIP_HIDDEN ) );
		}
		
		public function getShowed():Boolean {
			return bShowed;
		}
		
		
	}
	
}