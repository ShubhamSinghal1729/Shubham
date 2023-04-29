@isTest
private class AccountManagerTest {
    @isTest
    static void executeAccountManager(){
        Account accObj = new Account();
        accObj.name = 'Test';
        insert accObj;
        Contact conObj = new Contact();
        conObj.LastName = 'Test';
        insert conObj;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://https://lightningalgoworks-dev-ed.my.salesforce.com/services/apexrest/Cases/'
            + accObj.id;
        request.httpMethod = 'GET';
        RestContext.request = request;
        AccountManager.getAccount();
    }

}