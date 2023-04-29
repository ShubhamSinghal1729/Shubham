@isTest
public class AccountProcessorTest {
    
    @isTest
    static void AccountProcessorMethod(){
        List<Id> listofIds = new List<Id>();
        Account accountObject = new Account();
        accountObject.Name = 'Test';
        insert accountObject;
        Contact contactObject = new Contact();
        contactObject.LastName = 'Test';
        contactObject.AccountId = accountObject.id;
        insert contactObject;
        listofIds.add(accountObject.id);
        Test.startTest();
        AccountProcessor.countContacts(listofIds);
        Test.stopTest();
        
    }

}