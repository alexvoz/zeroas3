package com.dmotiko.elemento {
	
	public class CarritoItemData {
		
		protected static var ID:int = 0;
		
		private var _ID:int;
		private var _nColor:int;
		private var _sName:String;
		private var _sParentName:String;
		private var _sDescription:String;
		private var _sDescription2:String;
		private var _sArticle:String;
		private var _nQuant:int;
		
		protected static function getNextID():int {
			CarritoItemData.ID++;
			return CarritoItemData.ID;
		}
		
		public function CarritoItemData() {
			setID( CarritoItemData.getNextID() );
			setQuant(1);
		}
		
		public function getColor():int { return _nColor; }
		
		public function setColor(value:int):void {
			_nColor = value;
		}
		
		public function getName():String { return _sName; }
		
		public function setName(value:String):void {
			_sName = value;
		}
		
		public function getDescription():String { return _sDescription; }
		
		public function setDescription(value:String):void {
			_sDescription = value;
		}
		
		public function getDescription2():String { return _sDescription2; }
		
		public function setDescription2(value:String):void {
			_sDescription2 = value;
		}
		
		public function getArticle():String { return _sArticle; }
		
		public function setArticle(value:String):void {
			_sArticle = value;
		}
		
		public function getID():int { return _ID; }
		
		public function setID(value:int):void {
			_ID = value;
		}
				
		public function setParentName(value:String):void {
			_sParentName = value;
		}
		
		public function getParentName():String { return _sParentName; }
		
		public function getQuant():int { return _nQuant; }
		
		public function setQuant(value:int):void {
			_nQuant = value;
		}
		
	}
	
}