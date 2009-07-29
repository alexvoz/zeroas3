package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
		
	public class PedidoContainer
	extends BaseMenu {
		
		public var background:Sprite;
		public var mcEnvio:CarritoEnvio;
		
		private var sContainer:Sprite;
		
		override protected function initClip():void {
			super.initClip();
			setView( PedidoItem );
			mcEnvio.addEventListener( Event.CHANGE, envio_changed );
			
			if ( Site.getApp() ) {
				Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, lang_changed);
				lang_changed(undefined);
			}
		}
		
		private function lang_changed(e:Event):void 
		{
			if ( Site.getApp().getLanguage() == Site.SPANISH ) {
				gotoAndStop(1);
				
			} else {
				gotoAndStop(2);
				
			}
		}
		
		private function envio_changed(e:Event):void 
		{
			if ( e.target == mcEnvio ) {
				this.dispatchEvent( new Event( Event.CHANGE ) );
			}
		}
		
		public function collectVars():Object {
			var o:Object = mcEnvio.collectVars();
			var sPedido:String = "";
			for each( var btn:PedidoItem in aBtns) {
				sPedido += btn.getValue();
			}			
			o.pedido = sPedido;
			
			mcEnvio.erase_fields(undefined);
			
			var oData = getData();
			for ( var i:int = 0; i < oData.length; i++) {
				oData[i].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			}
			setData( new Array() );
			return o;
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			var oData = getData();			
			for ( var i:int = 0; i < oData.length; i++) {
				var item:BaseMenuBtn = new view();
				item.setData( oData[i] );
				aBtns.push(item);
			}
			layout();
			
		}
		
		override protected function layout():void {
			
			if (sContainer) removeChild(sContainer);
			sContainer = new Sprite();
			sContainer.y = background.y + 5;
			addChild(sContainer);
			nOffset = 0;
			
			if ( aBtns.length == 0 ) {
				registerTween("backScale", new Tween( background, "height", Regular.easeOut, background.height, nOffset + 5, 0.3, true), false, true, true);
			}
			
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				item.x = 10;
				item.y = nOffset;
				nOffset += item.height + nSpace;
				sContainer.addChild( item );
				registerTween("backScale", new Tween( background, "height", Regular.easeOut, background.height, nOffset + 5, 0.3, true), false, true, true);
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		override protected function tweenChanged(key:String, tween:Tween):void {
			mcEnvio.y = background.getBounds(this).bottom;
		}
		
	}
	
}