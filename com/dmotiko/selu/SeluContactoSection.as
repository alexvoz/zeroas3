package com.dmotiko.selu {
	
	import fl.transitions.easing.Regular;
	import fl.transitions.Tween;
	import flash.display.*;	
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.*;	
	import flash.events.*
	import com.general.*
	import flash.xml.XMLNode;
		
	public class SeluContactoSection
	extends BaseClip {
		private var btnBar:BaseMenu;
		private var sArea:String;
		public var mcEnviar:MovieClip;
		public var errorName:MovieClip;
		public var errorMail:MovieClip;
		public var errorMessage:MovieClip;
		public var inputName:TextField;
		public var inputMail:TextField;
		public var inputMessage:TextField;
		public var serverMessage:MovieClip;
								
		override protected function initClip():void {
			super.initClip();
					
			if( SeluSite.getApp() )SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
						
			//inicializo los clips
			inputName.tabIndex = 1;
			inputMail.tabIndex = 2;
			inputMessage.tabIndex = 3;
			
			errorName.alpha = errorMail.alpha = errorMessage.alpha = 0;
			mcEnviar.addEventListener(MouseEvent.CLICK, validate);
						
			btnBar = new BaseMenu();
			addChild(btnBar);
			btnBar.x = 100;
			btnBar.y = 245;
			btnBar.rotation = -3;
			btnBar.setView( SeluButtonResalte );
			btnBar.addEventListener( Event.CHANGE, menu_changed);
			//btnBar.setSpace( -10 );
			
			
			var aData:Array = new Array();
			aData.push( { label: "Administración", data: "administracion@selu.com.ar" } );
			aData.push( { label: "Ventas", data: "ventas@selu.com.ar" } );
			aData.push( { label: "Clientes", data: "clientes@selu.com.ar" } );
			aData.push( { label: "Exportaciones", data: "export@selu.com.ar" } );
			aData.push( { label: "Publicidad", data: "publicidad@selu.com.ar" } );
			aData.push( { label: "Newsletter", data: "newsletter@selu.com.ar" } );
			
			btnBar.setData( aData );
			
		}
		
		private function validate(e:MouseEvent):void {
			var bError:Boolean;
			if ( !inputName.text || inputName.text == "" ) {
				bError = true;
				registerTween("alphaErrorName", new Tween( errorName, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			if ( !inputMessage.text || inputMessage.text == "" ) {
				bError = true;
				registerTween("alphaErrorMessage", new Tween( errorMessage, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			var sMail:String = inputMail.text;
			var nAt:Number = sMail.indexOf("@");
			var nLastDot:Number = sMail.lastIndexOf(".");
			var bAt:Boolean = (nAt > 2) && (nAt == sMail.lastIndexOf("@") ) && (nAt < sMail.length-1);
			var bDot:Boolean = nLastDot > 0 && nLastDot > nAt && nLastDot < sMail.length - 1;
			if ( !bAt || !bDot ) {
				bError = true;
				registerTween("alphaErrorMail", new Tween( errorMail, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			if ( !bError ) {
				var request:URLRequest = new URLRequest ( SeluSite.getApp().getSWF_VAR("php_mail") );
				request.method = URLRequestMethod.POST;
								
				var variables:URLVariables = new URLVariables();
				variables.name = inputName.text;
				variables.mail = inputMail.text;
				variables.message = inputMessage.text;
				variables.from = "selu.com.ar";
				if ( SeluSite.getApp().getSWF_VAR( "test_mail" ) ) variables.test_mail = SeluSite.getApp().getSWF_VAR( "test_mail" );
				variables.mailTo = btnBar.getActiveButton().getData().data;
				request.data = variables;
								
				var loader:URLLoader = new URLLoader (request);
				loader.addEventListener(Event.COMPLETE, send_complete);
				loader.load(request);
				
				
			}
			
		}
		
		private function send_complete(e:Event):void {
			inputName.text = inputMail.text = inputMessage.text = "";
			btnBar.getButtons()[0].rollOver(undefined);
			btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			if (e.target.data == "OK") {
				serverMessage.gotoAndStop(2);
			} else {
				serverMessage.gotoAndStop(3);
			}
			registerTween("serverFade", new Tween( serverMessage, "alpha", Regular.easeOut, 1, 0, 5, true));
		}
		
		private function menu_changed(e:Event):void {
			sArea = btnBar.getActiveButton().getData().data;
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.CONTACTO ) {
				btnBar.getButtons()[0].rollOver(undefined);
				btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
				inputName.text = inputMail.text = inputMessage.text = "";
				serverMessage.gotoAndStop(1);
				serverMessage.alpha = 0;
			}
		}
		
	}
	
}