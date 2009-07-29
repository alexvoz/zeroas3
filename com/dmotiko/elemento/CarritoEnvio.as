package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class CarritoEnvio
	extends BaseClip {
		
		public var mcEnviar:ElementoBtn;
		public var mcBorrar:ElementoBtn;
		public var inputName:TextField;
		public var inputCompany:TextField;
		public var inputPhone:TextField;
		public var inputMail:TextField;
		public var errorName:Sprite;
		public var errorMail:Sprite;
				
		override protected function initClip():void {
			if ( Site.getApp() && Site.getApp().getLanguage() != Site.SPANISH ) {
				gotoAndStop(2);
				mcEnviar.setData( { label: "submit" } );
				mcBorrar.setData( { label: "reset" } );
			} else {
				gotoAndStop(1);
				mcEnviar.setData( { label: "enviar" } );
				mcBorrar.setData( { label: "borrar" } );	
			}
			mcBorrar.addEventListener( MouseEvent.CLICK, erase_fields);
			mcEnviar.addEventListener( MouseEvent.CLICK, send_mail);
			erase_fields(undefined);
			
			errorName.alpha = 0;
			errorMail.alpha = 0;
			
			inputPhone.restrict = "0-9";
			inputMail.restrict = "^áéíóúÁÉÍÓÚñÑ*/?¿¡!|,;:{}[]()=%$# ";
			inputName.restrict = "^*/#$%&@!¡¿?:;,.-_{}[]=";
			
			inputName.tabIndex = 1;
			inputCompany.tabIndex = 2;
			inputPhone.tabIndex = 3;
			inputMail.tabIndex = 4;
			mcEnviar.tabIndex = 5;
			mcBorrar.tabIndex = 6;
			
			if ( Site.getApp() ) {
				Site.getApp().addEventListener( WebSite.LANGUAGE_CHANGED, lang_changed);
				lang_changed(undefined);
			}
		}
		
		private function lang_changed(e:Event):void 
		{
			if ( Site.getApp().getLanguage() == Site.SPANISH ) {
				gotoAndStop(1);
				mcEnviar.setData( { label: "enviar" } );
				mcBorrar.setData( { label: "borrar" } );
			} else {
				gotoAndStop(2);
				mcEnviar.setData( { label: "submit" } );
				mcBorrar.setData( { label: "reset" } );
			}
		}
		
		public function collectVars():Object {
			var o:Object = new Object();
			o.name = inputName.text;
			o.company = inputCompany.text;
			o.phone = inputPhone.text;
			o.mail = inputMail.text;
			return o;			
		}
		
		private function send_mail(e:MouseEvent):void {
			var bError:Boolean = false;
			if (inputName.text == "" || inputName.text.length < 3) {
				bError = true;
				registerTween("alphaErrorName", new Tween( errorName, "alpha", Regular.easeOut, 1, 0, 3, true));
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
			if (bError) return;
			dispatchEvent( new Event(Event.CHANGE) );
		}
		
		public function erase_fields(e:MouseEvent):void {
			inputName.text = inputCompany.text = inputPhone.text = inputMail.text = "";
		}
			
	}
	
}