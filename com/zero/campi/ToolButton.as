package com.zero.campi 
{
	import flash.display.Sprite;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.events.MouseEvent;
	import flash.text.TextField;
		
	/**
	 * ...
	 * @author sminutoli
	 */
	public class ToolButton extends Sprite
	{
		
		public var txtLabel:TextField;
		
		public function ToolButton() 
		{
			TweenMax.to(this, 0.1, { colorMatrixFilter: { saturation:0 }} );
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OVER, icon_over );
			this.addEventListener(MouseEvent.ROLL_OUT, icon_out );
			
			if ( txtLabel ) removeChild( txtLabel );
			
		}
		
		private function icon_out(e:MouseEvent):void 
		{
			TweenMax.to(this, 1, { colorMatrixFilter: { saturation:0 }} );
			if ( txtLabel ) removeChild( txtLabel );
		}
		
		private function icon_over(e:MouseEvent):void 
		{
			TweenMax.to(this, 1, { colorMatrixFilter: { saturation:1 }} );
			if ( txtLabel ) {
				addChild( txtLabel );
				TweenMax.from(txtLabel, 0.6, { alpha: 0, y: -20, repeat: 1, repeatDelay: 1, yoyo: true, startAt: { alpha: 1, y: -12 } } );
			}
		}
		
	}

}