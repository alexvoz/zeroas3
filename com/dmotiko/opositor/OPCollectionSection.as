﻿package com.dmotiko.opositor {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*
	import com.general.*
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class OPCollectionSection
	extends BaseClip {
		
		public var mcButton:BaseClip;
		public var mcThumbs:OPCollectionThumbs;
		public var mcInfo:OPCollectionInfo;
		public var mcPhoto:OPCollectionPhoto;
		public var mcPhotoWide:OPCollectionPhoto;
				
		private var activePhoto:OPCollectionPhoto;
		
		override protected function initClip():void {
			super.initClip();
			
			mcButton.addEventListener( MouseEvent.CLICK, set_section);
			
			//inicializo
			mcThumbs.addEventListener( Event.CHANGE, mcThumbs_changed);
			mcThumbs.addEventListener( Event.COMPLETE, mcThumbs_complete);
			if ( OPSite.getApp() ){
				var xmlData:XMLList = OPSite.getApp().getCollectionData();
				mcThumbs.setData( xmlData );
				OPSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			}
						
			//activePhoto = mcPhoto;
			mcPhoto.addEventListener( Event.COMPLETE, photo_complete);
			
			
		}
		
		private function section_changed(e:Event):void {
			if ( OPSite.getApp().getSection() == OPSite.COLECCION) {
				mcThumbs.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
				mcThumbs.getButtons()[0].rollOver( undefined );
			}
		}
		
		private function set_section(e:MouseEvent):void {
			if ( OPSite.getApp().getSection() != OPSite.COLECCION ) {
				OPSite.getApp().setSection( OPSite.COLECCION );
			}
		}
				
		private function rotate_btn(e:MouseEvent):void {
			var nRot:int = -2;
			if ( e.type == MouseEvent.ROLL_OUT ) nRot = 2;
			registerTween(e.currentTarget.name + "Rotation", new Tween( e.currentTarget, "rotation", Regular.easeOut, e.currentTarget.rotation, nRot, 0.5, true));
		}
				
		private function gotoLastCollection(e:MouseEvent):void {
			var url:String = OPSite.getApp().loaderInfo.parameters["lastCollection_src"];
			OPSite.log( "OPCollectionSection gotoLastCollection | URL= "+url );
			var request:URLRequest = new URLRequest(url);
			try {
			  navigateToURL(request, '_blank'); // second argument is target
			} catch (e:Error) {
			  OPSite.log( "OPCollectionSection gotoLastCollection | URL error" );
			}
		}
				
		private function mcThumbs_complete(e:Event):void {
			mcThumbs.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			mcThumbs.getButtons()[0].rollOver( undefined );
		}
		
		private function mcThumbs_changed(e:Event):void {
			mcInfo.setData( mcThumbs.getActiveButton().getData() );
			var bWide:Boolean = (mcThumbs.getActiveButton().getData() as XML).attribute("wide").toString() == "true";
			if ( bWide ) {
				if( mcPhotoWide.getData() && !mcPhotoWide.hasEventListener( Event.COMPLETE ) ) mcPhotoWide.addEventListener( Event.COMPLETE, photo_complete);
				mcPhotoWide.setData( mcThumbs.getActiveButton().getData() );
			} else {
				mcPhoto.setData( mcThumbs.getActiveButton().getData() );
			}
		}
		private function photo_complete(e:Event):void {
			if ( !activePhoto && e.currentTarget == mcPhoto ) {
				activePhoto = mcPhoto;
				var xmlData:XMLList = OPSite.getApp().getCollectionData();
				var i:int = 0;
				while ( xmlData[i] ) {
					var node = xmlData[i];
					if ( (node as XML).attribute("wide").toString() == "true" ) {
						mcPhotoWide.setData( node );
						break;
					}
					i++;
				}
			}
			if ( !activePhoto || (activePhoto == e.currentTarget) ) return;
			if ( getChildIndex( activePhoto ) > getChildIndex( e.currentTarget as DisplayObject ) ) {
				setChildIndex( activePhoto, getChildIndex( activePhoto ) - 1 );
				setChildIndex( e.currentTarget as DisplayObject, getChildIndex( activePhoto ) + 1 );
			}
			activePhoto = e.currentTarget as OPCollectionPhoto;
		}
		
	}
	
}