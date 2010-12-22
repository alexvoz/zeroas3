package com.zero.campi 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
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
		
		public function CampiTramaContent() 
		{
			if( mcFoto ){
				trama = new CampiBitmapTrama( mcFoto );
				addChild( trama );
				removeChild( mcFoto );
				
				animation = TramaTransitionFactory.getInstance( trama );
				animation.addEventListener( TramaTransition.SHOW_END, animation_show_end );
				animation.addEventListener( TramaTransition.HIDE_END, animation_hide_end );
			}
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
			animation.hide();
		}
		
		protected function show_end():void {
			this.dispatchEvent( new Event( SHOW_END ) );
		}
		
		protected function hide_end():void {
			trace("CampiTramaContent hide_end");
			this.dispatchEvent( new Event( HIDE_END ) );
		}
		
	}

}