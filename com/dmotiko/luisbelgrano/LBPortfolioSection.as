package com.dmotiko.luisbelgrano {
	
	import com.general.BaseClip;
	import com.general.BaseMenu;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class LBPortfolioSection
	extends BaseClip {
				
		private var activePhoto:LBPortfolioPhoto;
		private var activeItem:LBPortfolioItemData;
				
		private var mcMenu:LBPortfolioMenu;
		private var mcThumbs:LBPortfolioThumbs;
		private var mcInfo:LBPortfolioInfo;
		
		private var artesPlasticasInitY:Number;
					
		public function  LBPortfolioSection() {
			super();
			artesAplicadasBtn.visible = false;
			artesPlasticasBtn.visible = false;
			artesPlasticasInitY = artesPlasticasBtn.y;
			artesAplicadasBtn.addEventListener( MouseEvent.CLICK, drawMenu );
			artesAplicadasBtn.addEventListener( MouseEvent.CLICK, moveButton );
			artesPlasticasBtn.addEventListener( MouseEvent.CLICK, drawMenu );
			
		}
		
		private function moveButton(evnt):void {
			if( evnt.currentTarget == artesAplicadasBtn ){
				artesAplicadasBtn.removeEventListener( MouseEvent.CLICK, moveButton);
				artesPlasticasBtn.addEventListener( MouseEvent.CLICK, moveButton );
				registerTween("buttonMoveDown", new Tween( artesPlasticasBtn, "y", Regular.easeOut, artesPlasticasBtn.y, artesAplicadasBtn.y + 350, 1.5, true), false, true);
				
			} else if ( evnt.currentTarget == artesPlasticasBtn ) {
				artesAplicadasBtn.addEventListener( MouseEvent.CLICK, moveButton);
				artesPlasticasBtn.removeEventListener( MouseEvent.CLICK, moveButton );
				registerTween("buttonMoveUp", new Tween( artesPlasticasBtn, "y", Regular.easeOut, artesPlasticasBtn.y, artesPlasticasInitY, 1.5, true), false, true);
				
			}
			mcPhotoShower.hideContent();
		}
		private function drawMenu(evnt:Event):void {
			
			dispatchEvent( new Event( Event.CHANGE ) );
			
			if ( mcMenu && this.contains(mcMenu) ) {
				
				var tween:Tween;
				tween = new Tween(mcMenu, "alpha", Regular.easeOut, mcMenu.alpha, 0, 0.5, true);
				registerTween("menuFadeOut"+evnt.currentTarget.name, tween, false, true);
				tween = new Tween(mcThumbs, "alpha", Regular.easeOut, mcThumbs.alpha, 0, 0.5, true);
				registerTween("thumbsFadeOut", tween);
				tween = new Tween(mcInfo, "alpha", Regular.easeOut, mcInfo.alpha, 0, 0.5, true);
				registerTween("infoFadeOut", tween);
				
			} else {
			
				mcMenu = new LBPortfolioMenu();
				mcMenu.x = 771;
				this.addChild(mcMenu);
				
				mcThumbs = new LBPortfolioThumbs();
				mcThumbs.x = 771;
				//mcThumbs.y = 393;
				this.addChild(mcThumbs);
				
				mcInfo = new LBPortfolioInfo();
				mcInfo.x = 770;
				//mcInfo.y = 497;
				this.addChild(mcInfo);
				
				mcMenu.addEventListener( Event.CHANGE, menuChanged);
				mcThumbs.addEventListener( Event.CHANGE, thumbChanged);
				
				var aPortfolio:Array;
				( LBSite.getApp() ) ? aPortfolio = LBSite.getApp().getPortfolio() : aPortfolio = LBSite.dummyContent();
						
				if ( evnt.currentTarget == artesPlasticasBtn ) {
					mcMenu.y = 295;
					mcMenu.setData( aPortfolio[1].getItems() );
					mcMenu.show();
					
					
				} else if ( evnt.currentTarget == artesAplicadasBtn ) {
					mcMenu.y = 265;
					mcMenu.setData( aPortfolio[0].getItems() );
					mcMenu.show();
					
				}
				
			}
			
		}
		
		private function menuChanged(evnt:Event):void {
			var menu:LBPortfolioMenu = evnt.currentTarget as LBPortfolioMenu;
			var item:LBPortfolioItemData = ( menu.getActiveItem() as LBPortfolioItemData );
			activeItem = item;
			mcThumbs.setData( item.getPhotos() );
			mcThumbs.y = mcMenu.y + mcMenu.getSize().y + 20;
			mcInfo.y = mcThumbs.y + mcThumbs.getSize().y + 20;
			(mcThumbs as BaseMenu).getButtons()[0].rollOver( undefined );
			(mcThumbs as BaseMenu).getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			if( LBSite.getApp() ) LBSite.getApp().setSection( LBSite.PORTFOLIO+"_"+item.getLabel() );
		}
		
		private function thumbChanged( evnt:Event ):void {
			var menu:BaseMenu = evnt.currentTarget as BaseMenu;
			var photo:LBPortfolioPhoto = menu.getActiveButton().getData() as LBPortfolioPhoto;
			activePhoto = photo;
			mcInfo.setData( photo );
			mcPhotoShower.setData( photo );
			mcPhotoShower.addEventListener( LBPortfolioPhotoShower.SLIDER_NEXT, showNextPhoto);
			mcPhotoShower.addEventListener( LBPortfolioPhotoShower.SLIDER_PREV, showPrevPhoto);
			if (!mcInfo.getShowed()) mcInfo.show();
		}
		
		private function getPhotoIndex( photo:LBPortfolioPhoto ):int {
			for (var i:int = 0; i < activeItem.getPhotos().length; i++) {
				var photo2:LBPortfolioPhoto = activeItem.getPhotos()[i];
				if ( photo == photo2) {
					return i;
				}
			}
			return undefined;
		}
		
		private function showNextPhoto( evnt:Event ):void {
			var i:int = getPhotoIndex( activePhoto );
			if ( !(mcThumbs as BaseMenu).getButtons()[i + 1] ) i = -1;
			(mcThumbs as BaseMenu).getButtons()[i+1].rollOver( undefined );
			(mcThumbs as BaseMenu).getButtons()[i+1].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		private function showPrevPhoto( evnt:Event ):void {
			var i:int = getPhotoIndex( activePhoto );
			if ( i == 0 ) i = (mcThumbs as BaseMenu).getButtons().length;
			(mcThumbs as BaseMenu).getButtons()[i-1].rollOver( undefined );
			(mcThumbs as BaseMenu).getButtons()[i-1].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
				
		override public function childLoaded( evnt:Event ):void {
			if ( evnt.currentTarget == mcTitle) {
				if( !LBSite.getApp()) mcTitle.show();
				mcTitle.addEventListener( BaseClip.CLIP_SHOWED, childShowed );
			}
		}
		
		private function childShowed( evnt:Event ):void {
			if ( evnt.currentTarget == mcTitle ) {
				//mcMenu.show();
				artesAplicadasBtn.alpha = 0;
				artesAplicadasBtn.visible = true;
				registerTween( "artesAplicadasFadeIn", new Tween(artesAplicadasBtn, "alpha", Regular.easeOut, artesAplicadasBtn.alpha, 1, 1, true), false, true)
				
			}
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			if ( key == "artesAplicadasFadeIn" ) {
				artesPlasticasBtn.alpha = 0;
				artesPlasticasBtn.visible = true;
				registerTween( "artesPlasticasFadeIn", new Tween(artesPlasticasBtn, "alpha", Regular.easeOut, artesPlasticasBtn.alpha, 1, 1, true), false, true)
			} 
			else if (key.indexOf("menuFadeOut") > -1) {
				this.removeChild( mcMenu );
				this.removeChild( mcThumbs );
				this.removeChild( mcInfo );
				mcMenu = null;
				mcThumbs = null;
				mcInfo = null;
				if (key == "menuFadeOutartesPlasticasBtn") artesPlasticasBtn.dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
				else if (key == "menuFadeOutartesAplicadasBtn") artesAplicadasBtn.dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			}
			
		}
		
	}
	
}