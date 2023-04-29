@RestResource(urlMapping='/Account/*')
global class AccountManager {  
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String AccountId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Account acc = [Select id,name,(Select id,firstname,Lastname from Contacts) from Account where Id =: AccountId];
        return acc;
    }
}