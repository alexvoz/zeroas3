package com.zero.campi.form 
{
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.util.LayoutUtil;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiForm extends Sprite 
	{
		private var btnEnviar:CampiFormButton;
		
		public function CampiForm() 
		{
			var aLabels:Array = [  
				["NOMBRE", CampiFieldNotEmpty], 
				["EMAIL", CampiFieldMail], 
				["EMPRESA (OPTATIVO)", CampiField], 
				["CONSULTA", CampiFieldArea] 
				];
			aLabels.forEach( dibujo_campo );
			
			btnEnviar = new CampiFormButton("enviar");
			btnEnviar.addEventListener(MouseEvent.CLICK, send_data );
			addChild( btnEnviar );
			
			btnEnviar.mouseEnabled = false;
			btnEnviar.tabEnabled = false;
			btnEnviar.alpha = 0;
			
			LayoutUtil.layoutY(this, 12 );
		}
		
		private function send_data(e:MouseEvent):void 
		{
			//var pedido:URLRequest = new URLRequest();
			trace("data enviada");
		}
		
		private function dibujo_campo(item:Array, index:int, datos:Array):void
		{
			var field:CampiField = new item[1]( item[0] );
			field.addEventListener(FocusEvent.FOCUS_OUT, check_valid );
			addChild( field );
		}
		
		private function check_valid(e:FocusEvent):void 
		{
			var check:Boolean = DisplayUtil.getChildren( this, CampiField ).some( is_field_invalid );
			if (!check) {
				btnEnviar.mouseEnabled = true;
				TweenLite.to( btnEnviar, 0.5, { alpha: 1 } );
				
			} else {
				btnEnviar.mouseEnabled = false;
				TweenLite.to( btnEnviar, 0.5, { alpha: 0 } );
			}
		}
		
		private function is_field_invalid(item:CampiField, index:int, datos:Array):Boolean
		{
			return item.validate == false;
		}
		
	}

}