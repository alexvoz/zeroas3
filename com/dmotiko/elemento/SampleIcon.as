package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Elastic;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class SampleIcon
	extends BaseMenuBtn {
		private var oScale:Object;
		public var mcStroke:MovieClip;
		
		override protected function initClip():void {
			super.initClip();
			oScale = new Object();
			oScale.scale = 0.2;
			this.scaleX = this.scaleY = oScale.scale;
			mcStroke.visible = false;
			registerTween("scale", new Tween( oScale, "scale", Elastic.easeOut, 0.2, 0.5, 1, true), false, false, true);
		}
		
		override public function rollOver(e:MouseEvent):void {
			this.parent.setChildIndex( this, parent.numChildren - 1);
			mcStroke.visible = true;
			registerTween("scale", new Tween(oScale, "scale", Elastic.easeOut, oScale.scale, 0.8, 1, true), false, false, true);
		}
		override public function rollOut(e:MouseEvent):void {
			mcStroke.visible = false;
			registerTween("scale", new Tween(oScale, "scale", Elastic.easeOut, oScale.scale, 0.5, 1, true), false, false, true);
		}
		
		override protected function tweenChanged( k:String, t:Tween):void {
			this.scaleX = this.scaleY = oScale.scale;
		}
		
		
	}
	
}