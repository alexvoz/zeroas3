﻿package com.dmotiko.opositor {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import flash.text.*;
	import com.general.*
	import flash.xml.XMLNode;
		
	public class OPPuntosVentaInfoItem
	extends BaseClip {
		public var txtContent:TextField;
				
		override protected function initClip():void {
			super.initClip();
			txtContent.autoSize = TextFieldAutoSize.LEFT;
			txtContent.text = "";
		}
		
		override protected function refreshData():void {
			for each( var item in data) {
				txtContent.appendText( item + "\n" );
			}
		}
		
	}
	
}