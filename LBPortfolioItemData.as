package com.dmotiko.luisbelgrano {
	import com.general.BaseClip;
	
	public class LBPortfolioItemData {
		
		private var id:String;
		private var label:String;
		private var aPhotos:Array; //de LBPortfolioPhoto
		private var aItems:Array; //de LBPortfolioItemData
		
		public function LBPortfolioItemData(id:String=undefined, label:String=undefined, aPhotos:Array=undefined, aItems:Array=undefined) {
			setID(id);
			setLabel(label);
			setPhotos(aPhotos);
			setItems(aItems);
		}
		
		public function getID():String { return this.id; }
		public function getLabel():String { return this.label; }
		public function getPhotos():Array { return this.aPhotos; }
		public function getItems():Array { return this.aItems; }
		
		public function setID(value:String):void {
			this.id = value;
		}
		public function setLabel(value:String):void {
			this.label = value;
		}
		public function setPhotos(value:Array):void {
			this.aPhotos = value;
		}
		public function setItems(value:Array):void {
			this.aItems = value;
		}
		
	}
	
}