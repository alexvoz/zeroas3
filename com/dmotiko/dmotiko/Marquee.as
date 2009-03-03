package com.dmotiko.dmotiko {
	
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	public class Marquee
	extends BaseClip {
		
		private var background:Sprite;
		private var classModule:Class; // the class
		private var aModules:Array;
		private var nModule:Number;
		private var tModules:Timer;
		private var spMask:Sprite;
		private var spContent:Sprite;
						
		function Marquee() {
			aModules = new Array();
			
			//dibujo y adopto al fondo
			background = new palabra();
			background.cacheAsBitmap = true;
			this.addChild(background);
			
			//dibujo y adopto al contenido de la grilla
			spContent = new Sprite();
			this.addChild(spContent);
			
			//dibujo y adopto a la mascara
			spMask = new Sprite();
			spMask.cacheAsBitmap = true;
			this.addChild(spMask);
			
			background.mask = spMask;
			
			setModule( MarqueeItem );
			setSize( new Point( 70, 17 ) );
			drawGrid();
			
		}	
				
		public function drawGrid():void {
			var nX:Number = 0;
			var nY:Number = 0;
			for (var i:int = 0; i < pSize.x * pSize.y; i++) {
				var clip:Sprite = new classModule() as Sprite;
				if ( i != 0 && i % pSize.y == 0) {
					nX += clip.width;
					nY = 0;
				}
				clip.x = nX;
				clip.y = nY;
				nY += clip.height;
				spContent.addChild(clip);
				
				var clipMask:MarqueeMask = new MarqueeMask();
				clipMask.x = clip.x;
				clipMask.y = clip.y;
				clipMask.alpha = 0;
				aModules.push( clipMask );
				spMask.addChild(clipMask);
			}
		}
		
		override public function show():void {
			randomModules();			
			nModule = 0;
			tModules = new Timer(40);
			tModules.addEventListener(TimerEvent.TIMER, showModule);
			tModules.start();
			
		}
		
		private function randomModules():void {
			aModules.sort( function(a, b){
				var max = 1;
				var min = -1;
				var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
				return randomNum;
			});
		}
		
		private function showModule(e:TimerEvent):void {
			if (nModule == aModules.length) {
				tModules.stop();
				this.showEnd();
				return;
			}
			var nTime:Number = 0.05;
			for ( var i:Number = 0; i < 150; i ++ ){
				if (!aModules[nModule]) {
					this.showEnd();
					break;
				}
				aModules[nModule].alpha = 1;
				nModule++;
			}
			
		}
		override public function hide():void {
			this.randomModules();
			nModule = 0;
			tModules = new Timer(40);
			tModules.addEventListener(TimerEvent.TIMER, hideModule);
			tModules.start();
		}
		
		private function hideModule(e:TimerEvent):void {
			if (nModule == aModules.length) {
				tModules.stop();
				this.hideEnd();
				return;
			}
			var nTime:Number = 0.05;
			for ( var i:Number = 0; i < 70; i ++ ){
				if (!aModules[nModule]) {
					this.hideEnd();
					break;
				}
				aModules[nModule].alpha = 0;
				nModule++;
			}
		}
				
		public function getModule():Class { return classModule; }
		
		public function setModule(value:Class):void 
		{
			classModule = value;
		}
		
	}
	
}