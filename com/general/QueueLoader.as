package com.general 
{
	import com.util.ArrayUtil;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class QueueLoader extends EventDispatcher
	{
		
		private var loader:Loader;
		private var paths:Array; //de String
		private var cache:Array; //de DisplayObject
		private var nPos:uint;
		private var _nLoaded:uint;
		private var loading:Boolean;
				
		public function QueueLoader( paths:Array ) 
		{
			this.paths = paths;
			//this.paths = paths.filter( ArrayUtil.filter_unique );
						
			this.cache = new Array();
			this.loader = new Loader();
			this.nPos = 0;
			this._nLoaded = 0;
			this.loading = true;
			
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, store_progress, false, 0, true );
			loader.contentLoaderInfo.addEventListener(Event.INIT, store_swf, false, 0, true );
			load_next();
		}
		
		private function store_progress(e:ProgressEvent):void 
		{
			cache[ nPos ] = e.currentTarget;
		}
		
		private function store_swf(e:Event):void 
		{
			
			var c = e.currentTarget.content;
			cache[ nPos ] = c;
			nPos++;
			_nLoaded++;
			
			this.dispatchEvent( new Event( Event.CHANGE ) );
			load_next();
		}
		
		private function load_next():void
		{
			if ( nPos < paths.length  ){
				loader.load( new URLRequest( paths[nPos] ) );
			} else {
				this.dispatchEvent( new Event( Event.COMPLETE ) );
				this.loading = false;
			}
		}
		
		/**
		 * 
		 * @param	path
		 * @return	LoaderInfo o DisplayObject
		 */
		public function getResource( path:String ):* {
			for (var i:int = 0; i < paths.length; i++) 
			{
				if ( paths[i] == path ) return cache[i];
			}
			return undefined;
		}
		
		public function getResourceByIndex( i:uint ):DisplayObject {
			return cache[i];
		}
		
		public function get nLoaded():uint { return _nLoaded; }
		
		public function addPath( path:String ):void {
			paths.push( path );
			if ( !loading ) {
				loading = true;
				load_next();
			}
		}
		
	}

}