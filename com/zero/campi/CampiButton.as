package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
	import com.util.HTMLColors;
	import flash.text.AntiAliasType;
	
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
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.wordWrap = false;
			txtLabel.multiline = false;
			txtLabel.antiAliasType = AntiAliasType.ADVANCED;
			txtLabel.text = sName.toUpperCase()+" ";
			//txtLabel.z = 0; //para que el campo de texto sea cacheado como bitmap
						
			this.buttonMode = true;
			this.mouseChildren = false;
			this.data = data;
			
			this.addEventListener(MouseEvent.ROLL_OVER, btn_over );
			this.addEventListener(MouseEvent.ROLL_OUT, btn_out );
		}
		
		private function btn_out(e:MouseEvent):void 
		{
			if ( active ) {
				TweenMax.to( this, 0.3, { x: initPos.x } );
			} else {
				//txtLabel.textColor = 0xA0A0A0;
				TweenMax.to( this, 0.5, {glowFilter:{color:0xffffff, alpha:0, blurX:10, blurY:10, strength:0, quality:3}, ease:Quad.easeOut});
				TweenMax.to( this, 0.3, { x: initPos.x /*, colorTransform: { tint: 0xA0A0A0 }*/ } );
			}
			TweenMax.to( CampiSite.getApp().mcFondo, 0.5, { glowFilter: { strength: 0.35, blurX: 10, blurY: 10 } } );
			TweenMax.to( CampiSite.getApp().mcSombra, 0.5, { dropShadowFilter: { strength: 0.8, blurX: 40, blurY: 7 }, scaleX: 1 } );
		}
		
		private function btn_over(e:MouseEvent):void 
		{
			if ( !initPos ) initPos = new Point( x, y );
			//txtLabel.textColor = 0xC9C9C9;
			//TweenMax.to( this, 0.3, { x: initPos.x + 2 /*, colorTransform: { tint: 0xD0D0D0 } */ } );
			TweenMax.to( this, 0.5, {glowFilter:{color:0xffffff, alpha:1, blurX:10, blurY:10, strength:0.7, quality:3}, ease:Quad.easeOut});
			TweenMax.to( CampiSite.getApp().mcFondo, 0.5, { glowFilter: { strength: 1, blurX: 15, blurY: 15 } } );
			TweenMax.to( CampiSite.getApp().mcSombra, 0.5, { dropShadowFilter: { strength: 1, blurX: 20 }, scaleX: 1.03 } );
			
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