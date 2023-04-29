public with sharing class ContactController {
    
    @AuraEnabled
    public static List<Contact> getContacts(String Objectname,String name) {
        if(name == null){
            return Database.query('Select id,Name from Contact');
        }else{
            String query = 'Select id,Name from ' + Objectname + 'where Name =' + name;
            return Database.query(query);           
        }
    }
    
    @AuraEnabled
    public static List<Contact> saveContacts(String contactList){
        List<Contact> listofContact = (List<Contact>) JSON.deserialize(contactList, List<Contact>.class);
        try{
            upsert listofContact;
        }catch(Exception e){
            System.debug('Exception '+e.getMessage());
        }
        return listofContact;
    }
    
    @AuraEnabled
    public static Contact newContact(){
        return new Contact();
    }
    
    
}