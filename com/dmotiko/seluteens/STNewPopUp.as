package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFormat;
		
	public class STNewPopUp
	extends BaseClip {
		
		public var txtDate:TextField;
		public var txtTitle:TextField;
		public var txtContent:TextField;
		public var txtLink:TextField;
		public var mcClose:MovieClip;
		
		override protected function refreshData():void {
			show();
		}
		
		override public function show():void {
			this.gotoAndPlay("show");
			registerTween("fade", new Tween( this, "alpha", Regular.easeOut, 0.5, 1, 6) );
		}
		override public function hide():void {
			this.gotoAndPlay("hide");
			registerTween("fade", new Tween( this, "alpha", Regular.easeOut, 1, 0.5, 6) );
		}
		
		override protected function showEnd(evnt=undefined):void {
			super.showEnd( evnt );
			
			txtDate.text = data.date;
			txtTitle.text = data.title;
			var sContent:String = ((data.data as XML).children()[0] as XML).toString();
			sContent = sContent.replace("<content>", "");
			sContent = sContent.replace("</content>", "");
			sContent = sContent.replace("  ", " ");
			sContent = sContent.replace(String.fromCharCode(10), "");
			//sContent = sContent.substr(1);
			txtContent.htmlText = sContent;
			
			var tf:TextFormat = new TextFormat();
			tf.size = 21;
			tf.bold = true;
			tf.indent = 25;
			txtContent.setTextFormat(tf, 0, 1);
			mcClose.buttonMode = true;
			mcClose.addEventListener( MouseEvent.CLICK, close_window);
			
			if ( data.link ) {
				txtLink.visible = true;
				txtLink.htmlText = "<a href='"+data.href+"'>"+data.link+"</a>";
			} else {
				txtLink.visible = false;
			}
			
		}
		
		private function close_window(e:MouseEvent):void {
			hide();
		}
		
	}
	
}