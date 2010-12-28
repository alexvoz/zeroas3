package com.zero.campi 
{
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiTramaContent extends MovieClip 
	{
		
		public static const SHOW_END:String = "show_end";
		public static const HIDE_END:String = "hide_end";
		
		public var mcFoto:Sprite;
		protected var trama:CampiBitmapTrama;
		protected var animation:TramaTransition;
		protected var back:Shape;
		
		public function CampiTramaContent() 
		{
			
			//trace("new CampiTramaContent");
			if( mcFoto ){
				trama = new CampiBitmapTrama( mcFoto );
				addChild( trama );
				removeChild( mcFoto );
								
				animation = TramaTransitionFactory.getInstance( trama );
				animation.addEventListener( TramaTransition.SHOW_END, animation_show_end );
				animation.addEventListener( TramaTransition.SHOW_END, mostrar_fondo );
				animation.addEventListener( TramaTransition.HIDE_END, animation_hide_end );
				
			} else {
				
			}
			back = new Shape();
			back.graphics.beginFill(0, 1);
			back.graphics.drawRect(0, 0, 90*9, 5*120 );					
			back.filters = [ new DropShadowFilter(5, 45, 0, 1, 10, 10, 0.7, 3) ];
			
		}
		
		private function mostrar_fondo(e:Event):void 
		{
			addChildAt(back, 0);
			TweenLite.from(back, 0.5, { alpha: 0 } );
		}
		
		protected function animation_hide_end(e:Event):void 
		{
			hide_end();
		}
		
		protected function animation_show_end(e:Event):void 
		{
			show_end();
		}
		
		public function show():void {
			
		}
		public function hide():void {
			TweenLite.to(back, 0.5, { alpha: 0 } );
			animation.hide();
		}
		
		protected function show_end():void {
			trace("CampiTramaContent show_end");
			this.dispatchEvent( new Event( SHOW_END, true ) );
		}
		
		protected function hide_end():void {
			trace("CampiTramaContent hide_end");
			this.dispatchEvent( new Event( HIDE_END, true ) );
		}
		
	}

}