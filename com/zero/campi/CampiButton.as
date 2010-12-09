package com.zero.campi 
{
	//import com.eclecticdesignstudio.motion.Actuate;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
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
			txtLabel.text = sName.toUpperCase();
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
			if ( active ) return;
			//Actuate.tween(this, 0.5, { x: initPos.x } );
			//Actuate.transform(this, 1).color(0xA0A0A0, 1);
			TweenMax.to( this, 0.5, { x: initPos.x, colorTransform: { tint: 0xA0A0A0 } } );
		}
		
		private function btn_over(e:MouseEvent):void 
		{
			if ( !initPos ) initPos = new Point( x, y );
			
			//Actuate.tween(this, 0.5, { x: initPos.x + 2 } );
			//Actuate.transform(this, 1).color(0xFFFFFF, 1);
			TweenMax.to( this, 0.5, { x: initPos.x + 2, colorTransform: { tint: 0xFFFFFF } } );
		}
		
		public function get active():Boolean { return _active; }
		
		public function set active(value:Boolean):void 
		{
			_active = value;
			if ( value ) {
				dispatchEvent( new MouseEvent( MouseEvent.ROLL_OVER ) );
			} else {
				dispatchEvent( new MouseEvent( MouseEvent.ROLL_OUT ) );
			}
		}
		
	}

}