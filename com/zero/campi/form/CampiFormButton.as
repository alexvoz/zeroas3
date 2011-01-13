package com.zero.campi.form 
{
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.util.HTMLColors;
	import com.zero.campi.CampiColors;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiFormButton extends Sprite 
	{
		
		private var background:Shape;
		private var txtLabel:TextField;
		
		public function CampiFormButton(label:String) 
		{
			background = new Shape();
			addChild(background);
						
			txtLabel = new TextField();
			txtLabel.width = txtLabel.height = 0;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.selectable = false;
			txtLabel.mouseEnabled = false;
			txtLabel.embedFonts = true;
			addChild( txtLabel );
			
			var format:TextFormat = new TextFormat();
			var font:Font = new FieldLabel();
			format.font = font.fontName;
			format.size = 12;
			format.color = HTMLColors.white;
			
			txtLabel.defaultTextFormat = format;
			txtLabel.text = label.toUpperCase();
			
			txtLabel.x = txtLabel.y = 5;
			
			background.graphics.beginFill( HTMLColors.dimgrey, 1 );
			background.graphics.drawRect(0, 0, txtLabel.width + 10, txtLabel.height + 10);
			
			TweenPlugin.activate([ColorTransformPlugin]);
			
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OVER, clip_over );
			this.addEventListener(MouseEvent.ROLL_OUT, clip_out );
		}
		
		private function clip_out(e:MouseEvent):void 
		{
			TweenLite.to( background, 0.6, { colorTransform: { tint: HTMLColors.dimgrey } } );
		}
		
		private function clip_over(e:MouseEvent):void 
		{
			TweenLite.to( background, 0.6, { colorTransform: { tint: CampiColors.CYAN } } );
		}
		
	}

}