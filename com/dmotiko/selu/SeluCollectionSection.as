package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	
	public class SeluCollectionSection
	extends BaseClip {
		
		private var thumbs:SeluCollectionThumbs;
		private var info:SeluCollectionInfo;
		private var btnBasicos:MovieClip;
		private var btnColeccion09:MovieClip;
		private var btnColeccionAnterior:MovieClip;
		private var photo:SeluCollectionPhoto;
		
		override protected function initClip():void {
			super.initClip();
			trace("SeluCollectionSection initClip "+this);
			
			//recolecto los movieclips que están en el fla
			thumbs = getChildByName("mcThumbs") as SeluCollectionThumbs;
			info = getChildByName("mcInfo") as SeluCollectionInfo;
			photo = getChildByName("mcPhoto") as SeluCollectionPhoto;
			btnBasicos = getChildByName("mcSeluBasicos") as MovieClip;
			btnColeccionAnterior = getChildByName("mcColeccionAnterior") as MovieClip;
			btnColeccion09 = getChildByName("mcSeluCollection") as MovieClip;
			
			btnBasicos.buttonMode = btnColeccion09.buttonMode = true;
			btnBasicos.addEventListener( MouseEvent.CLICK, toggle_collection);
			btnColeccion09.visible = false;
			btnColeccion09.alpha = 0;
			btnColeccion09.addEventListener( MouseEvent.CLICK, toggle_collection);
			
			thumbs.addEventListener( Event.CHANGE, thumbs_changed);
			thumbs.addEventListener( Event.COMPLETE, thumbs_complete);
			thumbs.setData( SeluSite.getApp().getCollectionData() );
		}
		
		private function thumbs_complete(e:Event):void {
			thumbs.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			thumbs.getButtons()[0].rollOver( undefined );
		}
		
		private function toggle_collection(e:MouseEvent):void {
			if ( e.currentTarget as MovieClip == btnBasicos ) {
				thumbs.setData( SeluSite.getApp().getCollectionBasicData() );
				
				killTween( "basicFade" );
				registerTween( "basicFade", new Tween( btnBasicos, "alpha", Regular.easeOut, btnBasicos.alpha, 0, 0.5, true), false, true );
				btnColeccion09.visible = true;
				killTween( "collectionFade" )
				registerTween( "collectionFade", new Tween( btnColeccion09, "alpha", Regular.easeOut, btnColeccion09.alpha, 1, 0.5, true));
				
			} else if ( e.currentTarget as MovieClip == btnColeccion09 ) {
				thumbs.setData( SeluSite.getApp().getCollectionData() );
				
				btnBasicos.visible = true;
				killTween( "basicFade" );
				registerTween( "basicFade", new Tween( btnBasicos, "alpha", Regular.easeOut, btnBasicos.alpha, 1, 0.5, true));
				
				killTween( "collectionFade" )
				registerTween( "collectionFade", new Tween( btnColeccion09, "alpha", Regular.easeOut, btnColeccion09.alpha, 0, 0.5, true), false, true );
			}
		}
				
		private function thumbs_changed(e:Event):void {
			info.setData( thumbs.getActiveButton().getData() );
			photo.setData( thumbs.getActiveButton().getData() );
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			if ( key == "basicFade" && btnBasicos.alpha == 0 ) btnBasicos.visible = false;
			if ( key == "collectionFade" && btnColeccion09.alpha == 0 ) btnColeccion09.visible = false;
		}
		
	}
	
}