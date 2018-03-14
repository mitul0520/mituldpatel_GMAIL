@RestResource (urlMapping='/contact/v1/*')
global class MyRestService{
 @HTTPPost
     global static ID doPost(String cLastName, Account a){
     Contact c = new Contact(lastName = cLastName, AccountId = a.Id);
         insert c;
         return c.id;
     }
     
}