package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
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
			//txtLabel.sharpness = -100;
			//txtLabel.thickness = -100;
			txtLabel.text = sName.toUpperCase();
			txtLabel.z = 0; //para que el campo de texto sea cacheado como bitmap
			
			//txtLabel.text = sName.toLowerCase();
			//txtLabel.text = sName;
			
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
				txtLabel.textColor = 0xA0A0A0;
				TweenMax.to( this, 0.3, { x: initPos.x /*, colorTransform: { tint: 0xA0A0A0 }*/ } );
			}
		}
		
		private function btn_over(e:MouseEvent):void 
		{
			if ( !initPos ) initPos = new Point( x, y );
			txtLabel.textColor = 0xC9C9C9;
			TweenMax.to( this, 0.3, { x: initPos.x+2 /*, colorTransform: { tint: 0xD0D0D0 } */ } );
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