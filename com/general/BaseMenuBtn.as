package com.general {
	
	import flash.events.*
	
	public class BaseMenuBtn
	extends BaseClip {
		
		protected var bActive:Boolean;
		
		/**
		 * @usage: init buttonMode and rollOver rollOut listener
		 * @author: sminutoli
		 */
		override protected function initClip():void {
			super.initClip();
			
			this.buttonMode = true;
			addEventListener( MouseEvent.ROLL_OVER, rollOver);
			addEventListener( MouseEvent.ROLL_OUT, rollOut);
			
		}
		
		/**
		 * @usage: for override purposes
		 * @author: sminutoli
		 */
		public function rollOver(evnt:MouseEvent):void { }
		
		/**
		 * @usage: for override purposes
		 * @author: sminutoli
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