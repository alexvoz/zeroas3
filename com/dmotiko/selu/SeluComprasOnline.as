package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class SeluComprasOnline
	extends BaseClip {
		
		override protected function initClip():void {
			visible = false;
			alpha = 0;
			if ( SeluSite.getApp() ) {
				SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			}
		}
		
		private function section_changed(e:Event):void {
			var tX:Tween;
			var tY:Tween;
			var p:Point;
			visible = false;
			alpha = 0;
			switch( SeluSite.getApp().getSection() ) {
				case SeluSite.HOME:
				p = new Point( 47, 320);
				break;
				
				case SeluSite.COLECCION:
				p = new Point( 12, 470);
				break;
				
				case SeluSite.BACKSTAGE:
				p = new Point( 47, 320);
				break;
				
				case SeluSite.PUNTOVENTA:
				p = new Point( 75, 445);
				//visible = true;
				//alpha = 1;
				break;
				
				case SeluSite.NOVEDADES:
				p = new Point( 463, 323);
				break;
				
				case SeluSite.SEXIES:
				p = new Point( 12, 457);
				break;
				
				case SeluSite.PRENSA:
				p = new Point( 12, 470);
				break;
				
				case SeluSite.CONTACTO:
				p = new Point( 12, 470);
				break;
				
				case SeluSite.NOCASTING:
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