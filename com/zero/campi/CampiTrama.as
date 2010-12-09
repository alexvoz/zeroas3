package com.zero.campi 
{
	import com.util.MathUtil;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiTrama extends Sprite
	{
		
		public function CampiTrama() 
		{
			
			var nX:int = 0;
			var nY:int = 0;
			var vColores:Vector.<uint> = new Vector.<uint>(20, true);
				vColores[0] = 0x333333;
				vColores[1] = 0xBCAE96;
				vColores[2] = 0x333333;
				vColores[3] = 0;
				vColores[4] = 0x0C0C0C;
				vColores[5] = 0x333333;
				vColores[6] = 0x8EAA92;
				vColores[7] = 0x333333;
				vColores[8] = 0;
				vColores[9] = 0x0E0E0E;
				vColores[10] = 0;
				vColores[11] = 0;
				vColores[12] = 0;
				vColores[13] = 0x928976;
				vColores[14] = 0x0E0E0E;
				vColores[15] = 0x0E0E0E;
				vColores[16] = 0xFFFFFF;
				vColores[17] = 0x342F17;
				vColores[18] = 0x999999;
				vColores[19] = 0x342F17;
			
			var vImages:Vector.<String> = new Vector.<String>(20, true);
			vImages[1] = "img/home_01.png";
			vImages[3] = "img/home_02.png";
			vImages[6] = "img/home_03.png";
			vImages[16] = "img/home_04.png";
			vImages[18] = "img/home_05.png";
			
			for (var i:int = 0; i < vColores.length; i++) 
			{
				var modulo:CampiModulo = new CampiModulo( vColores[ i ] , 1, vImages[i] );
				if ( i > 0 && i % 4 == 0) {
					nX = 0;
					nY += modulo.height;
				}
				modulo.x = nX;
				modulo.y = nY;
				nX += modulo.width;
				addChild(modulo);
				
			}
			
		}
		
	}

}