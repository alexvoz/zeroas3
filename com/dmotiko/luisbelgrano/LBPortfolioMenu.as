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
				
		public function LBPortfolioMenu() {
			super();
			visible = false;
			alpha = 0;
		}
		
		override public function show():void {
			visible = true;
			registerTween( "fadeIn", new Tween( this, "alpha", Regular.easeOut, 0, 1, 1.5, true), false, true);
		}
		
		override protected function tweenFinished( key:String, tween:Tween):void {
			if ( key == "fadeIn" ) showEnd();
			else if ( key == "subMenuFadeIn") removeSubMenu();
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
				registerTween( "subMenuFadeOut", new Tween( subMenu, "alpha", Regular.easeIn, subMenu.alpha, 0, 1.5, true), false, true);
			}
			var items = evnt.currentTarget.getActiveButton().getData().getItems();
			if (items && items.length > 1) {
				if ( subMenu ) {
					var t = getTween("subMenuFadeIn");
					if ( t ) { t.stop(); killTween(t); }
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
				registerTween( "subMenuFadeIn", new Tween( subMenu, "alpha", Regular.easeIn, subMenu.alpha, 1, 1.5, true), false, true);
			} else {
				this.activeItem = evnt.currentTarget.getActiveButton().getData() as LBPortfolioItemData;
				this.dispatchEvent( new Event( Event.CHANGE ) );
			}
		}
		private function subMenuChanged( evnt:Event):void {
			this.activeItem = evnt.currentTarget.getActiveButton().getData() as LBPortfolioItemData;
			this.dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		private function removeSubMenu( evnt = undefined ):void {
			removeChild(subMenu);
			subMenu = null;	
		}
		
		public function getActiveItem():LBPortfolioItemData {
			return this.activeItem;
		}
		
	}
	
}