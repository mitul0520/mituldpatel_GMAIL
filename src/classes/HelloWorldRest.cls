@RestResource(urlMapping='/helloWorld/*')

global with sharing class HelloWorldRest {

    global class rowClass {
        List<String> row {get;set;}
    } 
        
@HttpGet
  global static String getHelloWorld() {

    return 'Hello World!!';
    
  }
  
@HttpPost
  global static rowClass postHelloWorld(rowClass row0) {

    //List<String> resp = new List<String> { 'Hello', 'World' };
    rowClass row1 = new rowClass();
    row1.row = new List<String> { 'Hello', 'World' };
    return row1;
    
  }

}