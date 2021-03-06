﻿package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.Tween;
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.Timer;
	
	public class NavBar
	extends BaseMenu {
		
		private var nBtn:int; //para mostrar con tweens
		private var timerBtns:Timer;
		private var mcHome:Sprite;
		private var mcCarrito:Sprite;
		private var mcLang:LangBtn;
		private var sContainer:Sprite;
				
		override protected function initClip():void {
			
			mcHome = new HomeBtn();
			mcHome.visible = false;
			this.addChild(mcHome);
			
			
			mcLang = new LangBtn();
			mcLang.x = 1000 - mcLang.width - 50;
			mcLang.visible = false;
			this.addChild(mcLang);
			
			mcCarrito = new CarritoBtn();
			mcCarrito.x = mcLang.x - mcCarrito.width - 10;
			mcCarrito.visible = false;
			this.addChild(mcCarrito);
			
			bVertical = false;
			nBtn = 0;
			nOffset = mcHome.width - 13;
			nSpace = -13;
			
		}
		
		override protected function layout():void {
			if ( sContainer && this.contains( sContainer ) ) removeChild(sContainer);
			sContainer = new Sprite();
			addChild(sContainer);
			nOffset = mcHome.width - 13;
			nBtn = 0;
						
			for (var i:uint = 0; i < aBtns.length; i++){
				var item:BaseMenuBtn = aBtns[i];
				item.x = nOffset;
				item.visible = false;
				if (i == aBtns.length - 1) (item as NavBarBtn).mcShadow.visible = false;
				nOffset += item.width + nSpace;
				sContainer.addChild(item);
				sContainer.setChildIndex(item, 0);
				if ( Site.getApp().getSection().indexOf(item.getData().value) > -1 ) {
					item.rollOver(undefined);
					this.setActiveButton(item);
				}
			}
			setChildIndex( mcHome, numChildren - 1);
			
			mcHome.visible = true;
			registerTween("btnHomeAppear", new Tween( mcHome, "y", Elastic.easeOut, - mcHome.height, 0, 2, true));
									
			timerBtns = new Timer( 500 );
			timerBtns.addEventListener( TimerEvent.TIMER, showNextBtn);
			timerBtns.start();
			
		}
		
		private function showNextBtn( e:TimerEvent ):void	{
			if ( timerBtns.delay > 100 ) timerBtns.delay = 200;
			var theBtn:BaseMenuBtn = aBtns[nBtn];
			if(theBtn){
				theBtn.visible = true;
				registerTween("showBtn" + nBtn, new Tween( theBtn, "x", Elastic.easeOut, theBtn.x - 30, theBtn.x, 1.5, true));
				nBtn++;
			} else {
				timerBtns.stop();
				if( !mcLang.visible ){
					mcLang.visible = true;
					registerTween("btnLangAppear", new Tween( mcLang, "y", Elastic.easeOut, - 40, 0, 1.5, true));
				}
				
				if( !mcCarrito.visible ){
					mcCarrito.visible = true;
					registerTween("btnCarritoAppear", new Tween( mcCarrito, "y", Elastic.easeOut, - 40, 15, 1.5, true));
				}
				
				this.dispatchEvent( new Event( Event.COMPLETE ) );
			}
		}
		
	}
	
}