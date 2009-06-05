package com.dmotiko.seluteens.dummy {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class ComboPV
	extends BaseClip {
		
		public var txtLabel:TextField;
		public var mcList:ComboListPV;
		public var mcPullDown:MovieClip;
				
		override protected function initClip():void {
			txtLabel.mouseEnabled = false;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			
			mcPullDown.buttonMode = true;
			mcPullDown.addEventListener( MouseEvent.CLICK, pulldown_list);
		}
		
		override public function childLoaded( e:Event ) :void {
			switch(e.currentTarget) {
				case mcList:
				mcList.addEventListener( Event.CHANGE, list_changed );
				break;
				
			}
		}
		
		private function list_changed(e:Event):void {
			this.setData( mcList.getData() );
		}
		
		private function pulldown_list(e:MouseEvent):void {
			mcList.show();
		}
				
		override protected function refreshData():void {
			txtLabel.text = data.label;
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
	}
	
}