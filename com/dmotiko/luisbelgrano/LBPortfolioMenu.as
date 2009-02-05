package com.dmotiko.luisbelgrano {
	import FLA.*
	import com.general.*;
	import flash.events.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
			
	public class LBPortfolioMenu
	extends BaseClip {
		
		private var menu:BaseMenu;
		private var subMenu:BaseMenu;
		private var activeItem:LBPortfolioItemData;
		private var alphaTween:Tween;
		private var subMenuTween:Tween;
		
		public function LBPortfolioMenu() {
			super();
			visible = false;
			alpha = 0;
			if( LBSite.getApp() ){
				this.setData( LBSite.getApp().getPortfolio() );
			} else {
				this.setData( LBSite.dummyContent() );
			}
		}
		
		override public function show():void {
			visible = true;
			alphaTween = new Tween( this, "alpha", Regular.easeOut, 0, 1, 1.5, true);
			alphaTween.addEventListener( TweenEvent.MOTION_FINISH, showEnd );
		}
		
		override protected function showEnd( evnt=undefined ):void {
			super.showEnd();
			menu.getButtons()[0].rollOver( undefined );
			menu.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		
		override protected function refreshData():void {
			menu = new BaseMenu();
			menu.setView( PortfolioBtn );
			menu.setSpace( -2.3);
			menu.setData( getData() );
			menu.addEventListener( Event.CHANGE, menuChanged);
			this.addChild(menu);
		}
		
		private function menuChanged( evnt:Event):void {
			if( subMenu ){
				subMenuTween = new Tween( subMenu, "alpha", Regular.easeIn, subMenu.alpha, 0, 1.5, true);
				subMenuTween.addEventListener( TweenEvent.MOTION_FINISH, removeSubMenu);
			}
			var items = evnt.currentTarget.getActiveButton().getData().getItems();
			if (items && items.length > 1) {
				if ( subMenu ) {
					if ( subMenuTween ) { subMenuTween.stop(); subMenuTween = null; }
					removeSubMenu( undefined );	
				}				
				subMenu = new BaseMenu();
				subMenu.setSpace( -3);
				subMenu.setView( PortfolioSubBtn );
				subMenu.setData( items );
				subMenu.x = 95;
				subMenu.addEventListener( MouseEvent.CLICK, subMenuChanged );
				subMenu.alpha = 0;				
				this.addChild(subMenu);
				subMenu.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
				(subMenu.getButtons()[0] as LBMenuBtn).rollOver(undefined);
				subMenuTween = new Tween( subMenu, "alpha", Regular.easeIn, subMenu.alpha, 1, 1.5, true);
			} else {
				this.activeItem = evnt.currentTarget.getActiveButton().getData() as LBPortfolioItemData;
				this.dispatchEvent( new Event( Event.CHANGE ) );
			}
		}
		private function subMenuChanged( evnt:Event):void {
			this.activeItem = evnt.currentTarget.getActiveButton().getData() as LBPortfolioItemData;
			this.dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		private function removeSubMenu( evnt ):void {
			removeChild(subMenu);
			subMenu = null;	
		}
		
		public function getActiveItem():LBPortfolioItemData {
			return this.activeItem;
		}
		
	}
	
}