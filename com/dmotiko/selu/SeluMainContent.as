package com.dmotiko.selu {
	import com.general.*;
	import com.util.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.utils.*;
	
	public class SeluMainContent
	extends BaseClip {
		
		private var homeSection:MovieClip;
		private var soundSection:MovieClip;
		private var coleccionSection:MovieClip;
		private var comprasSection:MovieClip;
		private var backstageSection:MovieClip;
		private var nocastingSection:SeluBotonera;
		private var puntosVentaSection:MovieClip;
		private var novedadesSection:MovieClip;
		private var sexiesSection:MovieClip;
		private var prensaSection:MovieClip;
		private var contactoSection:MovieClip;
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
						
			aSections = new Array();
			homeSection = this.getChildByName("mcHome") as MovieClip;
			aSections.push( homeSection );
			soundSection = this.getChildByName("mcSound") as MovieClip;
			aSections.push( soundSection );
			nocastingSection = this.getChildByName("mcNoCasting") as SeluBotonera;
			aSections.push( nocastingSection );
			comprasSection = this.getChildByName("mcCompras") as MovieClip;
			aSections.push( comprasSection );
			coleccionSection = this.getChildByName("mcColeccion") as MovieClip;
			aSections.push( coleccionSection );
			backstageSection = this.getChildByName("mcBackstage") as MovieClip;
			aSections.push( backstageSection );
			puntosVentaSection = this.getChildByName("mcPuntosVenta") as MovieClip;
			aSections.push( puntosVentaSection );
			novedadesSection = this.getChildByName("mcNovedades") as MovieClip;
			aSections.push( novedadesSection );
			sexiesSection = this.getChildByName("mcSexies") as MovieClip;
			aSections.push( sexiesSection );
			prensaSection = this.getChildByName("mcPrensa") as MovieClip;
			aSections.push( prensaSection );
			contactoSection = this.getChildByName("mcContacto") as MovieClip;
			aSections.push( contactoSection );
			
			aSections.forEach( function(item) { item.visible = false; }	);
						
			nSectionCount= 0;
			timerSections = new Timer(500);
			timerSections.addEventListener( TimerEvent.TIMER, nextSection );
			timerSections.dispatchEvent( new TimerEvent( TimerEvent.TIMER ) );
			timerSections.start();
			
			activeSection = homeSection;
					
						
			if (!SeluSite.getApp()) return;
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
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
			switch( SeluSite.getApp().getSection() ) {
				case SeluSite.HOME:
				tweenSection = homeSection;
				break;
				case SeluSite.COLECCION:
				tweenSection = coleccionSection;
				break;
				case SeluSite.BACKSTAGE:
				tweenSection = backstageSection;
				break;
				case SeluSite.PUNTOVENTA:
				tweenSection = puntosVentaSection;
				break;
				case SeluSite.NOVEDADES:
				tweenSection = novedadesSection;
				return;
				break;
				case SeluSite.PRENSA:
				tweenSection = prensaSection;
				return;
				break;
				case SeluSite.SEXIES:
				tweenSection = sexiesSection;
				break;
				case SeluSite.NOCASTING:
				tweenSection = nocastingSection;
				break;
				case SeluSite.CONTACTO:
				tweenSection = contactoSection;
				break;
			}
			
			if( tweenSection != nocastingSection){
				tween = new Tween( tweenSection, "y", Strong.easeOut, tweenSection.y, tweenSection.y-tweenSection.height, 0.4, true);
			} else {
				tween = new Tween( tweenSection, "y", Strong.easeOut, tweenSection.y, tweenSection.y + tweenSection.height, 0.4, true);
			}
			if (tweenSection != homeSection) {
				tween2 = new Tween( homeSection, "y", Strong.easeOut, homeSection.y, homeSection.y - homeSection.height, 0.4, true);
				tween2.addEventListener( TweenEvent.MOTION_FINISH, homeSectionMoveEnd);
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
			
			if (activeSection != nocastingSection) {
				setChildIndex( nocastingSection, getChildIndex( homeSection ) - 1 );
				nocastingSection.checkSection();
			}
			
		}
				
		private function homeSectionMoveEnd(e:TweenEvent):void {
			(e.currentTarget as Tween).yoyo();
			setChildIndex( soundSection, getChildIndex( activeSection ) - 1 );
			setChildIndex( homeSection, getChildIndex( activeSection ) - 1 );
			setChildIndex( comprasSection, getChildIndex( activeSection ) - 1 );
			(e.currentTarget as Tween).removeEventListener( TweenEvent.MOTION_FINISH, homeSectionMoveEnd);
		}
		
	}
	
}