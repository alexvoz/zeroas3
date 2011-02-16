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
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiProductos extends CampiTramaContent 
	{
		private var products:XML;
		private var container:Sprite;
		private var tweens:Vector.<TweenLite>;
				
		public var mcFotoGrande:MovieClip;
		private var fotoGrandeMask:Shape;
		private var animationZoom:TramaTransition;
		private var tramaZoom:CampiBitmapTrama;
		private var zoomLoader:Loader;
		private var lastContent:DisplayObject;
						
		function CampiProductos()
		{
			animationClass = TramaTransition;		
			
			super();
			//trace("new CampiProductos");
			var pedido:URLRequest = new URLRequest( "products.xml" );
			var loader:URLLoader = new URLLoader( pedido );
			loader.addEventListener(Event.COMPLETE, xml_loaded );
			
			container = new Sprite();
			addChild(container);
			
			container.x = 90;
			container.y = 35;
			
			removeChild( mcFotoGrande );
			
			mcFotoGrande.addEventListener(MouseEvent.CLICK, close_zoom );
			mcFotoGrande.txtTitle.wordWrap = true;
			mcFotoGrande.txtTitle.multiline = true;
			mcFotoGrande.txtTitle.autoSize = "left";
			
			container.addEventListener(MouseEvent.CLICK, show_zoom );
			zoomLoader = new Loader();
			zoomLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, make_trama_zoom );
		}
		
		private function make_trama_zoom(e:Event):void 
		{
			if ( lastContent ) mcFotoGrande.removeChild( lastContent );
			lastContent = zoomLoader.content;
						
			DisplayUtil.remove( tramaZoom );
			
			mcFotoGrande.addChild( zoomLoader.content );
			
			tramaZoom = new CampiBitmapTrama( mcFotoGrande, 5, Math.ceil( mcFotoGrande.width / 90 ) );
			animationZoom = new TramaTransition7( tramaZoom, false );
			animationZoom.addEventListener( CampiTramaContent.SHOW_END, replace_effect, false, 0, true );
			animationZoom.addEventListener( CampiTramaContent.HIDE_END, remove_effect, false, 0, true );
			
			addChild( tramaZoom );
			addChild( container );
			animationZoom.show();
		}
		
		private function close_zoom(e:MouseEvent):void 
		{
			if( mcFotoGrande.getChildByName("minis") ){
				mcFotoGrande.removeChild( mcFotoGrande.getChildByName("minis") );
			}
			removeChild(mcFotoGrande);
			addChild(tramaZoom);
			animationZoom.hide();
			
		}
		
		private function show_zoom(e:MouseEvent):void 
		{
			var minis:Array = DisplayUtil.getChildren( container );
			for (var i:int = 0; i < minis.length; i++) 
			{
				TweenLite.killTweensOf( minis[i], true );
				minis[i].makeMini();
			}
			TweenLite.to( container, 0.5, { x: 720 } );
			
			DisplayUtil.remove( mcFotoGrande );
			
			var zoomReq:URLRequest = new URLRequest( e.target.data.@imgPath + e.target.data.product[0].@src );
			zoomLoader.load( zoomReq );
			
			mcFotoGrande.txtTitle.text = e.target.data.product[0].@title.toUpperCase();
			mcFotoGrande.txtDescription.y = mcFotoGrande.txtTitle.y + mcFotoGrande.txtTitle.textHeight + 15;
			mcFotoGrande.txtDescription.htmlText = StringUtil.remove( e.target.data.product[0], "\r" );
			
			if( mcFotoGrande.getChildByName("minis") ){
				mcFotoGrande.removeChild( mcFotoGrande.getChildByName("minis") );
			}
			if( e.target.data.product.length() > 1 ){
				var mcMinis:CollectionMiniBasic = new CollectionMiniBasic( e.target.data );
				mcMinis.name = "minis";
				mcMinis.addEventListener(Event.CHANGE, update_zoom );
				mcMinis.x = mcFotoGrande["txtTitle"].x;
				mcMinis.y = mcFotoGrande["txtDescription"].y + mcFotoGrande["txtDescription"].height;
				mcFotoGrande.addChild( mcMinis );
			}
		}
		
		private function update_zoom(e:Event):void 
		{
			DisplayUtil.remove( mcFotoGrande );
						
			var zoomReq:URLRequest = new URLRequest( e.target.data.@imgPath + e.currentTarget.activeNode.@src );
			zoomLoader.load( zoomReq );
			mcFotoGrande.txtTitle.text = e.currentTarget.activeNode.@title.toUpperCase();
			mcFotoGrande.txtDescription.y = mcFotoGrande.txtTitle.y + mcFotoGrande.txtTitle.textHeight + 15;
			mcFotoGrande.txtDescription.htmlText = StringUtil.remove( e.currentTarget.activeNode, "\r" );
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
			DisplayUtil.remove( (e.currentTarget as TramaTransition).getTrama() );
			addChild(mcFotoGrande);
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
			//tweens[0].vars.onComplete = show_end;
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