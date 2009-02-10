package com.dmotiko.luisbelgrano {
	
	import com.general.BaseClip;
	import com.general.BaseMenu;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class LBPortfolioSection
	extends BaseClip {
				
		private var activePhoto:LBPortfolioPhoto;
		private var activeItem:LBPortfolioItemData;
					
		public function  LBPortfolioSection() {
			super();
			artesAplicadasBtn.visible = false;
			artesPlasticasBtn.visible = false;
			mcMenu.addEventListener( Event.CHANGE, menuChanged);
			mcThumbs.addEventListener( Event.CHANGE, thumbChanged);
		}
		
		private function menuChanged(evnt:Event):void {
			var menu:LBPortfolioMenu = evnt.currentTarget as LBPortfolioMenu;
			var item:LBPortfolioItemData = ( menu.getActiveItem() as LBPortfolioItemData );
			activeItem = item;
			mcThumbs.setData( item.getPhotos() );
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
			if ( i == 0 ) i = (mcThumbs as BaseMenu).getButtons().length + 1;
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
			}
		}
		
	}
	
}