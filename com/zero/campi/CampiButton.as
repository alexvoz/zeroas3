package com.zero.campi 
{
	import com.general.WebSite;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import com.util.HTMLColors;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextFormat;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiButton extends Sprite
	{
		
		public var txtLabel:TextField;
		public var data:Object;
		private var initPos:Point;
		private var _active:Boolean;
		
		public function CampiButton(sName:String, data:Object) 
		{
			
			this.name = sName;
			
			txtLabel = new TextField();
			addChild(txtLabel);
			
			var format:TextFormat = getFormat();
						
			txtLabel.defaultTextFormat = format;
			txtLabel.embedFonts = true;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.wordWrap = false;
			txtLabel.multiline = false;
			txtLabel.antiAliasType = AntiAliasType.ADVANCED;
			txtLabel.text = sName.toLowerCase() + " ";
			txtLabel.sharpness = -400;
									
			this.buttonMode = true;
			this.mouseChildren = false;
			this.data = data;
			
			this.addEventListener(MouseEvent.ROLL_OVER, btn_over );
			this.addEventListener(MouseEvent.ROLL_OUT, btn_out );
			
			this.addEventListener(Event.ADDED_TO_STAGE, init_listeners );
		}
		
		protected function getFormat():TextFormat {
			var format:TextFormat = new TextFormat( new ButtonFont().fontName, 15, 0xb9b9b9 );
			format.kerning = true;
			format.letterSpacing = -0.2;
			return format;
		}
		
		private function init_listeners(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init_listeners);
			CampiSite.getApp().addEventListener( WebSite.SECTION_CHANGED, check_section );
		}
		
		private function check_section(e:Event):void 
		{
			this.active = CampiSite.getApp().getSection() == this.data;
		}
		
		private function btn_out(e:MouseEvent):void 
		{
			if ( !initPos ) initPos = new Point( x, y );
			if ( active ) {
				TweenMax.to( this, 0.3, { x: initPos.x } );
			} else {
				txtLabel.textColor = 0xb9b9b9;
			
				TweenMax.to( this, 0.3, { x: initPos.x /*, colorTransform: { tint: 0xA0A0A0 }*/ } );
			}
			if( CampiSite.getApp().mcFondo ){
				TweenMax.to( CampiSite.getApp().mcFondo, 0.5, { glowFilter: { strength: 0.35, blurX: 10, blurY: 10 } } );
				TweenMax.to( CampiSite.getApp().mcSombra, 0.5, { dropShadowFilter: { strength: 0.8, blurX: 40, blurY: 7 }, scaleX: 1 } );
			}
		}
		
		private function btn_over(e:MouseEvent):void 
		{
			if ( !initPos ) initPos = new Point( x, y );
			txtLabel.textColor = 0xc9c9c9;
			
			if ( CampiSite.getApp().mcFondo ) {
				TweenMax.to( CampiSite.getApp().mcFondo, 0.5, { glowFilter: { strength: 1, blurX: 15, blurY: 15 } } );
				TweenMax.to( CampiSite.getApp().mcSombra, 0.5, { dropShadowFilter: { strength: 1, blurX: 20 }, scaleX: 1.03 } );	
			}			
		}
				
		public function get active():Boolean { return _active; }
		
		public function set active(value:Boolean):void 
		{
			_active = value;
			if ( value ) {
				dispatchEvent( new MouseEvent( MouseEvent.ROLL_OVER ) );
			} 
			dispatchEvent( new MouseEvent( MouseEvent.ROLL_OUT ) );
			
		}
		
	}

}