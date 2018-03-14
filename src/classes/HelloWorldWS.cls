global  class HelloWorldWS{

    webService static String helloWorld(String name){
     List <Account> accounts = [select name, phone from account];
     return 'Hello ' + name + '; First Account: ' + accounts[0].name + accounts[0].phone ;
    }
}