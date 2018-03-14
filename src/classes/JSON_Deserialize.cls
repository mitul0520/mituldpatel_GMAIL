public with sharing class JSON_Deserialize {

    public class OAuthTokenResponse{
        String access_token;
        String token_type;
        UserClass user;
        String refresh_token;
        String expires_in;        
    }
    
    public class UserClass{
        String id;
        String name;
        String global_id;
    }
    
    public static void jDeserialize(){
        
        String jsonString = '{"access_token":"1~XtR14R84hK1ImDkHrpgNGZnacdKVhAuPGsMsBwHcSRnwiWXQEurvxqZuVYbUmlvl","token_type":"Bearer","user":{"id":2218101,"name":"Jonathan Olerud","global_id":"10000002218101"},"refresh_token":"1~hTySw1Ahhxh77uTNp34793fQXZnZc47uPfX76mKQwcCOdssbQNJKLA4AdjYH5Mcg","expires_in":3600}';
        OAuthTokenResponse objResponse = (OAuthTokenResponse)System.JSON.deserialize(jsonString, OAuthTokenResponse.class);
        
        System.debug('==== TIME: '+ System.currentTimeMillis());
        System.debug('==== Deserialize object: ' + objResponse);
        System.debug('==== Access Token: ' + objResponse.access_token);
        System.debug('==== Token Type: ' + objResponse.token_type);

		String userid = UserInfo.getUserId();
        if(userid != null){
            User myUser = [Select id, name, email from user where id=:userid];
            System.currentTimeMillis();
            System.debug('===== My user: ' + myUser);
            update(myUser);
        }
        
    }
}