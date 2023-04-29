public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> listofAccountIds)
    {
        List<Account> listofAccounttoUpdate = new List<Account>();
        for(Account accountObject : [Select id,Number_of_Contacts__c,(Select id from Contacts) from Account where id IN: listofAccountIds]){
            accountObject.Number_of_Contacts__c = accountObject.Contacts.size();
            listofAccounttoUpdate.add(accountObject);
        }
        update listofAccounttoUpdate;
    }

}