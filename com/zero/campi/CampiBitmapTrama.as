package com.zero.campi 
{
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
		
		public function CampiBitmapTrama( object:DisplayObject, rows:uint = 5, cols:uint = 9, unitW:uint = 90, unitH:uint = 120 ) 
		{
			var objectData:BitmapData = new BitmapData( object.width, object.height );
			objectData.draw( object );
			
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
				}
			}

			objectData.dispose();
		}
		
	}

}