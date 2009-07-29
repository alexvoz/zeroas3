package com.dmotiko.elemento {
	
	public class CarritoItemData {
		
		protected static var ID:int = 0;
		
		private var _ID:int;
		private var _nColor:int;
		private var _oName:Object;
		private var _oParentName:Object;
		private var _oDescription:Object;
		private var _oDescription2:Object;
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
		
		public function getName():String { 
			if ( Site.getApp().getLanguage() == Site.SPANISH) return _oName.spanish; 
			else return _oName.english;
		}
		
		public function setName(value:Object):void {
			if ( value is String ) {
				_oName = { spanish: value, english: value };
			} else {
				_oName = value;
			}
		}
		
		public function getDescription():String { 
			if ( ! _oDescription ) return undefined;
			if ( Site.getApp().getLanguage() == Site.SPANISH) return _oDescription.spanish; 
			else return _oDescription.english;
		}
		
		public function setDescription(value:Object):void {
			if ( value is String ) {
				_oDescription = { spanish: value, english: value };
			} else {
				_oDescription = value;
			}
		}
		
		public function getDescription2():String { 
			if ( ! _oDescription2 ) return undefined;
			if ( Site.getApp().getLanguage() == Site.SPANISH) return _oDescription2.spanish; 
			else return _oDescription2.english;
		}
		
		public function setDescription2(value:Object):void {
			_oDescription2 = value;
		}
		
		public function getArticle():String { return _sArticle; }
		
		public function setArticle(value:String):void {
			_sArticle = value;
		}
		
		public function getID():int { return _ID; }
		
		public function setID(value:int):void {
			_ID = value;
		}
				
		public function setParentName(value:Object):void {
			//Site.log( "CarritoItemData | setParentName= " + value);
			_oParentName = value;
		}
		
		public function getParentName():String { 
			if ( Site.getApp().getLanguage() == Site.SPANISH) return _oParentName.spanish; 
			else return _oParentName.english;
		}
		
		public function getQuant():int { return _nQuant; }
		
		public function setQuant(value:int):void {
			_nQuant = value;
		}
		
	}
	
}