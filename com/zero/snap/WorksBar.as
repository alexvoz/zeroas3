package com.zero.snap 
{
	import com.general.BaseClip;
	import com.general.WebSite;
	import com.zero.snap.*
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class WorksBar 
	extends BaseClip
	{
		
		public var mcClose:Sprite;
		public var txtTitle:TextField;
		public var txtType:TextField;
		public var txtFrequency:TextField;
		public var txtDuration:TextField;
		
		override protected function initClip():void {
			
			mcClose.buttonMode = true;
			mcClose.addEventListener( MouseEvent.CLICK, function(e) { Site.getApp().setSection( Site.HOME ) } );
			parent.addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			txtTitle.text = txtType.text = txtFrequency.text = txtDuration.text = "";
			
			var xmlData:XML = <root>
				<item src='dvdbox.jpg' href='h90.flv' tooltip='ver trailer\nde h90' title='h90' type='reality' freq='semanal' dur='20x5' />
				<item src='dvdbox2.jpg' href='trailer_101.f4v' tooltip='ver trailer\nde101' title='101' type='reality' freq='semanal' dur='20x5' />
			</root>
			
			setData( xmlData.item );
		}
		
		private function section_changed(e:Event):void 
		{
			switch( Site.getApp().getSection() ) {
				case Site.WORKS:
				case Site.REEL:
				show();
				break;
				
				default:
				hide();
				break;
			}
		}
		
		override public function show():void {
			registerTween("moveY", new Tween( this, "y", Regular.easeOut, this.y, 600 - getBounds(parent).height, 0.5, true), false, true );
		}
		
		override public function hide():void {
			registerTween("moveY", new Tween( this, "y", Regular.easeOut, this.y, 700, 0.5, true), false, true );
		}
		
		override protected function showEnd(evnt=undefined):void {
			super.showEnd(undefined);
			getChildByName( "thumb0" ).dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
		}
		override protected function hideEnd(evnt=undefined):void {
			super.hideEnd(undefined);
			
		}
		
		override protected function refreshData():void {
			var nX:int = 40;
			var nThumb:int = 0;
			for each(var item in data) 
			{
				var thumb:TrailerThumb = new TrailerThumb();
				thumb.name = "thumb"+nThumb;
				nThumb++;
				thumb.setData( item );
				thumb.addEventListener( MouseEvent.CLICK, thumb_click);
				thumb.x = nX;
				addChild(thumb);
				nX += 100;
			}
		}
		
		private function thumb_click(e:MouseEvent):void 
		{
			var oData = (e.currentTarget as BaseClip).getData();
			Site.getApp().setVideo( oData.@href );
			txtTitle.text = oData.@title.toUpperCase();
			txtType.text = oData.@type;
			txtFrequency.text = oData.@freq;
			txtDuration.text = oData.@dur;
		}
		
		override protected function tweenFinished(key:String, tween:Tween):void {
			if ( this.y < 600 ) {
				showEnd();
			} else {
				hideEnd();
			}
		}
		
	}
	
}