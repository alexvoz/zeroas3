package com.zero.campi.form 
{
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.util.HTMLColors;
	import com.zero.campi.CampiColors;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.geom.Point;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiField extends Sprite 
	{
		private var txtLabel:TextField;
		private var background:Shape;
		private var border:Shape;
		protected var txtInput:TextField;
		private var _validate:Boolean;
			
		public function CampiField(label:String, size:Point=undefined ) 
		{
			if ( !size ) {
				size = new Point(200, 25);
			}
			
			_validate = false;
			
			background = new Shape();
			background.graphics.beginFill( HTMLColors.white, 1 );
			background.graphics.drawRect(0, 0, size.x, size.y);
			addChild(background);
			
			border = new Shape();
			border.graphics.lineStyle( 1, HTMLColors.dimgrey );
			border.graphics.beginFill( HTMLColors.white, 0 );
			border.graphics.drawRect(0, 0, size.x, size.y);
			addChild(border);
			
			txtLabel = new TextField();
			txtLabel.width = txtLabel.height = 0;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.selectable = false;
			txtLabel.mouseEnabled = false;
			txtLabel.embedFonts = true;
			addChild( txtLabel );
			
			txtInput = new TextField();
			txtInput.width = size.x;
			txtInput.height = size.y;
			txtInput.type = TextFieldType.INPUT;
			txtInput.embedFonts = true;
			addChild( txtInput );
			
			var format:TextFormat = new TextFormat();
			var font:Font = new FieldLabel();
			format.font = font.fontName;
			format.size = 12;
			
			txtLabel.defaultTextFormat = format;
			txtInput.defaultTextFormat = format;
			
			//clavo el label
			txtLabel.text = label.toUpperCase();
			
			//acomodo
			txtInput.x = 5;
			txtInput.y = txtLabel.getBounds(this).bottom + 3;
			background.y = border.y = txtLabel.getBounds(this).bottom + 0;
			
			//eventos
			txtInput.addEventListener(FocusEvent.FOCUS_IN, edit_mode );
			txtInput.addEventListener(FocusEvent.FOCUS_OUT, validator );
			
			TweenPlugin.activate([ColorTransformPlugin]);
		}
		
		protected function validator(e:FocusEvent):void 
		{
			validate = true;
			this.dispatchEvent( e );
		}
		
		private function edit_mode(e:FocusEvent):void 
		{
			TweenLite.to( background, 0.5, { colorTransform: { tint: CampiColors.BACK_FIELD } } );
			TweenLite.to( border, 0.5, { colorTransform:{ tint: CampiColors.CYAN } } );
		}
		
		public function get value():String { 
			return txtInput.text; 
		}
		
		public function set value(value:String):void 
		{
			txtInput.text = value;
		}
		
		public function get validate():Boolean { return _validate; }
		
		public function set validate(value:Boolean):void 
		{
			_validate = value;
			TweenLite.to( background, 0.5, { colorTransform: { tint: HTMLColors.white } } );
			if( !value ) TweenLite.to( border, 0.5, { colorTransform: { tint: HTMLColors.red } } );
		}
		
	}

}