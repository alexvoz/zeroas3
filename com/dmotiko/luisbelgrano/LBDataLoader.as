package com.dmotiko.luisbelgrano {
	import com.general.DataXMLLoader;
	import flash.xml.*
	import flash.net.*
	import flash.events.*
	
	class LBDataLoader
	extends DataXMLLoader {
		
		function LBDataLoader(src:String) {
			super(src);
		}
		
		override protected function parse( evnt:Event ):void {
			var aPortfolio:Array = new Array();
			
			
			try{
				//Convert the downloaded text into an XML
				var myXML:XML = new XML(evnt.target.data);
				var xml:XML = myXML.children()[0].child("items").child("portfolio_item")[0];
				trace(xml.child("photos").length());
				trace(xml.child("photos").child("photo")[0].child("description").children()[0].toXMLString());
				//walks the list and show in textfields
				
			} catch (e:TypeError){
				//Could not convert the data, probavlu because
				//because is not formated correctly
				if( LBSite.getApp() ){
					LBSite.getApp().log("Could not parse the XML");
					LBSite.getApp().log(e.message);
				}
			}
		}
		
	}
	
}