package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.Elastic;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
		
	public class CarritoSelector
	extends BaseClip {
		
		public var mcMedias:ElementoBtn;
		public var mcRopa:ElementoBtn;
		public var backgroundBody:Sprite;
		public var backgroundFooter:Sprite;
		
		protected var carritoMedias:CarritoMedias;
		protected var carritoRopa:CarritoRopa;
		private var activeBtn:ElementoBtn;
		private var activeCarrito:CarritoTemplate;
		
		override protected function initClip():void {
			if ( Site.getApp() && Site.getApp().getLanguage() != Site.SPANISH ) {
				mcMedias.setData( { label: "stockings" } );
				mcRopa.setData( { label: "clothes" } );
			} else {
				mcMedias.setData( { label: "medias" } );
				mcRopa.setData( { label: "ropa" } );
			}
			
			carritoMedias = new CarritoMedias();
			carritoRopa = new CarritoRopa();
			carritoMedias.y = carritoRopa.y = backgroundBody.y + 5;
			carritoMedias.addEventListener( Event.CHANGE, carrito_change);
			carritoRopa.addEventListener( Event.CHANGE, carrito_change);
						
			mcMedias.addEventListener( MouseEvent.CLICK, show_carrito);
			mcRopa.addEventListener( MouseEvent.CLICK, show_carrito);
			
			mcMedias.rollOver(undefined);
			mcMedias.dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			
			backgroundBody.height = 5;
			backgroundFooter.y = backgroundBody.getBounds(this).bottom;
			
			if (Site.getApp()) {
				Site.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
				Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, section_changed);
				section_changed( undefined );
			}
		}
		
		private function section_changed(e:Event):void 
		{
			//return;
			if ( Site.getApp().getLanguage() == Site.SPANISH ) {
				gotoAndStop(1);
				mcMedias.setData( { label: "medias" } );
				mcRopa.setData( { label: "ropa" } );
			} else {
				gotoAndStop(2);
				mcMedias.setData( { label: "stockings" } );
				mcRopa.setData( { label: "clothes" } );
			}
			mcRopa.x = mcMedias.getBounds(this).right;
			
			if( Site.getApp().getSection() != Site.CARRITO ){
				var nHeight:Number = Site.getApp().height;
				if (nHeight < 650) nHeight == 650;
				if( Site.getApp().getSWF_VAR("browser") ){
					navigateToURL( new URLRequest( "javascript: setWindowSize(" + nHeight +")"), "_self");
				}
			}
		}
				
		private function show_carrito(e:MouseEvent):void {
			if (activeBtn) activeBtn.setActive(false);
			activeBtn = e.currentTarget as ElementoBtn;
			activeBtn.setActive(true);
			if ( e.currentTarget == mcMedias ) {
				try { removeChild( carritoRopa ); } catch (e) { };
				activeCarrito = carritoMedias;
				
			} else {
				try { removeChild( carritoMedias ); } catch (e) { };
				activeCarrito = carritoRopa;
				
			}
			registerTween( "bodyScale", new Tween( backgroundBody, "height", Elastic.easeOut, backgroundBody.height, activeCarrito.height, 1, true), false, true, true);
					
		}
		
		private function carrito_change(e:Event):void 
		{
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		public function getActiveCarrito():CarritoTemplate {
			return activeCarrito;
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			addChild( activeCarrito );
			dispatchEvent( new Event( Event.CHANGE ) );
			if( Site.getApp() && Site.getApp().getSection() == Site.CARRITO && Site.getApp().getSWF_VAR("browser") ){
				navigateToURL( new URLRequest( "javascript: setWindowSize(" + backgroundFooter.getBounds(Site.getApp()).bottom + ")"), "_self");
			}
		}
		
		override protected function tweenChanged( key:String, tween:Tween):void {
			backgroundFooter.y = backgroundBody.getBounds(this).bottom;
		}
		
	}
	
}