package com.zero.dske {
	
	import com.general.*
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.events.*
	import flash.display.*
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class DSAutomatizacion
	extends BaseClip {
		
		public var txtParagraph:TextField;
		public var mcAnimation:MovieClip;
		
		private var sText:String;
		private var oText:Object;
		
		override protected function initClip():void {
			
			sText = txtParagraph.text;
			oText = new Object();
			oText.length = sText.length;
			txtParagraph.text = "";
			
			this.alpha = 0;
			registerTween( "textAppear", new Tween(oText, "length", Regular.easeOut, 0, oText.length, 2, true), false, false, true);
			registerTween( "fadeIn", new Tween( this, "alpha", Regular.easeOut, 0, 1, 1, true ));
			
		}
		
		override protected function tweenChanged( key:String, tween:Tween):void {
			txtParagraph.text = sText.substr(0, oText.length);
		}
		
	}
	
}