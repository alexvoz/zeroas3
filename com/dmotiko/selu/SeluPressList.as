package com.dmotiko.selu {
	import com.general.*;
	import com.gui.ScrollerMovie;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;

		
	public class SeluPressList
	extends ScrollerMovie {
		protected var data:*;
		protected var activeBtn:SeluPressButton;
		protected var aBtns:Array;
		
		function SeluPressList() {
			super();
			initClip();
			var p:BaseClip = parent as BaseClip;
			if ( p ) {
				addEventListener( BaseClip.CLIP_LOADED, p.childLoaded );
			}
			function dispatch(evnt) {
				removeEventListener( Event.ENTER_FRAME, dispatch );
				dispatchEvent( new Event( BaseClip.CLIP_LOADED ) );
			}
			addEventListener( Event.ENTER_FRAME, dispatch);
			
		}
		
		protected function initClip():void {
			
		}
		
		public function setData( data:* ):void {
			this.data = data;
			refreshData();
		}
		public function getData():* { return this.data; }
		
		protected function refreshData():void {
			
			this.removeChild(mcContent);
			mcContent = new Sprite();
			mcContent.x = mcMask.x;
			mcContent.y = mcMask.y;
			this.addChild( mcContent );
			mcContent.mask = mcMask;
			
			aBtns = new Array();
			
			var xml:XML = data as XML;
			var nY:int = 0;
			for each(var nodo:XML in xml.elements()){
				var item:BaseMenuBtn = new SeluPressButton();
				item.setData( { label: new String(nodo.@name), data: nodo } );
				item.addEventListener( MouseEvent.CLICK, active_btn );
				item.y = nY;
				nY += item.height + 10;
				mcContent.addChild( item );
				aBtns.push( item );
			}
			
			dispatchEvent( new Event(Event.COMPLETE) );
		}
		
		protected function active_btn( e:MouseEvent ):void {
			if ( activeBtn ) activeBtn.setActive(false);
			activeBtn = e.currentTarget as SeluPressButton;
			activeBtn.setActive(true);
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		public function getActiveButton():SeluPressButton {
			return activeBtn;
		}
		public function getButtons():Array {
			return aBtns;
		}
		
		public function scrollD():void {
			mcContent.x = -10;
		}
		
		
	}
	
}