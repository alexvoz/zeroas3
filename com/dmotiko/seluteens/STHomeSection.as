package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Elastic;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;	
	import flash.events.*
	import com.general.*
			
	public class STHomeSection
	extends BaseClip {
		
		//FLA clips
		public var mcLastNew:MovieClip;
		public var mcClub:MovieClip;
		public var mcCollection:MovieClip;
		
		override protected function initClip():void {
			super.initClip();
			
			//inicializo los clips
			mcLastNew.buttonMode = mcClub.buttonMode = mcCollection.buttonMode = true;
			mcLastNew.mouseChildren = mcClub.mouseChildren = mcCollection.mouseChildren = false;
			
			mcLastNew.addEventListener( MouseEvent.ROLL_OVER, postit_over );
			mcClub.addEventListener( MouseEvent.ROLL_OVER, postit_over );
			mcCollection.addEventListener( MouseEvent.ROLL_OVER, postit_over );
			
			mcLastNew.addEventListener( MouseEvent.ROLL_OUT, postit_out );
			mcClub.addEventListener( MouseEvent.ROLL_OUT, postit_out );
			mcCollection.addEventListener( MouseEvent.ROLL_OUT, postit_out );
			
			mcLastNew.addEventListener( MouseEvent.CLICK, postit_selected );
			mcClub.addEventListener( MouseEvent.CLICK, postit_selected );
			mcCollection.addEventListener( MouseEvent.CLICK, postit_selected );
			
		}
		
		private function postit_selected(e:MouseEvent):void 
		{
			if ( e.currentTarget == mcCollection ) {
				STSite.getApp().setSection( STSite.COLECCION ); 
			} else {
				STSite.getApp().setSection( STSite.NOVEDADES );
			}
		}
		
		private function postit_out(e:MouseEvent):void 
		{
			registerTween( e.currentTarget.name + "Rotation", new Tween( e.currentTarget, "rotation", Regular.easeOut, e.currentTarget.rotation, 0, 0.5, true) );
		}
		
		private function postit_over(e:MouseEvent):void 
		{
			registerTween( e.currentTarget.name + "Rotation", new Tween( e.currentTarget, "rotation", Regular.easeOut, e.currentTarget.rotation, -5, 0.5, true) );
		}
		
	}
	
}