package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.loading.core.DisplayObjectLoader;
	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.util.LayoutUtil;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiProductos extends CampiTramaContent 
	{
		public static const ZOOM_IN:String = "zoom_in";
		public static const ZOOM_OUT:String = "zoom_out";
		
		private var scrollPos:uint;
		private var products:XML;
		private var container:Sprite;
		private var tweens:Vector.<TweenLite>;
				
		private var actualZoom:ProductoZoom;
		private var lastZoom:ProductoZoom;
		private var fotoGrandeMask:Shape;
		private var animationZoom:TramaTransition;
		private var tramaZoom:CampiBitmapTrama;
		private var zoomLoader:Loader;
		private var lastContent:DisplayObject;
		private var collections:XMLList;
		private var btnUp:SimpleButton;
		private var btnDown:SimpleButton;
						
		function CampiProductos()
		{
			TweenPlugin.activate( [ AutoAlphaPlugin ] );
			animationClass = TramaTransition; //defino cual va a ser la transicion para que use la SuperClass
			
			super();
			var pedido:URLRequest = new URLRequest( "products.xml" );
			var loader:URLLoader = new URLLoader( pedido );
			loader.addEventListener(Event.COMPLETE, xml_loaded );
			
			container = new Sprite();
			addChild(container);
			
			container.x = 90;
			container.y = 35;
						
			container.addEventListener(MouseEvent.CLICK, show_zoom );
			zoomLoader = new Loader();
			zoomLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, make_trama_zoom );
			
			scrollPos = 0;
		}
		
		private function make_trama_zoom(e:Event):void 
		{
			lastContent = zoomLoader.content;
						
			DisplayUtil.remove( tramaZoom );
			
			actualZoom.addChild( lastContent );
			
			tramaZoom = new CampiBitmapTrama( actualZoom, 5, 5 );
			animationZoom = new TramaTransition7( tramaZoom, false );
			animationZoom.addEventListener( CampiTramaContent.SHOW_END, replace_effect, false, 0, true );
			animationZoom.addEventListener( CampiTramaContent.HIDE_END, remove_effect, false, 0, true );
			
			addChild( tramaZoom );
			addChild( container );
			animationZoom.show();
		}
		
		private function close_zoom(e:MouseEvent):void 
		{
			if ( e.target is TextField ) return;
			
			addChild(tramaZoom);
			animationZoom.hide();
			
			stage.dispatchEvent( new Event( ZOOM_OUT) );
		}
		
		private function show_zoom(e:Event):void 
		{
			stage.dispatchEvent( new Event( ZOOM_IN) );
			
			var minis:Array = DisplayUtil.getChildren( container );
			for (var i:int = 0; i < minis.length; i++) 
			{
				TweenLite.killTweensOf( minis[i], true );
				minis[i].makeMini();
			}
			TweenLite.to( container, 0.5, { x: 720 } );
			btnDown.alpha = btnUp.alpha = 0;
			btnDown.x = btnUp.x = 720 + 14;
			TweenLite.to( btnUp, 0.5, { autoAlpha: scrollPos > 0 ? 1 : 0, delay: 1 } );
			TweenLite.to( btnDown, 0.5, { autoAlpha: scrollPos < collections.length() - 12 ? 1 : 0, delay: 1 } );
			
			if ( lastZoom ) {
				DisplayUtil.remove( lastZoom.minis );
				lastZoom.hide();
			}
			
			var nodoXML:XML;
			if( e.target is CollectionMiniBasic ){
				nodoXML = e.target.activeNode;
			} else {
				nodoXML = e.target.data.product[0];
			}
						
			actualZoom = new ProductoZoom(nodoXML);
			//actualZoom.addEventListener(MouseEvent.CLICK, close_zoom );
			
			var zoomReq:URLRequest;
			var activeNode:XML;
			if ( e.currentTarget is CollectionMiniBasic ) {
				activeNode = e.currentTarget.activeNode;
			} else {
				activeNode = e.target.data.product[0];	
			}
			
			zoomReq = new URLRequest( e.target.data.@imgPath + activeNode.@src );				 
			zoomLoader.load( zoomReq );
			
			if( e.target.data.product.length() > 1 ){
				var mcMinis:CollectionMiniBasic = new CollectionMiniBasic( e.target.data, activeNode );
				mcMinis.name = "minis";
				mcMinis.addEventListener(Event.CHANGE, show_zoom );
				mcMinis.x = actualZoom.txtTitle.x;
				mcMinis.y = actualZoom.height - mcMinis.height - 10;
				actualZoom.minis = mcMinis;
			}
			
		}
		
		private function update_zoom(e:Event):void 
		{
			var zoomReq:URLRequest = new URLRequest( e.target.data.@imgPath + e.currentTarget.activeNode.@src );
			zoomLoader.load( zoomReq );
		}
		
		private function remove_effect(e:Event):void 
		{
			removeChild( tramaZoom );
			
			var minis:Array = DisplayUtil.getChildren( container );
			for (var i:int = 0; i < minis.length; i++) 
			{
				minis[i].makeNormal();
			}
			TweenLite.to( container, 0.5, { x: 90 } );
		}
		
		private function replace_effect(e:Event):void 
		{
			var trama:CampiBitmapTrama = (e.currentTarget as TramaTransition).getTrama();
			addChild( trama.target );
			DisplayUtil.remove( trama );
			if ( lastZoom ) DisplayUtil.remove(lastZoom);
			lastZoom = actualZoom;
		}
		
		private function xml_loaded(e:Event):void 
		{
			products = new XML( e.currentTarget.data );
			collections = products.collection;
			var allProd:XMLList = products..product;
			var nProd:int = 0;
			for each( var prod:XML in allProd ) {
				if ( !prod.attribute("id").toString() ) {
					prod.@id = 100000 + nProd;
				}
				nProd++;
			}
			
			for each( var col:XML in collections ) {
				var btn:CollectionMini = new CollectionMini( col );
				container.addChild(btn);
				btn.visible = false;
			}
			LayoutUtil.layoutY(container, 10);
			container.scrollRect = new Rectangle( 0, 0, 500, 530 );
			if ( collections.length() > 12 ) {
				btnUp = new ProductArrow();
				btnDown = new ProductArrow();
				btnUp.x = btnDown.x = container.x + 12;
				btnUp.y = container.y - 15;
				btnUp.scaleY = -1;
				btnDown.y = container.y + 545;
				this.addChild( btnUp );
				this.addChild( btnDown );
				btnUp.addEventListener(MouseEvent.CLICK, scroll_container);
				btnDown.addEventListener(MouseEvent.CLICK, scroll_container);
				TweenLite.to( btnUp, 0, { autoAlpha: 0 } );
				btnDown.alpha = 0;
				TweenLite.to( btnDown, 0.5, { autoAlpha: 1, delay: 6 } );
			}
		}
		
		private function scroll_container(e:Event):void 
		{
			switch( e.target ) {
				case btnUp:
				if ( scrollPos > 0 ) {
					scrollPos--;
				}
				break;
				
				case btnDown:
				if ( scrollPos < collections.length() - 12 ) {
					scrollPos++;
				}
				break;
			}
			TweenLite.to( btnUp, 0.5, { autoAlpha: scrollPos > 0 ? 1 : 0 } );
			TweenLite.to( btnDown, 0.5, { autoAlpha: scrollPos < collections.length() - 12 ? 1 : 0 } );
						
			for (var i2:int = 0; i2 < container.numChildren; i2++) 
			{
				var child2:DisplayObject = container.getChildAt( i2 );
				var modulo2:int = 35 + 10;
				var inicio:int = -modulo2 * scrollPos;
				TweenLite.to( child2, 0.7, { y: inicio + modulo2*i2, ease: Strong.easeInOut, delay: i2 / 20 } );
			}
		}
		
		override public function hide():void {
			close_zoom(undefined);
			tweens.forEach( function( item:TweenLite, index:int, vector  ) { item.reverse(); } );
		}
		
		protected function menu_hide_end():void {
			super.hide();
		}
		
		override protected function animation_show_end(e:Event):void 
		{
			super.animation_show_end(e);
			
			tweens = new Vector.<TweenLite>( container.numChildren, true );
			for (var i:int = 0; i < container.numChildren; i++) 
			{
				var cm:CollectionMini = container.getChildAt(i) as CollectionMini;
				cm.visible = true;
				tweens[i] = TweenLite.from( cm , 0.5, { alpha: 0, delay: i*0.3, onStart: cm.show } );
			}
			tweens = tweens.sort( sortOnDelay ).reverse();
			tweens[0].vars.onReverseComplete = menu_hide_end;
		}
		
		protected function sortOnDelay(a, b):Number {
			if(a.vars.delay > a.vars.delay ) {
				return 1;
			} else if(a.vars.delay < b.vars.delay) {
				return -1;
			} else  {
				return 0;
			}
		}
		
		
	}

}