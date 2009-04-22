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
		private var btnEnviar:MovieClip;
		private var mcErrorName:MovieClip;
		private var mcErrorMail:MovieClip;
		private var mcErrorMessage:MovieClip;
		private var txtName:TextField;
		private var txtMail:TextField;
		private var txtMessage:TextField;
		private var mcServerMessage;
								
		override protected function initClip():void {
			super.initClip();
					
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
			//recolecto los movieclips que están en el fla
			btnEnviar = this.getChildByName("mcEnviar") as MovieClip;
			mcErrorName = this.getChildByName("errorName") as MovieClip;
			mcErrorMail = this.getChildByName("errorMail") as MovieClip;
			mcErrorMessage = this.getChildByName("errorMessage") as MovieClip;
			mcServerMessage= this.getChildByName("serverMessage") as MovieClip;
			txtName = this.getChildByName("inputName") as TextField;
			txtMail = this.getChildByName("inputMail") as TextField;
			txtMessage = this.getChildByName("inputMessage") as TextField;
			
			//inicializo los clips
			trace(mcErrorName);
			mcErrorName.alpha = mcErrorMail.alpha = mcErrorMessage.alpha = 0;
			btnEnviar.addEventListener(MouseEvent.CLICK, validate);
			
			btnBar = new BaseMenu();
			addChild(btnBar);
			btnBar.x = 66;
			btnBar.y = 285;
			btnBar.rotation = -3;
			btnBar.setView( SeluButtonResalte );
			btnBar.addEventListener( Event.CHANGE, menu_changed);
			btnBar.setSpace( -10 );
			
			var aData:Array = new Array();
			aData.push( { label: "Administracion", data: "administracion@selu.com.ar" } );
			aData.push( { label: "Ventas", data: "ventas@selu.com.ar" } );
			aData.push( { label: "Clientes", data: "clientes@selu.com.ar" } );
			aData.push( { label: "Exportaciones", data: "export@selu.com.ar" } );
			aData.push( { label: "Publicidad", data: "publicidad@selu.com.ar" } );
			
			btnBar.setData( aData );
		}
		
		private function validate(e:MouseEvent):void {
			var bError:Boolean;
			if ( !txtName.text || txtName.text == "" ) {
				bError = true;
				registerTween("alphaErrorName", new Tween( mcErrorName, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			if ( !txtMessage.text || txtMessage.text == "" ) {
				bError = true;
				registerTween("alphaErrorMessage", new Tween( mcErrorMessage, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			var sMail:String = txtMail.text;
			var nAt:Number = sMail.indexOf("@");
			var nLastDot:Number = sMail.lastIndexOf(".");
			var bAt:Boolean = (nAt > 2) && (nAt == sMail.lastIndexOf("@") ) && (nAt < sMail.length-1);
			var bDot:Boolean = nLastDot > 0 && nLastDot > nAt && nLastDot < sMail.length - 1;
			if ( !bAt || !bDot ) {
				bError = true;
				registerTween("alphaErrorMail", new Tween( mcErrorMail, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			if ( !bError ) {
				var request:URLRequest = new URLRequest ("sendMail.php");
				request.method = URLRequestMethod.POST;
								
				var variables:URLVariables = new URLVariables();
				variables.name = txtName.text;
				variables.mail = txtMail.text;
				variables.message = txtMessage.text;
				variables.mailTo = btnBar.getActiveButton().getData().data;
				request.data = variables;
								
				var loader:URLLoader = new URLLoader (request);
				loader.addEventListener(Event.COMPLETE, send_complete);
				loader.load(request);
				
				
			}
			
		}
		
		private function send_complete(e:Event):void {
			txtName.text = txtMail.text = txtMessage.text = "";
			btnBar.getButtons()[0].rollOver(undefined);
			btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
			if (e.target.data == "OK") {
				mcServerMessage.gotoAndStop(2);
			} else {
				mcServerMessage.gotoAndStop(3);
			}
			registerTween("serverFade", new Tween( mcServerMessage, "alpha", Regular.easeOut, 1, 0, 5, true));
		}
		
		private function menu_changed(e:Event):void {
			sArea = btnBar.getActiveButton().getData().data;
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.CONTACTO ) {
				btnBar.getButtons()[0].rollOver(undefined);
				btnBar.getButtons()[0].dispatchEvent( new MouseEvent( MouseEvent.CLICK ) );
				txtName.text = txtMail.text = txtMessage.text = "";
				mcServerMessage.gotoAndStop(1);
				mcServerMessage.alpha = 0;
			}
		}
		
	}
	
}