package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class SeluCollectionSection
	extends BaseClip {
		
		public var mcThumbs:SeluCollectionThumbs;
		public var mcInfo:SeluCollectionInfo;
		public var btnBasicos:MovieClip;
		public var btnColeccion09:MovieClip;
		public var btnColeccionAnterior:MovieClip;
		public var mcPhoto:SeluCollectionPhoto;
		
		override protected function initClip():void {
			super.initClip();
						
			//inicializo
			btnBasicos.buttonMode = btnColeccion09.buttonMode = btnColeccionAnterior.buttonMode = true;
			btnBasicos.addEventListener( MouseEvent.CLICK, toggle_collection);
			btnColeccion09.visible = false;
			btnColeccion09.alpha = 0;
			btnColeccion09.addEventListener( MouseEvent.CLICK, toggle_collection);
			btnColeccionAnterior.visible = false;
			btnColeccionAnterior.addEventListener( MouseEvent.CLICK, gotoLastCollection );
			
			btnBasicos.addEventListener( MouseEvent.ROLL_OVER, btn_over_out);
			btnBasicos.addEventListener( MouseEvent.ROLL_OUT, btn_over_out);
			
			btnColeccion09.addEventListener( MouseEvent.ROLL_OVER, btn_over_out);
			btnColeccion09.addEventListener( MouseEvent.ROLL_OUT, btn_over_out);
			
			btnColeccionAnterior.addEventListener( MouseEvent.ROLL_OVER, btn_over_out);
			btnColeccionAnterior.addEventListener( MouseEvent.ROLL_OUT, btn_over_out);
			
			mcThumbs.addEventListener( Event.CHANGE, mcThumbs_changed);
			mcThumbs.addEventListener( Event.COMPLETE, mcThumbs_complete);
			mcThumbs.setData( SeluSite.getApp().getCollectionData() );
		}
		
		private function btn_over_out(e:MouseEvent):void 
		{
			
			var btn:MovieClip = e.currentTarget as MovieClip;
						
			if ( e.type == MouseEvent.ROLL_OVER ) {
				registerTween( btn.name + "_rotation", new Tween( btn, "rotation", Regular.easeOut, btn.rotation, 2, 0.3, true) );
			} else if( e.type == MouseEvent.ROLL_OUT) {
				registerTween( btn.name + "_rotation", new Tween( btn, "rotation", Regular.easeOut, btn.rotation, 0, 0.3, true) );
			}
			
		}
		
		private function gotoLastCollection(e:MouseEvent):void {
			var url:String = SeluSite.getApp().getSWF_VAR("lastCollection_src");
			var request:URLRequest = new URLRequest(url);
			try {
			  navigateToURL(request, '_blank'); // second argument is target
			} catch (e:Error) {
			  SeluSite.log("SeluCollectionSection | gotoLastCollection | Error occurred!");
			}
		}
				
		private function mcThumbs_complete(e:Event):void {
			mcThumbs.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			mcThumbs.getButtons()[0].rollOver( undefined );
		}
		
		private function toggle_collection(e:MouseEvent):void {
			if ( e.currentTarget as MovieClip == btnBasicos ) {
				mcThumbs.setData( SeluSite.getApp().getCollectionBasicData() );
				
				killTween( "basicFade" );
				registerTween( "basicFade", new Tween( btnBasicos, "alpha", Regular.easeOut, btnBasicos.alpha, 0, 0.5, true), false, true );
				btnColeccion09.visible = true;
				killTween( "collectionFade" )
				registerTween( "collectionFade", new Tween( btnColeccion09, "alpha", Regular.easeOut, btnColeccion09.alpha, 1, 0.5, true));
				
			} else if ( e.currentTarget as MovieClip == btnColeccion09 ) {
				mcThumbs.setData( SeluSite.getApp().getCollectionData() );
				
				btnBasicos.visible = true;
				killTween( "basicFade" );
				registerTween( "basicFade", new Tween( btnBasicos, "alpha", Regular.easeOut, btnBasicos.alpha, 1, 0.5, true));
				
				killTween( "collectionFade" )
				registerTween( "collectionFade", new Tween( btnColeccion09, "alpha", Regular.easeOut, btnColeccion09.alpha, 0, 0.5, true), false, true );
			}
		}
				
		private function mcThumbs_changed(e:Event):void {
			mcInfo.setData( mcThumbs.getActiveButton().getData() );
			mcPhoto.setData( mcThumbs.getActiveButton().getData() );
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			if ( key == "basicFade" && btnBasicos.alpha == 0 ) btnBasicos.visible = false;
			if ( key == "collectionFade" && btnColeccion09.alpha == 0 ) btnColeccion09.visible = false;
		}
		
	}
	
}