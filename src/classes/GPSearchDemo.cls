public class GPSearchDemo{

    public String responseTime { get; set; }

    public String endpoint { get; set;}
    public String queryString { get; set; }
    public String queryResult { get; set;}
    
    
     public PageReference save() {
       
        return null;
    }
    
    public PageReference search() {
       HttpRequest req = new HttpRequest(); 
       HttpResponse res = new HttpResponse();
 

    
    Http http = new Http();
    req.setEndpoint(endpoint);
    req.setMethod('GET');
    req.setCompressed(true); // otherwise we hit a limit of 32000

    try {
        System.debug('Starting HTTP Send');
        Long lResponseTime = System.currentTimeMillis();
        res = http.send(req);
        lResponseTime = System.currentTimeMillis() - lresponseTime;
        responseTime = String.valueOf(lResponseTime)+ ' ms';
        queryResult = res.getBody();
        
        System.debug('HTTP Response:');
        System.debug(res.toString());
        System.debug(res.getBody());
        
        
    } catch(System.CalloutException e) {
        System.debug('Callout error: '+ e);
        System.debug(res.toString());
        queryResult = 'Error: ' + res.toString();
    }
        return null;
    }
    
    public GPSearchDemo(){
        endpoint = 'http://www.google.com/webhp#q=';
    }
}