package com.dmotiko.mirador {
	import com.general.*;
	
	public class MiradorSite
	extends WebSite {
		
		public static const HOME:String = "MIRADORSITE_HOME";
		public static const QUIENES_SOMOS:String = "MIRADORSITE_QUIENES_SOMOS";
		public static const NUESTROS_SALONES:String = "MIRADORSITE_NUESTROS_SALONES";
		public static const SERVICIOS_BODAS:String = "MIRADORSITE_SERVICIOS_BODAS";
		public static const SERVICIOS_QUINCE:String = "MIRADORSITE_SERVICIOS_QUINCE";
		public static const SERVICIOS_BARMITZVA:String = "MIRADORSITE_SERVICIOS_BARMITZVA";
		public static const EVENTOS:String = "MIRADORSITE_EVENTOS";
		public static const ORGANIZACION:String = "MIRADORSITE_ORGANIZACION";
		public static const COMUNIQUESE:String = "MIRADORSITE_COMUNIQUESE";
		public static const UBICACION:String = "MIRADORSITE_UBICACION";
		
		public static function getApp():MiradorSite {
			return MiradorSite(app);
		}
		
		public function MiradorSite() {
			super();
			isFullFlash();
		}
		
	}
	
}