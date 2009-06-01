package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
		
	public class SeluPressSection
	extends BaseClip {
		
		//FLA symbols
		public var mcMediaList:SeluPressList;
		public var mcDateList:SeluPressDateList;
		public var mcPhoto:SeluPressPhoto;
		//
		
		override protected function initClip():void {
			
		}
		
		override public function childLoaded( e:Event ):void {
			
			switch( e.currentTarget ) {
				case mcMediaList:
				var xmlData:XMLList = SeluSite.getApp().getPressData();
				mcMediaList.addEventListener( Event.COMPLETE, media_changed );
				mcMediaList.addEventListener( Event.CHANGE, media_changed );
				mcMediaList.setData( new XML( "<root>" + xmlData.toXMLString() + "</root>") );
				break;
				
				case mcDateList:
				mcDateList.addEventListener( Event.COMPLETE, date_changed );
				mcDateList.addEventListener( Event.CHANGE, date_changed );
				if ( mcMediaList.getActiveButton() ) {
					mcDateList.setData( mcMediaList.getActiveButton().getData().data );
				}
				break;
			}
			
		}
			
		private function media_changed(e:Event):void {
			if ( e.type == Event.COMPLETE ) {
				mcMediaList.getButtons()[0].rollOver(undefined);
				mcMediaList.getButtons()[0].dispatchEvent( new MouseEvent(MouseEvent.CLICK) );
				return;
			}
			mcDateList.setData( mcMediaList.getActiveButton().getData().data );
		}
		
		private function date_changed(e:Event):void {
			if ( e.type == Event.COMPLETE ) {
				mcDateList.getButtons()[0].rollOver(undefined);
				mcDateList.getButtons()[0].dispatchEvent( new MouseEvent(MouseEvent.CLICK) );
				return;
			}
			SeluSite.log( "SeluPressSection | date_changed= " + mcDateList.getActiveButton().getData().label );
			var xml:XML = mcDateList.getActiveButton().getData().data as XML;
			//var sSrc:String = new String(xml.elements()[0].@src);
			mcPhoto.setData( xml.elements()[0] );			
		}
		
	}
	
}