package com.dmotiko.opositor {
	
	import flash.display.*;
	import flash.events.*
	import com.general.*
			
	public class OPContactoMenu
	extends BaseMenu {
		
		override protected function initClip():void {
			super.initClip();
			
			setView( OPContactoButton );
			
			var aData:Array = new Array();
			aData.push( { label: "administración", data: "administracion@opositor.com.ar" } );
			aData.push( { label: "ventas", data: "ventas@opositor.com.ar" } );
			aData.push( { label: "clientes", data: "clientes@opositor.com.ar" } );
			aData.push( { label: "exportaciones", data: "exportaciones@opositor.com.ar" } );
			aData.push( { label: "publicidad", data: "publicidad@opositor.com.ar" } );
			setData( aData );
		}
		
		override protected function refreshData():void {
			aBtns = new Array();
			for each(var nodo in data){
				var item:BaseMenuBtn = new view();
				item.setData( nodo );
				item.addEventListener( MouseEvent.CLICK, activeBtn );
				aBtns.push(item);
			}
			layout();
		}
		
		override protected function layout():void {
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				if (bVertical) {
					item.y = nOffset;
					nOffset += item.height ;
				}
				this.addChild(item);	
				
			}
			this.dispatchEvent( new Event( Event.COMPLETE ) );
			aBtns[0].rollOver(undefined);
			(aBtns[0] as BaseMenuBtn).dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			OPSite.log("OPContactoMenu | layout end");
		}
		
		
	}
	
}