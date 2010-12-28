package com.zero.campi 
{
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.util.LayoutUtil;
	import flash.display.DisplayObject;
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
				
		public var mcFotoGrande:Sprite;
		private var fotoGrandeMask:Shape;
		private var animationZoom:TramaTransition;
		private var tramaZoom:CampiBitmapTrama;
				
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
			container.y = 120;
			
			removeChild( mcFotoGrande );
			
			/*
			fotoGrandeMask = new Shape();
			fotoGrandeMask.graphics.beginFill(0xFFFF00);
			fotoGrandeMask.graphics.drawRect(0, 0, mcFotoGrande.width, mcFotoGrande.height );
			fotoGrandeMask.graphics.endFill();
			fotoGrandeMask.scaleX = 0;
			addChild(fotoGrandeMask);
			
			mcFotoGrande.mask = fotoGrandeMask;
			*/
			mcFotoGrande.addEventListener(MouseEvent.CLICK, close_zoom );
			
			//mcFotoGrande.x = fotoGrandeMask.x = 270;
			
			container.addEventListener(MouseEvent.CLICK, show_zoom );
			
			tramaZoom = new CampiBitmapTrama( mcFotoGrande, 5, Math.ceil( mcFotoGrande.width / 90 ) );
			animationZoom = new TramaTransition7( tramaZoom, false );
			animationZoom.addEventListener( CampiTramaContent.SHOW_END, replace_effect );
			animationZoom.addEventListener( CampiTramaContent.HIDE_END, remove_effect );
		}
		
		private function close_zoom(e:MouseEvent):void 
		{
			removeChild(mcFotoGrande);
			addChild(tramaZoom);
			animationZoom.hide();
			//TweenLite.to( fotoGrandeMask, 0.8, { scaleX: 0 } );
					
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
			
			//mcFotoGrande.mask = null;
			//addChild( mcFotoGrande );
			//TweenLite.to( fotoGrandeMask, 0.8, { scaleX: 1 } );
			
			addChild( tramaZoom );
			addChild( container );
			animationZoom.show();
		}
		
		private function remove_effect(e:Event):void 
		{
			removeChild( tramaZoom );
			
			var minis:Array = DisplayUtil.getChildren( container );
			for (var i:int = 0; i < minis.length; i++) 
			{
				minis[i].makeNormal();
			}
			TweenLite.to( container, 0.5, { x: 180 } );
		}
		
		private function replace_effect(e:Event):void 
		{
			removeChild( (e.currentTarget as TramaTransition).getTrama() );
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