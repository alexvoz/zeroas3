package com.dmotiko.seluteens {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class SeluTeensComprasOnline
	extends BaseClip {
		
		override protected function initClip():void {
			visible = false;
			alpha = 0;
			if ( SeluTeensSite.getApp() ) {
				SeluTeensSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			}
		}
		
		private function section_changed(e:Event):void {
			var tX:Tween;
			var tY:Tween;
			var p:Point;
			visible = false;
			alpha = 0;
			switch( SeluTeensSite.getApp().getSection() ) {
				case SeluTeensSite.HOME:
				p = new Point( 47, 320);
				break;
				
				case SeluTeensSite.COLECCION:
				p = new Point( 12, 470);
				break;
				
				case SeluTeensSite.BACKSTAGE:
				p = new Point( 47, 320);
				break;
				
				case SeluTeensSite.PUNTOVENTA:
				p = new Point( 75, 445);
				visible = true;
				alpha = 1;
				break;
				
				case SeluTeensSite.NOVEDADES:
				p = new Point( 463, 323);
				break;
				
				case SeluTeensSite.SEXIES:
				p = new Point( 12, 457);
				break;
				
				case SeluTeensSite.PRENSA:
				p = new Point( 12, 470);
				break;
				
				case SeluTeensSite.CONTACTO:
				p = new Point( 12, 470);
				break;
				
				case SeluTeensSite.NOCASTING:
				p = new Point(47, 320);
				break;
				
			}
			//this.killTween("moveClipX");
			tX = new Tween( this, "x", Regular.easeOut, this.x, p.x, 0.5, true);
			//this.killTween("moveClipY");
			tY = new Tween( this, "y", Regular.easeOut, this.y, p.y, 0.5, true);
			//this.registerTween( "moveClipX", tX );
			//this.registerTween( "moveClipY", tY );			
		}
		
	}
	
}