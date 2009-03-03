package com.dmotiko.selu {
	import com.general.*;
	
	public class SeluSite
	extends WebSite {
		
		public static const HOME:String = "SELU_HOME";
		public static const COLECCION:String = "SELU_COLECCION";
		public static const BACKSTAGE:String = "SELU_BACKSTAGE";
		public static const PUNTOVENTA:String = "SELU_PUNTOVENTA";
		public static const NOVEDADES:String = "SELU_NOVEDADES";
		public static const SEXIES:String = "SELU_SEXIES";
		public static const PRENSA:String = "SELU_PRENSA";
		public static const CONTACTO:String = "SELU_CONTACTO";
		public static const NOCASTING:String = "SELU_NOCASTING";
		
		public static function getApp():SeluSite {
			return SeluSite(app);
		}
						
		public function SeluSite() {
			super();
			isFullFlash();
		}
		
	}
	
}