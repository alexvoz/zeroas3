package com.zero.snap 
{
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TopNavigation extends Sprite
	{
		
		protected var txtLabel:TextField;
		private var bLeft:Boolean;
		private var msg:String;
		private var tMove:Tween;
		private var back:Shape;
		private var stroke:Shape;
		private var flecha:Sprite;
		
		public function TopNavigation(bLeft:Boolean=false) 
		{
			this.bLeft = bLeft;
			this.buttonMode = true;
			initBackground();
			initField();
			
		}
		
		private function initBackground():void
		{
			back = new Shape();
			back.graphics.beginFill(0xFFFFFF, 0);
			back.graphics.drawRect(0, 0, 150, 40);
			back.graphics.endFill();
			this.addChild(back);
			
			flecha = new FlechaTopNavigation();
			if ( this.bLeft ) {
				flecha.scaleX = -1;
				flecha.x = 150;
			}
			addChild(flecha);
			
			stroke = new Shape();
			stroke.graphics.lineStyle(1, 0x0099CC, 1);
			stroke.graphics.lineTo(0, 0);
			stroke.graphics.lineTo(0, 40);
			this.addChild(stroke);
			if ( this.bLeft ) stroke.x = 150;
		}
		
		protected function initField():void
		{
			txtLabel = new TextField();
			txtLabel.width = 150;
			var format:TextFormat = new TextFormat( "Arial", 11, 0x0099CC, true );
			format.letterSpacing = 0.5;
			txtLabel.defaultTextFormat = format;
			txtLabel.mouseEnabled = false;
			txtLabel.selectable = false;
			
			if ( this.bLeft ) {
				txtLabel.autoSize = TextFieldAutoSize.RIGHT;
				txtLabel.x -= 10;
			} else {
				txtLabel.autoSize = TextFieldAutoSize.LEFT;
				txtLabel.x += 10;
			}
			
			this.addChild(txtLabel);
		}
		
		public function setMessage(msg:String):void {
			if ( this.msg == msg ) return;
			this.msg = msg;
			if ( tMove ) tMove.stop();
			tMove = new Tween( this, "y", Regular.easeInOut, this.y - this.height, 0, 0.5, true);
			this.txtLabel.text = msg.toUpperCase();
			this.txtLabel.y = 20 - this.txtLabel.height /2;
		}
		
	}
	
}