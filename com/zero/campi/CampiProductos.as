package com.zero.campi 
{
	import com.adobe.utils.StringUtil;
	import com.greensock.loading.core.DisplayObjectLoader;
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.util.LayoutUtil;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiProductos extends CampiTramaContent 
	{
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
						
		function CampiProductos()
		{
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
			
			CampiSite.getApp().mcDroom.goTop();
		}
		
		private function show_zoom(e:Event):void 
		{
			CampiSite.getApp().mcDroom.goBottom();
			
			var minis:Array = DisplayUtil.getChildren( container );
			for (var i:int = 0; i < minis.length; i++) 
			{
				TweenLite.killTweensOf( minis[i], true );
				minis[i].makeMini();
			}
			TweenLite.to( container, 0.5, { x: 720 } );
			
			if ( lastZoom ) {
				DisplayUtil.remove( lastZoom.minis );
				lastZoom.hide();
			}
			
			actualZoom = new ProductoZoom();
			if( e.target is CollectionMiniBasic ){
				actualZoom.txtTitle.text = e.target.activeNode.@title.toUpperCase();
				actualZoom.txtDescription.htmlText = StringUtil.remove( e.target.activeNode, "\r" );	
			} else {
				actualZoom.txtTitle.text = e.target.data.product[0].@title.toUpperCase();
				actualZoom.txtDescription.htmlText = StringUtil.remove( e.target.data.product[0], "\r" );	
			}
			
			actualZoom.txtDescription.y = actualZoom.txtTitle.y + actualZoom.txtTitle.textHeight + 15;
			
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
			var collections:XMLList = products.collection;
			for each( var col:XML in collections ) {
				var btn:CollectionMini = new CollectionMini( col );
				container.addChild(btn);
				btn.visible = false;
			}
			LayoutUtil.layoutY(container, 10);
			
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