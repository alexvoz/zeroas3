package com.dmotiko.selu {
	import com.general.*;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.*;
	import flash.utils.getTimer;
		
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
		private var mainContent:Sprite;
		private var topClip:Sprite;
		private var seluLoader:SeluLoader;
		private var music:Sound;
		private var musicChannel:SoundChannel;
		private var soundTween:Tween;
		private var soundController:Object;
		
		/* data XML */
		private var collection_loaderXML:URLLoader;
		private var collectionBasic_loaderXML:URLLoader;
		private var stores_loaderXML:URLLoader;
		private var sexies_loaderXML:URLLoader;
		private var collectionXMLList:XMLList;
		private var collectionBasicXMLList:XMLList;
		private var storesXMLList:XMLList;
		private var sexiesXMLList:XMLList;		
		
		private var news_loaderXML:URLLoader;
		private var newsXMLList:XMLList;
		/* end data XML*/
						
		public static function getApp():SeluSite {
			return SeluSite(app);
		}
						
		public function SeluSite() {
			super();
			getChildByName("mcCenter").visible = false;
			setCenterClip(getChildByName("mcCenter"));
			isFullFlash();
		}
				
		override protected function initSite():void {
			mainContent = this.addChild( new Sprite() ) as Sprite;
			topClip = this.addChild( new Sprite() ) as Sprite;
			this.sSection = SeluSite.HOME;
			super.initSite();
			
		}
		
		override protected function loadExternalContent():void {
			music = new Sound( new URLRequest( "http://www.d-motiko.com.ar/clients/selu/production/music2009.mp3" ) );
			music.addEventListener( Event.COMPLETE, snd_complete );
			music.addEventListener( ProgressEvent.PROGRESS, snd_progress );
			soundController = new Object();
			soundController.volume = 1;
			soundController.position = 0;
			soundController.startDownload = getTimer();
									
			collection_loaderXML = new URLLoader();
			collection_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			collection_loaderXML.addEventListener( Event.COMPLETE, collectionLoaded );
			collection_loaderXML.load( new URLRequest( "collection.xml" ) );
			
			collectionBasic_loaderXML = new URLLoader();
			collectionBasic_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			collectionBasic_loaderXML.addEventListener( Event.COMPLETE, collectionBasicLoaded );
			collectionBasic_loaderXML.load( new URLRequest( "collectionBasic.xml" ) );
			
			stores_loaderXML = new URLLoader();
			stores_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			stores_loaderXML.addEventListener( Event.COMPLETE, storesLoaded );
			stores_loaderXML.load( new URLRequest( "stores.xml" ) );
			
			sexies_loaderXML = new URLLoader();
			sexies_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			sexies_loaderXML.addEventListener( Event.COMPLETE, sexiesLoaded );
			sexies_loaderXML.load( new URLRequest( "sexies.xml" ) );
			
			news_loaderXML = new URLLoader();
			news_loaderXML.dataFormat = URLLoaderDataFormat.TEXT;
			news_loaderXML.addEventListener( Event.COMPLETE, newsLoaded );
			news_loaderXML.load( new URLRequest( "news.xml" ) );
		}
		
		private function newsLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				newsXMLList = myXML.child("news");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				log("Could not parse the news XML | "+e.message)
			}
		}
		
		private function sexiesLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				sexiesXMLList = myXML.child("photo");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				log("Could not parse the sexies XML | "+e.message)
			}
		}
		private function storesLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				storesXMLList = myXML.child("locales");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				log("Could not parse the stores XML | "+e.message)
			}
		}
		
		private function collectionBasicLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				collectionBasicXMLList = myXML.children()[0].child("photo");
				checkXML();
												
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				log("Could not parse the collectionBasics XML | "+e.message)
			}
		}
		
		private function collectionLoaded(e:Event):void {
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(e.target.data)
				collectionXMLList = myXML.children()[0].child("photo");
				checkXML();
								
			} catch (e:TypeError){
				//Could not convert the data, probavlu because is not formated correctly
				log("Could not parse the collection XML | "+e.message)
			}
		}
		
		private function checkXML():void {
			if ( collectionBasicXMLList && collectionXMLList && storesXMLList && sexiesXMLList && newsXMLList ) {
				externalContentLoaded( undefined );
			}
		}
		
		private function snd_progress(e:ProgressEvent):void {
			var p:int = Math.round(e.bytesLoaded * 100 / e.bytesTotal );
			if (p > 50) {
				music.removeEventListener( ProgressEvent.PROGRESS, snd_progress);
				musicChannel = music.play();
				musicChannel.addEventListener( Event.SOUND_COMPLETE, loop_music);
				setSound(true);
			}
		}
		
		private function snd_complete(e:Event):void {
			SeluSite.getApp().log("snd complete");
		}
		
		private function loop_music(e:Event):void {
			musicChannel.stop();
			soundController.position = 0;
			musicChannel = music.play( soundController.position );
		}
			
		// TODO esto vuela más tarde
		override public function setSection( s:String ):void {
			if ( /*s == SeluSite.NOVEDADES ||*/ s == SeluSite.PRENSA || s== SeluSite.SEXIES ) return;
			super.setSection( s );
		}
		
		override protected function externalContentLoaded( evnt:Event = undefined):void {
			getChildByName("mcSeluLoader").addEventListener( Event.CHANGE, hideLoader);
			var mLoader:Loader = new Loader(); 
			var mRequest:URLRequest = new URLRequest("mainContent.swf"+getNoCache()); 
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler); 
			mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			mLoader.load(mRequest);
			
		}
		
		private function hideLoader(e:Event):void {
			//getChildByName("mcSeluLoader").visible = false;
			removeChild( getChildByName("mcSeluLoader") );
		}
		
		private function onProgressHandler(evnt:ProgressEvent) {         
			var nP:Number = Math.round( evnt.bytesLoaded * 100 / evnt.bytesTotal );
			(getChildByName("mcSeluLoader") as SeluLoader).setPos( nP );
		}
		
		private function onCompleteHandler(loadEvent:Event) {         
			mainContent.addChild(loadEvent.currentTarget.content);
		}
		
		public function getTopClip():Sprite { return topClip; }
		
		public function getCollectionData():XMLList { return collectionXMLList;	}
		public function getCollectionBasicData():XMLList { return collectionBasicXMLList;	}
		public function getStoresData():XMLList { return storesXMLList;	}
		
		public function getMusic():Sound { return music; }
		public function getMusicChannel():SoundChannel { return musicChannel; }
		
		override public function setSound(bSound:Boolean):void {
			super.setSound(bSound);
			if (!bSound) fadeOutMusic();
			else fadeInMusic();
		}
		
		public function fadeOutMusic():void {
			if ( soundController.volume == 0) return;
			if (soundTween) soundTween.stop();
			soundTween = new Tween(soundController, "volume", Regular.easeOut, soundController.volume, 0, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
			soundTween.addEventListener(TweenEvent.MOTION_FINISH, stop_music);
		}
			
		public function fadeInMusic():void {
			if ( !getSound() || getSection() == SeluSite.BACKSTAGE || soundController.volume == 1) return;
			musicChannel = music.play( soundController.position );
			if (soundTween) soundTween.stop();
			soundTween = new Tween(soundController, "volume", Regular.easeOut, soundController.volume, 1, 2, true);
			soundTween.addEventListener(TweenEvent.MOTION_CHANGE, refresh_fade);
		}
		
		private function refresh_fade(e:TweenEvent):void {
			var transform:SoundTransform = getMusicChannel().soundTransform;
			transform.volume = soundController.volume;
			getMusicChannel().soundTransform = transform;
		}
		
		private function stop_music(e:TweenEvent):void 	{
			soundController.position = getMusicChannel().position;
			getMusicChannel().stop();
		}
		
	}
	
}