package com.zero.campi.form 
{
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.util.LayoutUtil;
	import com.zero.campi.CampiSite;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiForm extends Sprite 
	{
		
		private var container:Sprite;
		private var btnEnviar:CampiFormButton;
		private var pedidoPHP:URLRequest;
		private var vars:URLVariables;
		private var back:Timer;
		private var responseMsg:DisplayObject;
		
		public function CampiForm() 
		{
			
			container = new Sprite();
			addChild(container);
			
			var aFields:Array = [  
				[CampiFieldNotEmpty, "name", "NOMBRE"], 
				[CampiFieldMail, "email", "EMAIL"], 
				[CampiField, "company", "EMPRESA (OPTATIVO)"], 
				[CampiFieldArea, "comment", "CONSULTA"] 
				];
			aFields.forEach( dibujo_campo );
			
			btnEnviar = new CampiFormButton("enviar");
			btnEnviar.addEventListener(MouseEvent.CLICK, send_data );
			container.addChild( btnEnviar );
			
			btnEnviar.mouseEnabled = false;
			btnEnviar.tabEnabled = false;
			btnEnviar.alpha = 0;
			
			LayoutUtil.layoutY(container, 12 );
						
			pedidoPHP = new URLRequest("config.xml");
			pedidoPHP.method = URLRequestMethod.POST;
			
			var cargaData:URLLoader = new URLLoader(pedidoPHP);
			cargaData.addEventListener(Event.COMPLETE, config_loaded );
			
			vars = new URLVariables();
			
			back = new Timer( 3000, 1 );
			back.addEventListener(TimerEvent.TIMER, go_back );
		}
		
		private function go_back(e:TimerEvent):void 
		{
			TweenLite.to( responseMsg, 0.5, { alpha: 0, y: 20 } );
			TweenLite.to( container, 0.5, { alpha: 1, y: 0 } );
			
			container.mouseChildren = true;
			DisplayUtil.getChildren( container, CampiField ).forEach( function(item) {
				item.reset();
			});
			btnEnviar.mouseEnabled = false;
			btnEnviar.tabEnabled = false;
			btnEnviar.alpha = 0;
		}
		
		private function config_loaded(e:Event):void 
		{
			var config:XML = new XML(e.target.data);
			pedidoPHP.url = config.@php;
		}
		
		private function send_data(e:MouseEvent):void 
		{
			vars.name = (container.getChildByName("name") as CampiField).value;
			vars.email = (container.getChildByName("email") as CampiField).value;
			vars.company = (container.getChildByName("company") as CampiField).value;
			vars.comment = (container.getChildByName("comment") as CampiField).value;
						
			pedidoPHP.data = vars;			
			
			var transporte:URLLoader = new URLLoader(pedidoPHP);
			transporte.addEventListener(Event.COMPLETE, check_response );
			
			TweenLite.to( container, 0.5, { alpha: 0.5 } );
			container.mouseChildren = false;
			
			//ExternalInterface.call("console.log", "CampiForm | send_data");
		}
		
		private function check_response(e:Event):void 
		{
			//ExternalInterface.call("console.log", "CampiForm | response "+e.target.data);
			var response:URLVariables = new URLVariables( e.target.data );
			if ( response.msg == "OK" ) {
				responseMsg = new MsgOK(); //library FLA
			} else {
				responseMsg = new MsgERROR(); //library FLA
			}
			addChild( responseMsg );
			TweenLite.from( responseMsg, 0.5, { alpha: 0, y: 20 } );
			TweenLite.to( container, 0.5, { alpha: 0, y: 20 } );
			back.reset();
			back.start();
		}
		
		private function dibujo_campo(item:Array, index:int, datos:Array):void
		{
			var field:CampiField = new item[0]( item[1], item[2] );
			field.addEventListener(FocusEvent.FOCUS_OUT, check_valid );
			container.addChild( field );
			
		}
		
		private function check_valid(e:FocusEvent):void 
		{
			var check:Boolean = DisplayUtil.getChildren( container, CampiField ).some( is_field_invalid );
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