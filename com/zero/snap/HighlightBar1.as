package com.zero.snap 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class HighlightBar1 extends MovieClip
	{
		
		public function HighlightBar1() 
		{
			gotoAndStop(3);
			
			Site.getApp().addEventListener( Site.HIGHLIGHT_SECTION, refresh_bar);
			
		}
		
		private function refresh_bar(e:SiteEvent):void {
			
			switch( e.section ) {
					
				case Site.PRODUCTION:
				gotoAndStop(3);
				break;
					
				case Site.HISTORY:
				gotoAndStop(4);
				break;
					
				default:
				gotoAndStop(2);
				break;
			}
		}
		
	}
	
}