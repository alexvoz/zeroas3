package com.general {
	
	import flash.events.*
	
	public class BaseMenuBtn
	extends BaseClip {
		
		protected var bActive:Boolean;
		
		public function BaseMenuBtn() {
			super();
		}
		
		/**
		 * @usage: for override purposes
		 */
		public function rollOver(evnt:MouseEvent):void { }
		
		/**
		 * @usage: for override purposes
		 */
		public function rollOut(evnt:MouseEvent):void { }
		
		public function setActive(active:Boolean):void {
			this.bActive = active;
			if (!active) rollOut(undefined);
		}
		public function getActive():Boolean {
			return this.bActive;
		}
		
	}
	
}