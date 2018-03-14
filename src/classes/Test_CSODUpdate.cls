public  class Test_CSODUpdate {

 
    
    public static void getCSODUserInfo(){
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();        
        Http http = new Http();

        CSOD_Settings__c csodDefaults = CSOD_Settings__c.getValues('Default');
		String csodUsername = csodDefaults.username__c;
        String csodPassword = csodDefaults.password__c;
        
        XmlStreamWriter w = new XMLStreamWriter();
        w.writeStartElement('SOAP-ENV', 'Envelope', 'http://schemas.xmlsoap.org/soap/envelope/');
        w.writeNamespace('SOAP-ENV', 'http://schemas.xmlsoap.org/soap/envelope/');
        w.writeStartElement('SOAP-ENV', 'Header', '');
        w.writeStartElement('wsse', 'Security', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');
		w.writeNamespace('wsse', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');
        w.writeStartElement('wsse', 'UsernameToken', '');
        w.writeStartElement('wsse', 'Username', '');
        w.writeCharacters(csodUsername);
        w.writeEndElement(); //End wsse:Username
        w.writeStartElement('wsse', 'Password', '');
        w.writeAttribute('', '', 'Type', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText');
        w.writeCharacters(csodPassword);
        w.writeEndElement(); //End wsse:Username
        w.writeEndElement(); //End wsse:UsernameToken
        w.writeEndElement(); //End wsse:Security
        w.writeEndElement(); //End SOAP-ENV:Header
        
        w.writeStartElement('SOAP-ENV', 'Body', '');
        w.writeStartElement('m', 'GetUser', 'urn:Cornerstone:ClientDataService');
        w.writeNamespace('m', 'urn:Cornerstone:ClientDataService');
        w.writeStartElement('m', 'strUserId', '');
        w.writeCharacters('mpatel');
        w.writeEndElement(); //End m:strUserId
        w.writeEndElement(); //End m:GetUser
        w.writeEndElement(); //End SOAP-ENV:Body
		w.writeEndElement(); //End SOAP-ENV:Envelope
        
        String strReq= w.getXmlString();
        w.close();
        
		System.debug(strReq);        
        req.setEndpoint('https://ws-calix-pilot.csod.com/feed30/clientdataservice.asmx');
        req.setMethod('POST');
        req.setHeader('Accept-Encoding','gzip,deflate');
		req.setHeader('Content-Type', 'text/xml;charset=UTF-8'); 
        req.setHeader('SOAPAction', 'GetUser');
        
        req.setBody(strReq);

        try {
            System.debug('Request Body >>>> ' + strReq);
            res = http.send(req);
            System.debug(res);
            System.debug('Response Body >>>> ' + res.getBody());
            
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }

    }

    public static void csod_SetOu(){
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();        
        Http http = new Http();
        CSOD_Settings__c csodDefaults = CSOD_Settings__c.getValues('Default');
		String csodUsername = csodDefaults.username__c;
        String csodPassword = csodDefaults.password__c;
        
        XmlStreamWriter w = new XMLStreamWriter();
        w.writeStartElement('SOAP-ENV', 'Envelope', 'http://schemas.xmlsoap.org/soap/envelope/');
        w.writeNamespace('SOAP-ENV', 'http://schemas.xmlsoap.org/soap/envelope/');
        w.writeStartElement('SOAP-ENV', 'Header', '');
        w.writeStartElement('wsse', 'Security', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');
		w.writeNamespace('wsse', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');
        w.writeStartElement('wsse', 'UsernameToken', '');
        w.writeStartElement('wsse', 'Username', '');
        w.writeCharacters(csodUsername);
        w.writeEndElement(); //End wsse:Username
        w.writeStartElement('wsse', 'Password', '');
        w.writeAttribute('', '', 'Type', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText');
        w.writeCharacters(csodPassword);
        w.writeEndElement(); //End wsse:Username
        w.writeEndElement(); //End wsse:UsernameToken
        w.writeEndElement(); //End wsse:Security
        w.writeEndElement(); //End SOAP-ENV:Header
        
        w.writeStartElement('SOAP-ENV', 'Body', '');
        w.writeStartElement('urn', 'SetOus', 'urn:Cornerstone:ClientDataService');
        w.writeNamespace('urn', 'urn:Cornerstone:ClientDataService');
        w.writeStartElement('urn1', 'Ous', 'urn:Cornerstone:ClientData');
        w.writeNamespace('urn1', 'urn:Cornerstone:ClientData');
        
        	w.writeAttribute('', '', 'Id', '10001575');
        	w.writeAttribute('', '', 'Parent', 'AGNC');
        	w.writeAttribute('', '', 'Name', 'Fed Bid');
        	w.writeAttribute('', '', 'Type', 'AGNC');
        	w.writeAttribute('', '', 'Active', '1');
        	w.writeAttribute('', '', 'Owner', 'mpatel');
        	w.writeAttribute('', '', 'AllowReconcile', '1');
        
        w.writeStartElement('urn1', 'Ou', 'urn:Cornerstone:ClientData');
        w.writeEndElement(); //End urn1:Ou
        
        w.writeEndElement(); //End urn1:Ous
        w.writeEndElement(); //End urn:SetOus
        w.writeEndElement(); //End SOAP-ENV:Body
		w.writeEndElement(); //End SOAP-ENV:Envelope
        
        String strReq= w.getXmlString();
        w.close();
        
		System.debug(strReq);        
        req.setEndpoint('https://ws-calix-pilot.csod.com/feed30/clientdataservice.asmx');
        req.setMethod('POST');
        req.setHeader('Accept-Encoding','gzip,deflate');
		req.setHeader('Content-Type', 'text/xml;charset=UTF-8'); 
        req.setHeader('SOAPAction', 'SetOus');
        
        req.setBody(strReq);

        try {
            System.debug('Request Body >>>> ' + strReq);
            res = http.send(req);
            System.debug(res);
            System.debug('Response Body >>>> ' + res.getBody());
            
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }

    }


}