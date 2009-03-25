package com.dmotiko.selu {
	
	import flash.display.*;
	import flash.events.*
	import com.general.*
	
	public class SeluCollectionSection
	extends BaseClip {
		
		private var thumbs:SeluCollectionThumbs;
		private var info:SeluCollectionInfo;
		private var btnBasicos:MovieClip;
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
			
			btnColeccionAnterior.buttonMode = true;
			btnColeccionAnterior.addEventListener( MouseEvent.CLICK, toggle_collection);
			
			thumbs.addEventListener( Event.CHANGE, thumbs_changed);
			thumbs.addEventListener( Event.COMPLETE, thumbs_complete);
			thumbs.setData( SeluSite.getApp().getCollectionData() );
		}
		
		private function thumbs_complete(e:Event):void {
			(thumbs.getButtons()[0] as BaseMenuBtn).rollOver( undefined );
			(thumbs.getButtons()[0] as BaseMenuBtn).dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		
		private function toggle_collection(e:MouseEvent):void {
			if ( e.currentTarget as MovieClip == btnColeccionAnterior ) {
				thumbs.setData( SeluSite.getApp().getLastCollectionData() );
			}
		}
				
		private function thumbs_changed(e:Event):void {
			info.setData( thumbs.getActiveButton().getData() );
			photo.setData( thumbs.getActiveButton().getData() );
		}
		
	}
	
}