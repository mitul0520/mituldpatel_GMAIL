/*
// 
// (c) 2014 Appirio, Inc.
//
// Test_CalloutTestController
//
//
// 20 Aug 2014     mpatel@appirio.com    Original
// 
//
*/ 

@isTest (SeeAllData=true)

private class calloutTestControllerTest {
  static testMethod void testCalloutTestController(){
    CalloutTestController ctc = new CalloutTestController();    
    ctc.getreqTypeLst();
    ctc.getcontentTypeLst();
    ctc.callout(); //throw the no requst type err
    ctc.endpoint  = '';
    ctc.callout(); //throw the no endpoint err
    ctc.endpoint = 'http://en.wikipedictc.org/w/api.php';
    ctc.reqType = 'POST';
    ctc.callout(); //throw the no content type err
    ctc.contentType = 'application/json';
    ctc.basicAuth = true;
    ctc.uname = 'safd';
    ctc.pwd = 'hjk';
    ctc.callout();  //  null reqBody throws exception to cover catch block
    ctc.reqBody = '';
    ctc.callout();  // test of a valid POST
    ctc.urlParm = '?thisgumtasteslikerubber';
    ctc.reqType = 'GET';
    ctc.utf8Encode = true;
    ctc.callout(); // test of  valid GET
    
  } 
}