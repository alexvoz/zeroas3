package com.dmotiko.seluteens {
	import com.general.*;
	import com.util.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.utils.*;
	
	public class STMainContent
	extends BaseClip {
		
		//FLA Clips
		public var mcHome:MovieClip;
		public var mcSound:MovieClip;
		public var mcCollection:MovieClip;
		public var mcCompras:MovieClip;
		public var mcNoCasting:STBotonera;
		public var mcPuntosVenta:MovieClip;
		public var mcNovedades:MovieClip;
		public var mcPrensa:MovieClip;
		public var mcContacto:MovieClip;
		//
		
		private var activeSection:MovieClip;
		private var tween2:Tween;
		private var tween:Tween;
							
		override protected function initClip():void {
			
			STSite.log( "STMainContent | initClip");
					
			activeSection = mcHome;
			
			if (!STSite.getApp()) return;
			STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
			
		}
				
		private function sectionChanged(e:Event):void {
			var tweenSection:MovieClip;			
			switch( STSite.getApp().getSection() ) {
				case STSite.HOME:
				tweenSection = mcHome;
				break;
				case STSite.COLECCION:
				tweenSection = mcCollection;
				break;
				case STSite.PUNTOVENTA:
				tweenSection = mcPuntosVenta;
				break;
				case STSite.NOVEDADES:
				tweenSection = mcNovedades;
				break;
				case STSite.PRENSA:
				tweenSection = mcPrensa;
				break;
				case STSite.NOCASTING:
				tweenSection = mcNoCasting;
				break;
				case STSite.CONTACTO:
				tweenSection = mcContacto;
				break;
			}
			
			if( tweenSection != mcNoCasting){
				tween = new Tween( tweenSection, "y", Strong.easeOut, tweenSection.y, tweenSection.y-tweenSection.height, 0.4, true);
			} else {
				tween = new Tween( tweenSection, "y", Strong.easeOut, tweenSection.y, tweenSection.y + tweenSection.height, 0.4, true);
			}
			if (tweenSection != mcHome) {
				tween2 = new Tween( mcHome, "y", Strong.easeOut, mcHome.y, mcHome.y - mcHome.height, 0.4, true);
				tween2.addEventListener( TweenEvent.MOTION_FINISH, mcHomeMoveEnd);
			}
			tween.addEventListener( TweenEvent.MOTION_FINISH, activeSectionMoveEnd);
			var sKey:String = "actionSectionMove";
			var nKey:Number = 0;
			while ( getTween("actionSectionMove" + nKey) ) {
				nKey++;
			}
			registerTween("activeSectionMove"+nKey, tween);
		}
				
		private function activeSectionMoveEnd(e:TweenEvent):void {
			var old = activeSection;
			activeSection = (e.currentTarget as Tween).obj as MovieClip;
			setChildIndex( activeSection, getChildIndex( old ) );
			(e.currentTarget as Tween).yoyo();
			(e.currentTarget as Tween).removeEventListener( TweenEvent.MOTION_FINISH, activeSectionMoveEnd);
			(e.currentTarget as Tween).addEventListener( TweenEvent.MOTION_FINISH, activeSectionYoYoEnd);
			
		}
		
		private function activeSectionYoYoEnd(e:TweenEvent):void {
			STSite.log( "STMainContent | activeSectionYoYoEnd ");
			if (activeSection != mcNoCasting) {
				setChildIndex( mcNoCasting, getChildIndex( mcHome ) - 1 );
				//mcNoCasting.checkSection();
			}
			
		}
				
		private function mcHomeMoveEnd(e:TweenEvent):void {
			(e.currentTarget as Tween).yoyo();
			//setChildIndex( mcSound, getChildIndex( activeSection ) - 1 );
			//setChildIndex( mcHome, getChildIndex( activeSection ) - 1 );
			//setChildIndex( mcCompras, getChildIndex( activeSection ) - 1 );
			(e.currentTarget as Tween).removeEventListener( TweenEvent.MOTION_FINISH, mcHomeMoveEnd);
		}
		
	}
	
}