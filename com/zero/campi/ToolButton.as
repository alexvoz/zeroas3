package com.zero.campi 
{
	import flash.display.Sprite;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.events.MouseEvent;
		
	/**
	 * ...
	 * @author sminutoli
	 */
	public class ToolButton extends Sprite
	{
		
		public function ToolButton() 
		{
			TweenMax.to(this, 0.1, { colorMatrixFilter: { saturation:0 }} );
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OVER, icon_over );
			this.addEventListener(MouseEvent.ROLL_OUT, icon_out );
		}
		
		private function icon_out(e:MouseEvent):void 
		{
			TweenMax.to(this, 1, { colorMatrixFilter: { saturation:0 }} );
		}
		
		private function icon_over(e:MouseEvent):void 
		{
			TweenMax.to(this, 1, { colorMatrixFilter: { saturation:1 }} );
		}
		
	}

}