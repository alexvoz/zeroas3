package com.dmotiko.elemento {
	import com.general.*;
	import flash.display.*;
	import flash.events.*;
		
	public class CarritoTemplate
	extends BaseClip {
		protected var aGroups:Array;
		
		override protected function initClip():void {
			aGroups = new Array();
			
		}
		
		protected function group_change(e:Event):void {
			dispatchEvent( new Event( Event.CHANGE ) );			
		}
		
		public function collectItems():Array {
			var a:Array = new Array();
			for each( var cig:CarritoItemGroup in aGroups) {
				a = a.concat( cig.collectItems() );
			}
			return a;
		}
		
	}
	
}