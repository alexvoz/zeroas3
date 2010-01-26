package com.zero.snap {
	
	import com.general.BaseClip;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.text.*;
	import flash.utils.*;
	
	public class SnapTooltip
	extends BaseClip {
		
		private var rect:Sprite;
		private var triangle:Shape;
		private var tField:TextField;
		private var tFormat:TextFormat;
		private var tweenRect:Tween;
		private var tweenChars:Tween;
		private var timerChars:Timer;
		private var oHelper:Object;
		private var color:uint;
		private var sText:String;
				
		function SnapTooltip() {
			
			tField = new TextField();
			tField.autoSize = TextFieldAutoSize.LEFT;
			tField.embedFonts = true;
			tField.visible = false;
			tField.x = tField.y = 5;
			tField.selectable = false;
			tField.mouseEnabled = false;
			tFormat = new TextFormat( "Myriad Web", 12, 0xFFFFFF, true );
			tField.antiAliasType = AntiAliasType.ADVANCED;
			tField.defaultTextFormat = tFormat;
			
			color = 0x0099CC;
			
			rect = new Sprite();
			rect.graphics.beginFill(color);
			rect.graphics.drawRoundRect(0, 0, 30, 30, 5);
			rect.graphics.endFill();
			addChild(rect);

			triangle = new Shape();
			triangle.graphics.beginFill(color);
			triangle.graphics.lineTo(0, 0);
			triangle.graphics.lineTo(7, 0);
			triangle.graphics.lineTo(7, 10);
			triangle.graphics.endFill();
			addChild(triangle);
			
			adjustTriangle();
			
			oHelper = new Object();
			oHelper.width = 30;
			oHelper.height = 30;
			
			addChild(tField); // agrego al flaquito a lo ultimo para que esté arriba de todo
		}
		
		public function setText(sText:String, newPos:Point=undefined, newAlpha=undefined, tweens:Boolean = true):void {
			this.sText = sText.toUpperCase();
			tField.text = this.sText;
			tField.visible = false;
			oHelper.chars = this.sText.length;
					
			var t:Tween = new Tween( oHelper, "height", Elastic.easeInOut, oHelper.height, tField.height + 10, 1, true );
			registerTween( "height", t);
			tweenRect = new Tween( oHelper, "width", Elastic.easeInOut, oHelper.width, tField.width + 10, 1, true );
			tweenRect.addEventListener( TweenEvent.MOTION_CHANGE, redraw_clip );
				
			if( newPos ){
				if( tweens ){
					registerTween( "posX", new Tween( this, "x", Strong.easeInOut, this.x, newPos.x - (tField.width + 10), 1, true));
					registerTween( "posY", new Tween( this, "y", Strong.easeInOut, this.y, newPos.y - (tField.height + 10 + triangle.height), 1, true));
					
				} else {
					this.x = newPos.x - (tField.width + 10);
					this.y = newPos.y - (tField.height + 10 + triangle.height);
				}
			}
			if( newAlpha != undefined ) {
				registerTween("alpha", new Tween( this, "alpha", Regular.easeOut, this.alpha, newAlpha, 0.5, true));
			}
				
			timerChars = new Timer(500, 1);
			timerChars.addEventListener( TimerEvent.TIMER_COMPLETE, tween_text );
			timerChars.start();
		}
		
		private function tween_text(e:TimerEvent):void {
			tField.text = "";
			tField.visible = true;
			tweenChars = new Tween( oHelper, "chars", Regular.easeOut, 0, oHelper.chars, 0.5, true );
			tweenChars.addEventListener( TweenEvent.MOTION_CHANGE, redraw_text );
			tweenChars.addEventListener( TweenEvent.MOTION_FINISH, end_text );
		}

		private function redraw_text(e:TweenEvent):void {
			tField.text = sText.substr(0, Math.ceil(oHelper.chars) ) ;
		}
		private function end_text(e:TweenEvent):void {
			tField.text = sText;
		}
		private function redraw_clip(e:TweenEvent):void {
			
			rect.graphics.clear();
			rect.graphics.beginFill(color);
			rect.graphics.drawRoundRect(0, 0, oHelper.width, oHelper.height, 10);
			rect.graphics.endFill();
			adjustTriangle();
		}
		
		private function adjustTriangle():void {
			triangle.x = rect.getBounds(rect.parent).right - 20;
			triangle.y = rect.getBounds(rect.parent).bottom;			
		}
		
	}
}