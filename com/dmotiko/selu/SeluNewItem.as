package com.dmotiko.selu {
	
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
			
	public class SeluNewItem
	extends BaseClip {
		
		public var txtDate:TextField;
		public var txtTitle:TextField;
		public var txtContent:TextField;
		public var txtLink:TextField;
		public var mcStroke:Sprite;
		
		protected var imgContainer:Sprite;
		protected var imgLoader:Loader;
		
		override protected function initClip():void {
			super.initClip();
			imgContainer = new Sprite();
			imgContainer.x = 8;
			imgContainer.y = 11;
			imgContainer.rotation = 1;
			addChild(imgContainer);
			
			imgLoader = new Loader();
			imgLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, img_loaded);
			imgContainer.addChild( imgLoader );
			
			txtDate.mouseEnabled = txtTitle.mouseEnabled = txtContent.mouseEnabled = false;
			txtContent.autoSize = TextFieldAutoSize.LEFT;
			//txtLink.addEventListener( MouseEvent.CLICK, link_press );
		}
		
		private function img_loaded(e:Event):void 
		{
			registerTween( "imgFade", new Tween( imgContainer, "alpha", Regular.easeOut, 0, 1, 0.5, true) );
		}
		
		private function link_press(e:MouseEvent):void 
		{
			SeluSite.log( "SeluNewItem | link_press = " + data.href);
			navigateToURL( new URLRequest( data.href ), "_blank" );
		}
		
		override protected function refreshData():void {
			txtDate.text = data.date;
			var tf:TextFormat = new TextFormat();
			tf.bold = true;
			txtTitle.text = data.title;
			txtTitle.setTextFormat( tf );
			
			var sContent:String = ((data.data as XML).children()[0] as XML).toString();
			sContent = sContent.replace("<content>", "");
			sContent = sContent.replace("</content>", "");
			sContent = sContent.replace("  ", " ");
			sContent = sContent.replace(String.fromCharCode(10), "");
			txtContent.htmlText = sContent;
			
			if( data.link ){
				txtLink.htmlText = "<a href='"+data.href+"' >"+data.link+"</a>";
				txtLink.y = txtContent.getBounds(this).bottom;
				mcStroke.y = txtLink.getBounds(this).bottom + 5;
			} else {
				removeChild(txtLink);
				mcStroke.y = txtContent.getBounds(this).bottom + 5;
			}
			
			imgLoader.load( new URLRequest( SeluSite.getApp().getResource(data.thumb) ) );
			
		}
		
	}
	
}