package com.dmotiko.selu {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	
	public class SeluButton
	extends BaseMenuBtn {
		
		private var _overAnimation:MovieClip;
		private var spBack:Sprite;
		//private var txtLabel:TextField;
		protected var nColor:Number;
		
		public function SeluButton() {
			super();
		}
		
		override protected function initClip():void {
			this.useHandCursor = true;
			this.buttonMode = true;
			txtLabel.mouseEnabled = false;
			
			nColor = 0x474747;
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			txtLabel.textColor = nColor;
			this.addEventListener( MouseEvent.ROLL_OVER, rollOver);
			this.addEventListener( MouseEvent.ROLL_OUT, rollOut);
		}
		
		override public function rollOver( evnt:MouseEvent ):void {
			spBack.visible = true;
			txtLabel.textColor = 0xFFFFFF;
			if ( _overAnimation ) _overAnimation.gotoAndPlay("show");
		}
		
		override public function rollOut( evnt:MouseEvent ):void {
			if ( _overAnimation && evnt ) _overAnimation.gotoAndPlay("hide");
			if ( this.bActive )	return;
			spBack.visible = false;
			txtLabel.textColor = nColor;
		}
		
		override protected function refreshData():void {
			txtLabel.text = data.label.toUpperCase();
			spBack = new Sprite();
			spBack.graphics.beginFill(nColor, 1);
			spBack.graphics.drawRect(-2, -1, txtLabel.width + 4, txtLabel.height);
			spBack.graphics.endFill();
			spBack.visible = false;
			this.addChildAt( spBack, 0);
			if(data.over) this.setOverAnimation( data.over );
		}
		
		public function getOverAnimation():MovieClip { return _overAnimation; }
		
		public function setOverAnimation(value:MovieClip):void 
		{
			_overAnimation = value;
			this.addChild(_overAnimation);
			_overAnimation.y = -_overAnimation.height - 15;
		}
		
	}
	
}