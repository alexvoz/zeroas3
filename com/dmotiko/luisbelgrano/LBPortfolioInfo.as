package com.dmotiko.luisbelgrano {
	import com.general.BaseClip;
	import flash.text.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	public class LBPortfolioInfo
	extends BaseClip {
		
		private var alphaTween:Tween;
		
		public function LBPortfolioInfo() {
			super();
		}
		
		override protected function initClip():void {
			this.visible = false;
			this.alpha = 0;
			txtTitle.autoSize = TextFieldAutoSize.LEFT;
			txtDescription.autoSize = TextFieldAutoSize.LEFT;
			txtTitle.text = "";
			txtDescription.text = "";
		}
		override protected function refreshData():void {
			var photo:LBPortfolioPhoto = getData() as LBPortfolioPhoto;
			txtTitle.text = photo.getTitle();
			txtDescription.text = photo.getDescription();
			txtDescription.y = txtTitle.y + txtTitle.height;
			txtTitle.visible = getShowed();
			txtDescription.visible = getShowed();
		}
		override public function show():void {
			visible = true;
			alphaTween = new Tween( this, "alpha", Regular.easeOut, 0, 1, 1.5, true);
			alphaTween.addEventListener( TweenEvent.MOTION_FINISH, showEnd );
		}
		override protected function showEnd(evnt=undefined):void {
			super.showEnd(evnt);
			txtTitle.visible = true;
			txtDescription.visible = true;
		}
		
		
	}
	
}