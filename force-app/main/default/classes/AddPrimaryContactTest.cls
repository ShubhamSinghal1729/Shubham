@isTest
public class AddPrimaryContactTest {
    
    static  testmethod void AddPrimaryContactObject(){
        List<Account> listofAccount = new List<Account>();
        Contact contactObject = new Contact(LastName = 'Test');
        insert contactObject;
        for(Integer i = 0; i<100; i++){
            Account accountObject = new Account();
            accountObject.Name = 'Test' + i;
            if(i < 50)
            accountObject.BillingState = 'NY';
            else
            accountObject.BillingState = 'CA';
            listofAccount.add(accountObject);           
        }
        insert listofAccount;
        AddPrimaryContact obj = new AddPrimaryContact(contactObject,'CA');
        System.enqueueJob(obj);

    }

}