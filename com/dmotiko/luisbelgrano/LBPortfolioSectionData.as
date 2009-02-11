package com.dmotiko.luisbelgrano {
	import com.general.BaseClip;
	
	public class LBPortfolioSectionData {
		
		private var id:String;
		private var label:String;
		private var aItems:Array; //de LBPortfolioItemData
		
		public function LBPortfolioSectionData(id:String=undefined, label:String=undefined, aItems:Array=undefined) {
			setID(id);
			setLabel(label);
			setItems(aItems);
		}
		
		public function getID():String { return this.id; }
		public function getLabel():String { return this.label; }
		public function getItems():Array { return this.aItems; }
		
		public function setID(value:String):void {
			this.id = value;
		}
		public function setLabel(value:String):void {
			this.label = value;
		}
		public function setItems(value:Array):void {
			this.aItems = value;
		}
		
	}
	
}