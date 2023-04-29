public class AddPrimaryContact implements Queueable {

    
    String state;
    Contact contactObject;
    List<Contact> listofContact;
    
    public AddPrimaryContact(Contact contactObject, String state) {
        this.state = state;
        this.contactObject = contactObject;
        listofContact = new List<Contact>();
    }
    public void execute(QueueableContext context) {
        for (Account account : [Select id from Account where BillingState =: state LIMIT 200]) {
          Contact contactObj = contactObject.clone();
          contactObj.AccountId = account.id;
          listofContact.add(contactObj);
        }
        insert listofContact;
    }
}