package com.zero.campi 
{
	import com.general.WebSite;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class DroomLogo extends Sprite 
	{
		
		public function DroomLogo() 
		{
			CampiSite.getApp().addEventListener( WebSite.SECTION_CHANGED, check_section );
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OUT, btn_out );
			this.addEventListener(MouseEvent.ROLL_OVER, btn_over );
			this.addEventListener(MouseEvent.CLICK, goto_droom );
			
			var trigger:Shape = new Shape();
			trigger.graphics.beginFill(0, 0);
			trigger.graphics.drawRect(0, 0, width, height );
			addChild(trigger);
			
			addEventListener(Event.ADDED_TO_STAGE, bind );
		}
		
		private function bind(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, bind);
			stage.addEventListener( CampiProductos.ZOOM_IN, goBottom );
			stage.addEventListener( CampiProductos.ZOOM_OUT, goTop );
		}
		
		private function goto_droom(e:MouseEvent):void 
		{
			navigateToURL( new URLRequest("http://www.droomdiseno.com/"), "_blank" );
		}
		
		private function btn_out(e:MouseEvent):void 
		{
			TweenLite.to( this, 0.8, { alpha: 1, ease: Strong.easeInOut } );
		}
		
		private function btn_over(e:MouseEvent):void 
		{
			TweenLite.to( this, 0.8, { alpha: 0.7, ease: Strong.easeInOut } );
		}
				
		private function check_section(e:Event):void 
		{
			switch( CampiSite.getApp().getSection() ) {
				case CampiSite.NOSOTROS:
				goBottom();
				break;
				
				default:
				goTop();
			}
		}
		
		public function goTop(e:Event=null):void
		{
			TweenLite.to( this, 0.8, { y: 605, ease: Strong.easeInOut } );
		}
		
		public function goBottom(e:Event=null) {
			TweenLite.to( this, 0.8, { y: 630, ease: Strong.easeInOut } );
		}
		
	}

}