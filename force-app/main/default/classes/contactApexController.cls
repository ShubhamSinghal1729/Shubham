/* Name : contactApexController
*/
public with sharing class contactApexController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> listofContact(Id accountId) {
         List<Contact> listofContact = new List<Contact>();
         listofContact = [Select id,FirstName,LastName,Account__r.Name,Account__c from Contact where AccountId =: accountId];
         if(listofContact.size() > 0){
            return listofContact;
         }else{
           Contact contactObj = new Contact();
           contactObj.FirstName = '';
           contactObj.LastName = '';
           contactObj.AccountId = accountId;
           listofContact.add(contactObj);
           return listofContact;
         }
    }

    @AuraEnabled
    public static List<Contact> saveContact(List<Contact> listofContact){
      try {
        upsert listofContact;
        return listofContact;
      } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }

    @AuraEnabled
    public static List<Contact> newContact(List<Contact> listofContact,Id accountId){
      try {
          Contact contactObj = new Contact();
          contactObj.FirstName = '';
          contactObj.LastName = '';
          contactObj.AccountId = accountId;
          listofContact.add(contactObj);
          return listofContact;
        
      } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }

}