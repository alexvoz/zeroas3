package com.dmotiko.elemento {
	import com.general.*;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
		
	public class ContactoEnvio
	extends BaseClip {
		
		public var mcEnviar:ElementoBtn;
		public var mcBorrar:ElementoBtn;
		public var inputName:TextField;
		public var inputMail:TextField;
		public var inputComment:TextField;
		public var errorName:Sprite;
		public var errorMail:Sprite;
		public var errorComment:Sprite;
				
		override protected function initClip():void {
			if ( Site.getApp() && Site.getApp().getLanguage() != Site.SPANISH ) {
				mcEnviar.setData( { label: "submit" } );
				mcBorrar.setData( { label: "reset" } );
			} else {
				mcEnviar.setData( { label: "enviar" } );
				mcBorrar.setData( { label: "borrar" } );	
			}
			
			mcBorrar.addEventListener( MouseEvent.CLICK, erase_fields);
			mcEnviar.addEventListener( MouseEvent.CLICK, send_mail);
			erase_fields(undefined);
			
			errorName.alpha = 0;
			errorMail.alpha = 0;
			errorComment.alpha = 0;
			
			inputMail.restrict = "^áéíóúÁÉÍÓÚñÑ*/?¿¡!|,;:{}[]()=%$# ";
			inputName.restrict = "^*/#$%&@!¡¿?:;,.-_{}[]=";
			
			inputName.tabIndex = 1;
			inputMail.tabIndex = 2;
			inputComment.tabIndex = 3;
			mcEnviar.tabIndex = 4;
			mcBorrar.tabIndex = 5;
		}
		
		public function collectVars():Object {
			var o:Object = new Object();
			o.name = inputName.text;
			o.mail = inputMail.text;
			o.comment = inputComment.text;
			return o;			
		}
		
		private function send_mail(e:MouseEvent):void {
			var bError:Boolean = false;
			if (inputName.text == "" || inputName.text.length < 3) {
				bError = true;
				registerTween("alphaErrorName", new Tween( errorName, "alpha", Regular.easeOut, 1, 0, 3, true));
			}
			if (inputComment.text == "" || inputComment.text.length < 3) {
				bError = true;
				registerTween("alphaErrorComment", new Tween( errorComment, "alpha", Regular.easeOut, 1, 0, 3, true));
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
			inputName.text = inputMail.text = inputComment.text = "";
		}
			
	}
	
}