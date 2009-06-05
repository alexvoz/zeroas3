package com.dmotiko.seluteens.dummy {
	import com.general.*;
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class ComboList
	extends BaseClip {
		
		public var mcAdministracion:ComboItem;
		public var mcVentas:ComboItem;
		public var mcClientes:ComboItem;
		public var mcExportacion:ComboItem;
		public var mcPublicidad:ComboItem;
		public var mcClose:Sprite;
		
		protected var aItems:Array;
		
		override protected function initClip():void {
			aItems = new Array();
		}
		
		override public function childLoaded( e:Event ):void {
			if ( e.currentTarget is ComboItem ) {
				var child:ComboItem = e.currentTarget as ComboItem;
				aItems.push( child );
				
				child.alpha = 0;
				registerTween( child.name + "Fade", new Tween( child, "alpha", Regular.easeOut, child.alpha, 1, 0.5, true) );
				
				switch(child) {
					case mcAdministracion:
					child.setData( { label: "Administración", data: "administracion@seluteens.com.ar" } );
					break;
					
					case mcVentas:
					child.setData( { label: "Ventas", data: "ventas@seluteens.com.ar" } );
					break;
					
					case mcClientes:
					child.setData( { label: "Clientes", data: "clientes@seluteens.com.ar" } );
					break;
					
					case mcExportacion:
					child.setData( { label: "Exportaciones", data: "export@seluteens.com.ar" } );
					break;
					
					case mcPublicidad:
					child.setData( { label: "Publicidad", data: "publicidad@seluteens.com.ar" } );
					break;
				}
				
				child.addEventListener( MouseEvent.CLICK, child_changed );
			}
		}
		
		protected function child_changed(e:MouseEvent):void {
			this.setData( (e.currentTarget as ComboItem).getData() );
			aItems.forEach( function(item) {
				new Tween( item, "alpha", Regular.easeOut, item.alpha, 0, 0.3, true ); }
			);
			this.hide();
			dispatchEvent( new Event( Event.CHANGE ) ); 
		}
				
		override public function show():void {
			this.gotoAndPlay("show");
		}
		override protected function showEnd( evnt = undefined ): void {
			super.showEnd( evnt );
			mcClose.buttonMode = true;
			mcClose.addEventListener( MouseEvent.CLICK, function( e ) { 
				aItems.forEach( function(item) {
					new Tween( item, "alpha", Regular.easeOut, item.alpha, 0, 0.3, true ); }
				);
				hide() 
			} );
		}
		override public function hide():void {
			this.gotoAndPlay("hide");
		}
		
	}
	
}