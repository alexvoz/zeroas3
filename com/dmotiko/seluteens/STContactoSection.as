package com.dmotiko.seluteens {
	
	import com.dmotiko.seluteens.dummy.Combo;
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
		
	public class STContactoSection
	extends BaseClip {
		private var btnBar:BaseMenu;
		private var sArea:String;
		
		public var mcCombo:Combo;
		
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
						
			mcCombo.addEventListener( Event.CHANGE, menu_changed );
			mcCombo.setData( { label: "Administración", data: "administracion@seluteens.com.ar" } );
			
			//inicializo los clips
			errorName.alpha = errorMail.alpha = errorMessage.alpha = 0;
			mcEnviar.addEventListener(MouseEvent.CLICK, validate);
			
			STSite.log( "stage= "+ this.stage );
			inputName.tabIndex = 0;
			inputMail.tabIndex = 1;
			inputMessage.tabIndex = 2;
			
			if(STSite.getApp()) STSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
			
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
							
				var request:URLRequest = new URLRequest ("sendMail.php");
				request.method = URLRequestMethod.POST;
								
				var variables:URLVariables = new URLVariables();
				variables.name = inputName.text;
				variables.mail = inputMail.text;
				variables.message = inputMessage.text;
				variables.mailTo = sArea;
				request.data = variables;
								
				var loader:URLLoader = new URLLoader (request);
				loader.addEventListener(Event.COMPLETE, send_complete);
				loader.load(request);
				
				
			}
			
		}
		
		private function send_complete(e:Event):void {
			inputName.text = inputMail.text = inputMessage.text = "";
			mcCombo.setData( { label: "Administración", data: "administracion@seluteens.com.ar" } );
			if (e.target.data == "OK") {
				serverMessage.gotoAndStop(2);
			} else {
				serverMessage.gotoAndStop(3);
			}
			registerTween("serverFade", new Tween( serverMessage, "alpha", Regular.easeOut, 1, 0, 5, true));
		}
		
		private function menu_changed(e:Event):void {
			sArea = e.currentTarget.getData().data;
		}
		
		private function section_changed(e:Event):void {
			if ( STSite.getApp().getSection() == STSite.CONTACTO ) {
				mcCombo.setData( { label: "Administración", data: "administracion@selu.com.ar" } );
				inputName.text = inputMail.text = inputMessage.text = "";
				serverMessage.gotoAndStop(1);
				serverMessage.alpha = 0;
			}
		}
		
	}
	
}