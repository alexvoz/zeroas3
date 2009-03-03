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
		
		override protected function loadExternalContent():void {
			this.externalContentLoaded();
		}
		
		override protected function externalContentLoaded( evnt:Event=undefined ):void {
			/*			
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest("main.swf"+getNoCache()); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler); 
			mLoader.load(mRequest);
			function onProgressHandler(loadEvent:ProgressEvent):void {
				var loadedbytes:uint = loadEvent.bytesLoaded;
				var totalbytes:uint = loadEvent.bytesTotal;
				var cargado:int = int(loadedbytes*100/totalbytes);
				if(getChildByName("loader")) getChildByName("loader").scaleX = cargado / 100;
				if (loadedbytes == totalbytes) {
					if(getChildByName("loader")) removeChild( getChildByName("loader"));
					if( getChildByName("loaderBar") ) removeChild( getChildByName("loaderBar") );
					if( getChildByName("loaderBar2") ) removeChild( getChildByName("loaderBar2") );
					if( getChildByName("loaderBar") ) removeChild( getChildByName("loaderText") );
				}
			}
			function onCompleteHandler(loadEvent:Event) {         
				setCenterClip(loadEvent.currentTarget.content.getChildByName("mcMask"));
				addChild(loadEvent.currentTarget.content);
				stage.dispatchEvent( new Event( Event.RESIZE ) );
			} 
			*/
		}
		
	}
	
}