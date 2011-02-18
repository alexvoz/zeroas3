package com.zero.campi.form 
{
	import com.greensock.data.DropShadowFilterVars;
	import com.greensock.easing.Strong;
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.DropShadowFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.util.HTMLColors;
	import com.zero.campi.CampiColors;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.filters.DropShadowFilter;
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
		protected var txtInput:TextField;
		private var _validate:Boolean;
		private var iconError:DisplayObject;
		private var iconOK:DisplayObject;
		private var iconEasing:Function;
			
		public function CampiField(id:String, label:String, size:Point=undefined ) 
		{
			if ( !size ) {
				size = new Point(210, 25);
			}
						
			_validate = false;
			
			this.name = id;
			
			background = new Shape();
			background.graphics.beginFill( HTMLColors.white, 1 );
			background.graphics.drawRoundRect(0, 0, size.x, size.y, 5, 5);
			addChild(background);
					
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
			background.y = txtLabel.getBounds(this).bottom + 0;
			
			//eventos
			txtInput.addEventListener(FocusEvent.FOCUS_IN, edit_mode );
			txtInput.addEventListener(FocusEvent.FOCUS_OUT, validator );
			
			TweenPlugin.activate([ColorTransformPlugin]);
			TweenPlugin.activate([DropShadowFilterPlugin]);
			
			var sombra:DropShadowFilter = new DropShadowFilter(4, 45, 0, 0.5, 10, 10, 0.7, 2 );
			background.filters = [ sombra ];
			
			//iconError = new Bitmap( new FieldError(0,0) );
			//iconOK = new Bitmap( new FieldOk(0, 0) );
			//iconError.smoothing = iconOK.smoothing = true;
			iconError = new FieldError();
			iconOK = new FieldOK();
			
			iconError.alpha = iconOK.alpha = 0;
						
			iconError.scaleX = 
			iconOK.scaleX = 
			iconError.scaleY = 
			iconOK.scaleY = 0.5;
			
			iconError.x = iconOK.x = background.getBounds(this).right + 8;
			iconError.y = iconOK.y = 27;
			addChild(iconError);
			addChild(iconOK);
			
			iconEasing = Strong.easeInOut;
				
		}
		
		protected function validator(e:FocusEvent):void 
		{
			validate = true;
			this.dispatchEvent( e );
		}
		
		private function edit_mode(e:FocusEvent):void 
		{
			TweenLite.to( background, 0.5, { dropShadowFilter: new DropShadowFilterVars(3, 5, 5, 0.6, 45, 0, 1) } );
			//TweenLite.to( iconOK, 0.5, { alpha: 0, x: background.getBounds(this).right, scaleX: 0.5, scaleY: 0.5, ease: iconEasing } );
			//TweenLite.to( iconError, 0.5, { alpha: 0, x: background.getBounds(this).right, scaleX: 0.5, scaleY: 0.5, ease: iconEasing } );
		}
		
		public function reset() {
			value = "";
			iconError.alpha = iconOK.alpha = 0;
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
			TweenLite.to( background, 0.5, { dropShadowFilter: new DropShadowFilterVars(4, 10, 10, 0.5, 45, 0, 0.7) } );
			if ( value ) {
				TweenLite.to( iconError, 0.5, { alpha: 0, x: background.getBounds(this).right, scaleX: 0.5, scaleY: 0.5, ease: iconEasing } );
				TweenLite.to( iconOK, 0.5, { alpha: 1, x: background.getBounds(this).right + 8, scaleX: 0.8, scaleY: 0.8, ease: iconEasing } );
			} else {
				TweenLite.to( iconError, 0.5, { alpha: 1, x: background.getBounds(this).right + 8, scaleX: 0.8, scaleY: 0.8, ease: iconEasing } );
				TweenLite.to( iconOK, 0.5, { alpha: 0, x: background.getBounds(this).right, scaleX: 0.5, scaleY: 0.5, ease: iconEasing } );
			}
			
		}
		
	}

}