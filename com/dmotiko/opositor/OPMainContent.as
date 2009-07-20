package com.dmotiko.opositor {
	import com.general.*;
	import com.util.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.utils.*;
	
	public class OPMainContent
	extends BaseClip {
		
		//FLA Clips
		public var mcHome:MovieClip;
		public var mcSound:MovieClip;
		public var mcFolderBack:MovieClip;
		public var mcCollection:MovieClip;
		public var mcBackstage:MovieClip;
		public var mcPuntosVenta:MovieClip;
		public var mcContacto:MovieClip;
		//
		
		private var activeSection:MovieClip;
		private var tween2:Tween;
		private var tween:Tween;
		private var aSections:Array;
		private var initPositions:Array;
		private var nSectionCount:Number;
		private var timerSections:Timer;
							
		override protected function initClip():void {
			
			var nOffset = 700;
			initPositions = [ new Point( 0, nOffset*2), new Point(0, nOffset*2), new Point(0, -nOffset), new Point(0, -nOffset), new Point(0, -nOffset), new Point(0, -nOffset) ];
			initPositions.push( initPositions[0] );
			initPositions.push( initPositions[1] );
			initPositions.push( initPositions[2] );
			initPositions.push( initPositions[3] );
			//initPositions = ArrayUtil.randomArray(initPositions);
			
			aSections = new Array();
			aSections.push( mcHome );
			aSections.push( mcFolderBack );
			aSections.push( mcSound );
			aSections.push( mcBackstage );
			aSections.push( mcCollection );
			aSections.push( mcPuntosVenta );
			aSections.push( mcContacto );
			
			aSections.forEach( function(item) { item.visible = false; }	);
			
			nSectionCount= 0;
			timerSections = new Timer(200);
			timerSections.addEventListener( TimerEvent.TIMER, nextSection );
			timerSections.dispatchEvent( new TimerEvent( TimerEvent.TIMER ) );
			timerSections.start();
					
			activeSection = mcHome;
						
			if (!OPSite.getApp()) return;
			OPSite.getApp().addEventListener( WebSite.SECTION_CHANGED, sectionChanged);
			
		}
				
		private function nextSection(e:TimerEvent):void {
			var nSections = (nSectionCount == 0) ? 2 : 1;
			//OPSite.log("OPMainContent | nextSection | nSections= " + nSections);
			for (var i:int = 0; i < nSections; i++) {
				var theSection = aSections[nSectionCount];
				if (theSection) {
					var finalY = theSection.y;
					var finalPoint:Point = initPositions[nSectionCount] as Point;
					theSection.y = finalPoint.y;
					theSection.visible = true;
					registerTween( theSection.name + "TweenY", new Tween( theSection, "y", Strong.easeOut, finalPoint.y, finalY, 0.5, true) );
					nSectionCount++;	
				} else {
					timerSections.removeEventListener( TimerEvent.TIMER, nextSection);
				}
			}
		}
				
		private function sectionChanged(e:Event):void {
			//OPSite.log( "OPMainContent | sectionChanged= "+ OPSite.getApp().getSection() );
			var tweenSection:MovieClip;			
			switch( OPSite.getApp().getSection() ) {
				case OPSite.HOME:
				tweenSection = mcHome;
				break;
				case OPSite.BACKSTAGE:
				tweenSection = mcBackstage;
				break;
				case OPSite.COLECCION:
				tweenSection = mcCollection;
				break;
				case OPSite.PUNTOVENTA:
				tweenSection = mcPuntosVenta;
				break;
				case OPSite.CONTACTO:
				tweenSection = mcContacto;
				break;
			}
			
			if (tweenSection == mcHome) {
				tween = new Tween( tweenSection, "y", Strong.easeOut, tweenSection.y, tweenSection.y + tweenSection.height, 0.4, true);
				tween.addEventListener( TweenEvent.MOTION_FINISH, mcHomeMoveEnd);
				tween2 = new Tween( mcFolderBack, "y", Strong.easeOut, mcFolderBack.y, mcFolderBack.y + mcFolderBack.height, 0.4, true);
				tween2.addEventListener( TweenEvent.MOTION_FINISH, mcHomeMoveEnd);
				registerTween("backTween", tween2);
			} else {
				tween = new Tween( tweenSection, "y", Strong.easeOut, tweenSection.y, tweenSection.y - tweenSection.height, 0.4, true);
				tween.addEventListener( TweenEvent.MOTION_FINISH, activeSectionMoveEnd);
			}
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
			//OPSite.log("OPMainContent | activeSectionYoYoEnd");
		}
				
		private function mcHomeMoveEnd(e:TweenEvent):void {
			if ( (e.currentTarget as Tween).obj == mcHome ) {
				var old = activeSection;
				activeSection = (e.currentTarget as Tween).obj as MovieClip;
				setChildIndex( activeSection, getChildIndex( old ) );
			}
			(e.currentTarget as Tween).yoyo();
			(e.currentTarget as Tween).removeEventListener( TweenEvent.MOTION_FINISH, mcHomeMoveEnd);
		}
		
	}
	
}