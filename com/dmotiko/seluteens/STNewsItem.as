package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class STNewsItem
	extends BaseClip {
		
		public var txtDate:TextField;
		public var txtTitle:TextField;
		public var mcResalte:MovieClip;
		public var mcBack:MovieClip;
		public var mcInfo:MovieClip;
		public var mcPhoto:STNewsPhoto;
			
		override protected function initClip():void {
			txtDate.mouseEnabled = false;
			txtTitle.mouseEnabled = false;
			mcInfo.buttonMode = true;
			mcInfo.addEventListener( MouseEvent.ROLL_OVER, item_over);
			mcInfo.addEventListener( MouseEvent.ROLL_OUT, item_over);
			mcInfo.addEventListener( MouseEvent.CLICK, item_press);
		}
		
		private function item_over(e:MouseEvent):void {
			var nRotation:int = 4;
			if (e.type == MouseEvent.ROLL_OUT) nRotation = 0;
			registerTween( "infoRotation", new Tween( mcInfo, "rotation", Regular.easeOut, mcInfo.rotation, nRotation, 0.3, true));
		}
		
		private function item_press(e:MouseEvent):void {
			dispatchEvent( new Event( Event.CHANGE) );
		}
		
		override protected function refreshData():void {
			txtDate.text = data.date;
			txtTitle.text = data.title;
			mcResalte.width = txtDate.width;
			mcPhoto.setData( data.thumb );
		}
		
	}
	
}