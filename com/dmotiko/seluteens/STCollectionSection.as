package com.dmotiko.seluteens {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class STCollectionSection
	extends BaseClip {
		
		public var mcThumbs:STCollectionThumbs;
		public var mcInfo:STCollectionInfo;
		public var btnBasicos:MovieClip;
		public var btnColeccion09:MovieClip;
		public var btnColeccionAnterior:MovieClip;
		public var mcPhoto:STCollectionPhoto;
		
		override protected function initClip():void {
			super.initClip();
						
			//inicializo
			btnBasicos.buttonMode = btnColeccion09.buttonMode = true;
			btnBasicos.addEventListener( MouseEvent.CLICK, toggle_collection);
			btnColeccion09.visible = false;
			btnColeccion09.alpha = 0;
			btnColeccion09.addEventListener( MouseEvent.CLICK, toggle_collection);
			btnColeccionAnterior.addEventListener( MouseEvent.CLICK, gotoLastCollection );
			
			mcThumbs.addEventListener( Event.CHANGE, mcThumbs_changed);
			mcThumbs.addEventListener( Event.COMPLETE, mcThumbs_complete);
			mcThumbs.setData( STSite.getApp().getCollectionData() );
		}
		
		private function gotoLastCollection(e:MouseEvent):void {
			var url:String = "http://www.selu.com.ar/backup09";
			var request:URLRequest = new URLRequest(url);
			try {
			  navigateToURL(request, '_blank'); // second argument is target
			} catch (e:Error) {
			  trace("Error occurred!");
			}
		}
				
		private function mcThumbs_complete(e:Event):void {
			mcThumbs.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			mcThumbs.getButtons()[0].rollOver( undefined );
		}
		
		private function toggle_collection(e:MouseEvent):void {
			if ( e.currentTarget as MovieClip == btnBasicos ) {
				mcThumbs.setData( STSite.getApp().getCollectionBasicData() );
				
				killTween( "basicFade" );
				registerTween( "basicFade", new Tween( btnBasicos, "alpha", Regular.easeOut, btnBasicos.alpha, 0, 0.5, true), false, true );
				btnColeccion09.visible = true;
				killTween( "collectionFade" )
				registerTween( "collectionFade", new Tween( btnColeccion09, "alpha", Regular.easeOut, btnColeccion09.alpha, 1, 0.5, true));
				
			} else if ( e.currentTarget as MovieClip == btnColeccion09 ) {
				mcThumbs.setData( STSite.getApp().getCollectionData() );
				
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