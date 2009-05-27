package com.dmotiko.seluteens {
	import com.general.*;
	import com.util.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.utils.*;
	
	public class SeluTeensMainContent
	extends BaseClip {
		
		public var mcHome:MovieClip;
		public var mcSound:MovieClip;
		public var mcColeccion:MovieClip;
		public var mcCompras:MovieClip;
		public var mcBackstage:MovieClip;
		public var mcNoCasting:SeluTeensBotonera;
		public var mcPuntosVenta:MovieClip;
		public var mcNovedades:MovieClip;
		public var mcSexies:MovieClip;
		public var mcPrensa:MovieClip;
		public var mcContacto:MovieClip;
		private var activeSection:MovieClip;
		private var aSections:Array;
		private var initPositions:Array;
		private var nSectionCount:Number;
		private var timerSections:Timer;
		private var tween2:Tween;
		private var tween:Tween;
							
		override protected function initClip():void {
			var nOffset = 700;
			initPositions = [ new Point( 0, -nOffset), new Point(nOffset, -nOffset), new Point(nOffset, 0), new Point( nOffset, nOffset), new Point(0, nOffset), new Point( -nOffset, nOffset), new Point( -nOffset, 0) ];
			initPositions.push( initPositions[0] );
			initPositions.push( initPositions[1] );
			initPositions.push( initPositions[2] );
			initPositions.push( initPositions[3] );
			initPositions = ArrayUtil.randomArray(initPositions);
			
			trace( mcHome );
			
			aSections = new Array();
			aSections.push( mcHome );
			aSections.push( mcSound );
			aSections.push( mcNoCasting );
			aSections.push( mcCompras );
			aSections.push( mcColeccion );
			aSections.push( mcBackstage );
			aSections.push( mcPuntosVenta );
			aSections.push( mcNovedades );
			aSections.push( mcSexies );
			aSections.push( mcPrensa );
			aSections.push( mcContacto );
			
			aSections.forEach( function(item) { item.visible = false; }	);
						
			nSectionCount= 0;
			timerSections = new Timer(500);
			timerSections.addEventListener( TimerEvent.TIMER, nextSection );
			timerSections.dispatchEvent( new TimerEvent( TimerEvent.TIMER ) );
			timerSections.start();
			
			activeSection = mcHome;
						
			if (!SeluTeensSite.getApp()) return;
			SeluTeensSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
		}
				
		private function nextSection(e:TimerEvent):void {
			var nSections = (nSectionCount == -1) ? 1 : 4;
			for (var i:int = 0; i < nSections; i++) {
				var theSection = aSections[nSectionCount];
				if (theSection) {
					var finalX = theSection.x;
					var finalY = theSection.y;
					var finalPoint:Point = initPositions[nSectionCount] as Point;
					theSection.x = finalPoint.x;
					theSection.y = finalPoint.y;
					theSection.visible = true;
					registerTween( theSection.name+"TweenX", new Tween( theSection, "x", Regular.easeOut, finalPoint.x, finalX, 0.6, true) );
					registerTween( theSection.name + "TweenY", new Tween( theSection, "y", Regular.easeOut, finalPoint.y, finalY, 0.6, true) );
					nSectionCount++;	
				} else {
					timerSections.removeEventListener( TimerEvent.TIMER, nextSection);
				}
			}
			
		}
		
		private function sectionChanged(e:Event):void {
			var tweenSection:MovieClip;			
			switch( SeluTeensSite.getApp().getSection() ) {
				case SeluTeensSite.HOME:
				tweenSection = mcHome;
				break;
				case SeluTeensSite.COLECCION:
				tweenSection = mcColeccion;
				break;
				case SeluTeensSite.BACKSTAGE:
				tweenSection = mcBackstage;
				break;
				case SeluTeensSite.PUNTOVENTA:
				tweenSection = mcPuntosVenta;
				break;
				case SeluTeensSite.NOVEDADES:
				tweenSection = mcNovedades;
				break;
				case SeluTeensSite.PRENSA:
				tweenSection = mcPrensa;
				break;
				case SeluTeensSite.SEXIES:
				tweenSection = mcSexies;
				break;
				case SeluTeensSite.NOCASTING:
				tweenSection = mcNoCasting;
				break;
				case SeluTeensSite.CONTACTO:
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
		
		private function activeSectionYoYoEnd(e:TweenEvent):void 
		{
			
			if (activeSection != mcNoCasting) {
				setChildIndex( mcNoCasting, getChildIndex( mcHome ) - 1 );
				mcNoCasting.checkSection();
			}
			
		}
				
		private function mcHomeMoveEnd(e:TweenEvent):void {
			(e.currentTarget as Tween).yoyo();
			setChildIndex( mcSound, getChildIndex( activeSection ) - 1 );
			setChildIndex( mcHome, getChildIndex( activeSection ) - 1 );
			setChildIndex( mcCompras, getChildIndex( activeSection ) - 1 );
			(e.currentTarget as Tween).removeEventListener( TweenEvent.MOTION_FINISH, mcHomeMoveEnd);
		}
		
	}
	
}