package com.zero.campi 
{
	import com.util.ArrayUtil;
	import com.util.DisplayUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiBitmapTrama extends Sprite 
	{
		private var rows:uint;
		private var cols:uint;
		private var unitW:uint;
		private var unitH:uint;
		private var modulesPos:Array;
		
		public function CampiBitmapTrama( object:DisplayObject, rows:uint = 5, cols:uint = 9, unitW:uint = 90, unitH:uint = 120 ) 
		{
			this.rows = rows;
			this.cols = cols;
			this.unitW = unitW;
			this.unitH = unitH;
			
			var objectData:BitmapData = new BitmapData( object.width, object.height );
			objectData.draw( object );
			
			modulesPos = new Array();
			
			for( var row:int=0; row < rows; row++){
				for(var col:int=0; col < cols; col++){
					var moduloData:BitmapData = new BitmapData( unitW , unitH );
					moduloData.copyPixels( objectData, new Rectangle( col*unitW, row*unitH, unitW, unitH), new Point(0,0) );
					var modulo:Bitmap = new Bitmap( moduloData );
					modulo.name = "r" + row + "c" + col;
					modulo.x = col * unitW;
					modulo.y = row * unitH;
					modulo.smoothing = true;
					this.addChild( modulo );
					modulesPos.push( new Point( modulo.x, modulo.y ) );
				}
			}

			objectData.dispose();
			
		}
		
		public function randomModules():void {
			
			var modulesRandom:Array = ArrayUtil.randomArray( modulesPos );
			for (var i:int = 0; i < modulesRandom.length; i++) 
			{
				getChildAt(i).x = modulesRandom[i].x;
				getChildAt(i).y = modulesRandom[i].y;
			}
		}
		
	}

}