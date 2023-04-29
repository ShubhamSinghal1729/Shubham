public class AccountTriggerHandler {
    
    String clientId = '3MVG9n_HvETGhr3AYnWpIcXxU212UCKqxsL7MOrtRMt_tGutZhEsZU2XN2kgqAsr_Ps_228_khkgDXCYTaQst';
    String clientsecret='5381EA60073D22E16771CEFFE6452576BDFADA0563B80851A059AE5C5947D258';
    String username= 'shubham.singhal@einstein.com';
    String password= 'Sapient@12345678HGcioRE8LouHunSzPpVyKsOk';
    String accesstoken_url= 'https://login.salesforce.com/services/oauth2/token';
    String authurl= 'https://login.salesforce.com/services/oauth2/authorize';
    
    public class deserializeResponse {
        public String id;
        public String access_token;
    }
    
    public String ReturnAccessToken(AccountTriggerHandler Acc){
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        // String reqbody='{“grant_type”:”password”,”client_id”:clientId,”client_secret”:clientSecret,“username”:username,”password”:password}’;
        Http h= new Http();
        HttpRequest req= new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res=h.send(req);
        System.debug('@@@@@@@@@@@@res.getBody()'+res.getBody());
        deserializeResponse resp1= (deserializeResponse)JSON.deserialize(res.getBody(),deserializeResponse.class);
        System.debug('@@@@@@@@@@resp1'+resp1);
        return resp1.access_token;
    }
    @future(callout=true)
    public static void createAccount(String Accname){
        AccountTriggerHandler acc1= new AccountTriggerHandler();
        String accessToken=acc1.ReturnAccessToken(acc1);
        System.debug('@@@@@@@@@@accessToken'+accessToken);
        if(accessToken!=null){
            String endPoint='https://ap16.salesforce.com/services/data/v32.0/sobjects/Account';  
            String jsonstr='{"Name":"'+ Accname +'"}';
            Http h2= new Http();
            HttpRequest req2= new HttpRequest();
            req2.setHeader('Authorization','Bearer ' + accessToken);
            req2.setHeader('Content-Type','application/json');
            req2.setHeader('accept','application/json');
            req2.setBody(jsonstr);
            req2.setMethod('POST');
            req2.setEndpoint(endPoint);
            HttpResponse res2=h2.send(req2);
            System.debug('@@@@@@@@@@@@@@resr2'+res2);
            deserializeResponse deresp =  (deserializeResponse)System.JSON.deserialize(res2.getBody(),deserializeResponse.class);
            System.debug('@@@@@@@@@@@@@@@'+deresp);
        }
    }

}