package com.dmotiko.luisbelgrano {
	import com.general.BaseClip;
	
	public class LBPortfolioPhoto {
		
		public static var PHOTO_WIDE:String = "photo_wide";
		public static var PHOTO_SQUARE:String = "photo_square";
		public static var PHOTO_VERTICAL:String = "photo_vertical";
		public static var PHOTO_TRANSPARENT:String = "photo_transparent";
		
		private var id:String;
		private var title:String;
		private var description:String;
		private var icon:String; //URL
		private var src:String; //URL
		private var zoomSrc:String; //URL
		private var type:String;
				
		public function LBPortfolioPhoto(id:String=undefined, title:String=undefined, desc:String=undefined, icon:String=undefined, src:String=undefined, zoomSrc:String=undefined, type:String="photo_wide") {
			setID(id);
			setTitle(title);
			setDescription(desc);
			setIcon(icon);
			setSrc(src);
			setZoomSrc(zoomSrc);
			setType(type);
		}
		
		public function getID():String { return this.id; }
		public function getTitle():String { return this.title; }
		public function getDescription():String { return this.description; }
		public function getIcon():String { return this.icon; }
		public function getSrc():String { return this.src; }
		public function getZoomSrc():String { return this.zoomSrc; }
		public function getType():String { return this.type; }
		
		
		public function setID(value:String):void {
			this.id = value;
		}
		public function setTitle(value:String):void {
			this.title = value;
		}
		public function setDescription(value:String):void {
			this.description = value;
		}
		public function setIcon(value:String):void {
			this.icon = value;
		}
		public function setSrc(value:String):void {
			this.src = value;
		}
		public function setZoomSrc(value:String):void {
			this.zoomSrc = value;
		}
		public function setType( value:String):void {
			this.type = value;
		}

	}
	
}